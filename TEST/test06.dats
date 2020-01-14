#include "share/atspre_staload.hats"

(** Test PortAudio Raw bindings **)
staload "./../SATS/RAW/portaudio.sats"

#define null the_null_ptr

#define cptrW cptr_wvar
#define cptrR cptr_rvar

#define SAMPLE_RATE 48000.0
#define FRAMES_PER_BUFFER 64UL

staload "libats/libc/SATS/stdlib.sats"
macdef RAND_MAX = $extval(int,"RAND_MAX")

fun process ( 
  inp : ptr
, out : ptr
, nframes : ulint
, time_info : cPtr0(PaStreamCallbackTimeInfo)
, flags : PaStreamCallbackFlags
, data : ptr 
) : PaStreamCallbackResult = paContinue where {
      val [n:int] (nframes : ulint n) = g1ofg0( nframes )  
      val (pfarr, pf | p) 
        = $UNSAFE.ptr0_vtake{ @[float][2*n] }( out )

    fun fill{n,m:nat | m <= n}( arr: &(@[float][n]), n: size_t m ) 
      : void = 
          if n > 0
          then fill(arr,n-1) where {
            val () =  (arr[n-1] := g0int2float(rand())/g0int2float(RAND_MAX))
          }
          else () 

      val sz : size_t(2*n) = $UNSAFE.cast{size_t(n)}( nframes )*2

      val () = fill( !p, sz )

      prval () = pf(pfarr)
    } 


implement main0 () 
  = println!("Hello [test06]") where {
    val err = Pa_Initialize()
    val () = assert_errmsg2( err = paNoError
        , "Could not initiate PortAudio", Pa_GetErrorText(err))


    var stream : cPtr0(PaStream)
    var inputParams : PaStreamParameters
    var outputParams : PaStreamParameters
   

    val input_device  = Pa_GetDefaultInputDevice()
    val input_info    = Pa_GetDeviceInfo( input_device )
 
    val () = assert_errmsg( 
          cptr_isnot_null(input_info)
        , "Input device info is null"
      )
    val output_device = Pa_GetDefaultOutputDevice() 
    val output_info   = Pa_GetDeviceInfo( output_device )

    val () = assert_errmsg(
           cptr_isnot_null(output_info)
        , "Output device info is null"
      )

    val (pfi,pfif | pi ) = $UNSAFE.cptr_vtake(input_info)
    val (pfo,pfof | po ) = $UNSAFE.cptr_vtake(output_info)
 
    val () = (
      inputParams.device  := Pa_GetDefaultInputDevice(); 
      inputParams.channelCount := 2;
      inputParams.sampleFormat := paFloat32;
      inputParams.hostApiSpecificStreamInfo := null;
      inputParams.suggestedLatency := !pi.defaultLowInputLatency 
    )
    prval () = pfif( pfi ) 

    val () = (
      outputParams.device := Pa_GetDefaultOutputDevice(); 
      outputParams.channelCount := 2;
      outputParams.sampleFormat := paFloat32;
      outputParams.hostApiSpecificStreamInfo := null;
      outputParams.suggestedLatency := !po.defaultLowInputLatency 
    )
    prval () = pfof( pfo ) 

    val err = Pa_OpenStream( 
          cptrW{cPtr0(PaStream)}(stream)
        , cptr_null() //cptrR(inputParams)
        , cptrR(outputParams)
        , SAMPLE_RATE
        , FRAMES_PER_BUFFER
        , paNoFlag
        , process
        , null 
      )  
    
    val () = assert_errmsg2( err = paNoError
        , "Could not open PortAudio stream", Pa_GetErrorText(err))

    val err = Pa_StartStream( stream )

    val () = assert_errmsg2( err = paNoError
        , "Could not start PortAudio stream", Pa_GetErrorText(err))

    val ()  = Pa_Sleep(5000L)

    val err = Pa_StopStream( stream )

    val () = assert_errmsg2( err = paNoError
        , "Could not stop PortAudio stream", Pa_GetErrorText(err))

    val err = Pa_CloseStream( stream )

    val () = assert_errmsg2( err = paNoError
        , "Could not close PortAudio stream", Pa_GetErrorText(err))

    val err = Pa_Terminate()

    val () = assert_errmsg2( err = paNoError
        , "Could not terminate PortAudio", Pa_GetErrorText(err))

  }
