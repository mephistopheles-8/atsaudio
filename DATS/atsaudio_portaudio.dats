(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"
staload "./../SATS/atsaudio.sats"
#include "./../HATS/atsaudio_infix.hats"
staload "./../SATS/RAW/portaudio.sats"

#define null the_null_ptr

#define cptrW cptr_wvar
#define cptrR cptr_rvar

implement {}
audio_system_init() = 
     assert_errmsg2( err = paNoError
      , "[atsaudio] Could not initialize PortAudio: ", Pa_GetErrorText(err))
    where {
     val err = Pa_Initialize()
    }

implement {}
audio_system_shutdown() = 
     assert_errmsg2( err = paNoError
      , "[atsaudio] Could not shutdown PortAudio: ", Pa_GetErrorText(err))
    where {
     val err = Pa_Terminate()
    }

implement {}
audio_io_desired_sample_rate() = i2sz(48000)
implement {}
audio_io_desired_blocksize() = i2sz(256)

local
vtypedef audio_io_portaudio(sin:int,sout:int) = @{
    stream = cPtr0(PaStream)
  , sin = size_t sin
  , sout = size_t sout
  , t = size_t
  , inbuf = ptr
  , outbuf = ptr
}
absvt@ype audio_io_portaudio0(sin:int,sout:int) = audio_io_portaudio(sin,sout)
absimpl audio_io(sin,sout) = aPtr1( audio_io_portaudio0(sin,sout) )

(** One of the cptr types in the record were complaining on calls to aptr_get_elt/aptr_set_elt; 
    the opaque implementation seems to circumvent the issue.
**)
extern
castfn audio_io_portaudio_reveal{sin,sout:nat}( audio_io_portaudio0(sin,sout) ) 
  : audio_io_portaudio(sin,sout) 
extern
castfn audio_io_portaudio_conceal{sin,sout:nat}( audio_io_portaudio(sin,sout) ) 
  : audio_io_portaudio0(sin,sout) 

symintr reveal conceal
overload reveal with audio_io_portaudio_reveal
overload conceal with audio_io_portaudio_conceal
in


fun {} audio_portaudio_stream_init{cin,cout:nat}( 
    sin: size_t cin
  , sout: size_t cout
  , process : PaStreamCallback
  , data : ptr  
) : cPtr0( PaStream ) = stream where {
      var stream : cPtr0(PaStream)
      
      var inputParams : PaStreamParameters
      var outputParams : PaStreamParameters
     
      val input_device  = Pa_GetDefaultInputDevice()
      val input_info    = Pa_GetDeviceInfo( input_device )
   
      val () = assert_errmsg( 
            cptr_isnot_null(input_info)
          , "[atsaudio] PortAudio input device unrecognized"
        )
      val output_device = Pa_GetDefaultOutputDevice() 
      val output_info   = Pa_GetDeviceInfo( output_device )

      val () = assert_errmsg( 
            cptr_isnot_null(output_info)
          , "[atsaudio] PortAudio output device unrecognized"
        )

      val (pfi,pfif | pi ) = $UNSAFE.cptr_vtake(input_info)
      val (pfo,pfof | po ) = $UNSAFE.cptr_vtake(output_info)
   
      val () = (
        inputParams.device  := input_device; 
        inputParams.channelCount := sz2i(sin);
        inputParams.sampleFormat := paFloat32;
        inputParams.hostApiSpecificStreamInfo := null;
        inputParams.suggestedLatency := !pi.defaultLowInputLatency 
      )
      prval () = pfif( pfi ) 

      val () = (
        outputParams.device := output_device; 
        outputParams.channelCount := sz2i(sout);
        outputParams.sampleFormat := paFloat32;
        outputParams.hostApiSpecificStreamInfo := null;
        outputParams.suggestedLatency := !po.defaultLowOutputLatency 
      )
      prval () = pfof( pfo )

      val sr = g0int2float(sz2i( audio_io_desired_sample_rate<>() ))

      val () = assert_errmsg(
           Pa_IsFormatSupported(
            if sin > 0 then cptrR(inputParams) else cptr_null()
          , if sout > 0 then cptrR(outputParams) else cptr_null(), sr) = paFormatIsSupported
        , "[atsaudio] Portaudio does not support the given format" ) 
 
      val err = Pa_OpenStream( 
            cptrW{cPtr0(PaStream)}(stream)
          , if sin > 0 then cptrR(inputParams) else cptr_null()
          , if sout > 0 then cptrR(outputParams) else cptr_null()
          , sr
          , $UNSAFE.cast{ulint}( audio_io_desired_blocksize<>() )
          , paNoFlag
          , process
          , data 
        )
      (* 
      val err = Pa_OpenDefaultStream( 
            cptrW{cPtr0(PaStream)}(stream)
          , sz2i(sin)
          , sz2i(sout)
          , paFloat32
          , SAMPLE_RATE
          , FRAMES_PER_BUFFER
          , process
          , data 
        )
      *)
      val () = assert_errmsg2( err = paNoError
          , "[atsaudio] Could not open PortAudio stream: ", Pa_GetErrorText(err))

    }
 

implement {}
audio_io_init{cin,cout}(sin,sout) 
  = let
      (** It would be nice if this were more telling... **)
      val impl : audio_io_portaudio(cin,cout) = @{
            stream = cptr_null()
          , sin = sin
          , sout = sout
          , t = i2sz(0)
          , inbuf = the_null_ptr
          , outbuf = the_null_ptr
        }
     in aptr_make_elt<audio_io_portaudio0(cin,cout)>(conceal(impl))
    end


implement {}
audio_io_free{cin,cout}(aio) 
  = let
      var impl : audio_io_portaudio(cin,cout) 
        = reveal(aptr_get_elt<audio_io_portaudio0(cin,cout)>( aio ))
       val stream = impl.stream
       val () = impl.stream := cptr_null() 
       val () 
          = if cptr_isnot_null( stream ) 
            then assert_errmsg2( err = paNoError
                , "[atsaudio] Could not stop PortAudio stream: ", Pa_GetErrorText(err)) where {
                  val err = Pa_StopStream( stream )
                }
        
        val () = aptr_set_elt<audio_io_portaudio0(cin,cout)>( aio, conceal(impl) )
      
      val impl : audio_io_portaudio(cin,cout) 
        = reveal(aptr_getfree_elt<audio_io_portaudio0(cin,cout)>( aio ))

     in 
    end


implement {}
audio_io_process_beg{cin,cout,t}(aio,szt) = {

    var impl : audio_io_portaudio(cin,cout) 
      = reveal(aptr_get_elt<audio_io_portaudio0(cin,cout)>( aio ))

    val () = impl.t := i2sz(0)

    val () = aptr_set_elt<audio_io_portaudio0(cin,cout)>( aio, conceal(impl) )

  }

implement {}
audio_io_process_end{cin,cout}(aio) = ()

implement {}
audio_io_blocksize{cin,cout}(aio) 
  = audio_io_desired_blocksize<>()

implement {}
audio_io_sample_rate{cin,cout}(aio) 
  = audio_io_desired_sample_rate<>()


implement {}
audio_io_sample_in{cin,cout}(aio, buf) = {
    extern praxi
    is_initized{a:t@ype+}{n:nat}( &(@[float?][n]) >> @[float][n] ) : void
    prval () = is_initized( buf )

    var impl : audio_io_portaudio(cin,cout) 
      = reveal(aptr_get_elt<audio_io_portaudio0(cin,cout)>( aio ))
   
     vtypedef env 
        = @(size_t, ptr)
   
    var e0 : env = @(impl.t*impl.sin, impl.inbuf )

    val _ = array_foreach_env<float><env>( buf, impl.sin, e0 ) where {
            implement
            array_foreach$fwork<float><env>( x, env ) = ( 
                x := $UNSAFE.ptr0_get<float>( 
                    ptr_add<float>( p, i ) 
                  );
                env.0 := i + 1; 
            ) where {
              val i = env.0
              val p = env.1
            }
        }

    val () = aptr_set_elt<audio_io_portaudio0(cin,cout)>( aio, conceal(impl) )
  }

implement {}
audio_io_sample_out{cin,cout}(aio, buf) = {

    var impl : audio_io_portaudio(cin,cout) 
      = reveal(aptr_get_elt<audio_io_portaudio0(cin,cout)>( aio ))
     
    vtypedef env 
        = @(size_t, ptr)
    
    var e0 : env = @(impl.t*impl.sout, impl.outbuf )

    val _ = array_foreach_env<float><env>( buf, impl.sout, e0 ) where {
            implement
            array_foreach$fwork<float><env>( x, env ) = ( 
                $UNSAFE.ptr0_set<float>( 
                    ptr_add<float>( p, i ), x
                );
                env.0 := i + 1; 
            ) where {
              val i = env.0
              val p = env.1
            }
        }
   
    val () = impl.t := impl.t + 1
 
    val () = aptr_set_elt<audio_io_portaudio0(cin,cout)>( aio, conceal(impl) )

  }


fun {p:audioproc}{cin,cout:int}
audio_portaudio_process{cin >= 0; cout >= 0}( 
    inp : ptr
  , out : ptr
  , nframes : ulint
  , time_info : cPtr0(PaStreamCallbackTimeInfo)
  , flags : PaStreamCallbackFlags
  , audio : &audio(cin,cout,p)
) : PaStreamCallbackResult = paContinue where {

    val aio = UN_audio_get_io( audio )
    var impl : audio_io_portaudio(cin,cout) 
      = reveal(aptr_get_elt<audio_io_portaudio0(cin,cout)>( aio ))

    val () = impl.inbuf := inp 
    val () = impl.outbuf := out

    val () = aptr_set_elt<audio_io_portaudio0(cin,cout)>( aio, conceal(impl) )
    prval () = $UNSAFE.cast2void( aio )
    val () 
    = (
      if flags lhas paInputOverflow then fprintln!(stderr_ref,"[atsaudio] paInputOverflow");
      if flags lhas paInputUnderflow then fprintln!(stderr_ref,"[atsaudio] paInputUnderflow");
      if flags lhas paOutputOverflow then fprintln!(stderr_ref,"[atsaudio] paOutputOverflow");
      if flags lhas paOutputUnderflow then fprintln!(stderr_ref,"[atsaudio] paOutputUnderflow");
      if flags lhas paPrimingOutput then fprintln!(stderr_ref,"[atsaudio] paPrimingOutput");
    )

    val () = audio_process<p><cin,cout>( audio, $UNSAFE.cast{[t:nat] size_t t}(nframes) )

  } 

implement {proc}{cin,cout} 
audio_run(  audio ) = {
    val aio = UN_audio_get_io( audio )
    var impl : audio_io_portaudio(cin,cout) 
      = reveal(aptr_get_elt<audio_io_portaudio0(cin,cout)>( aio ))

    val stream = audio_portaudio_stream_init( impl.sin, impl.sout, $UNSAFE.cast{PaStreamCallback}(
      audio_portaudio_process<proc><cin,cout>
    ), addr@audio )

    val () = impl.stream := stream     
    val () = aptr_set_elt<audio_io_portaudio0(cin,cout)>( aio, conceal(impl) )
    
    val err = Pa_StartStream( stream )

    val () = assert_errmsg2( err = paNoError
        , "[atsaudio] Could not start PortAudio stream: ", Pa_GetErrorText(err))

    prval () = $UNSAFE.cast2void( aio )
  }

end // [local]

