(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"
staload "./../SATS/atsaudio.sats"
staload "./../SATS/RAW/jack.sats"

implement {}
audio_system_init() = () 
implement {}
audio_system_shutdown() = () 

local
vtypedef audio_io_jack_impl(sin:int,sout:int) = @{
    client = cPtr0(jack_client_t)
  , in_ports  = arrayptr(cPtr0(jack_port_t),sin)
  , out_ports  = arrayptr(cPtr0(jack_port_t),sout)
  , in_buffers  = arrayptr(ptr,sin)
  , out_buffers  = arrayptr(ptr,sout)
  , sin = size_t sin
  , sout = size_t sout
  , t = size_t
}
datavtype audio_io_jack(sin:int,sout:int) =
  | AIO_JACK of audio_io_jack_impl(sin:int,sout:int) 

absimpl audio_io(sin,sout) = audio_io_jack(sin,sout)

in

fun {} 
audio_io_jack_client{cin,cout:nat}( aio: !audio_io(cin,cout) ) : cPtr0( jack_client_t )
  = case+ aio of
    | AIO_JACK(impl) => impl.client 

macdef snprintf(buf,bsz,pattern,value) = 
  let
    typedef
    cstring = $extype"atstype_string"
    val bufp = $UNSAFE.cast{cstring}(addr@,(buf))
    val _(*int*) =
      $extfcall(ssize_t, "snprintf", bufp, ,(bsz), ,(pattern), ,(value))
  in $UNSAFE.cast{string}(addr@,(buf))
  end

implement {}
audio_io_init{cin,cout}(sin,sout) 
  = let
        var status : jack_status_t?
        val client = jack_client_open("atsaudio", JackNullOption, status)

        val () 
          = assert_errmsg( ~cptr_is_null(client)
              , "[atsaudio] Could not open JACK client")

        val in_ports = arrayptr_make_uninitized<cPtr0(jack_port_t)>(sin)
        val out_ports = arrayptr_make_uninitized<cPtr0(jack_port_t)>(sout)

        val in_buffers = arrayptr_make_elt<ptr>(sin,the_null_ptr)
        val out_buffers = arrayptr_make_elt<ptr>(sout,the_null_ptr)
        
        val () = arrayptr_initize<cPtr0(jack_port_t)>(in_ports, sin) where {
            implement
            array_initize$init<cPtr0(jack_port_t)>(i,x) = {
              var buf = @[byte][32]() 
              val input_port
                = jack_port_register( client, snprintf(buf,32,"in-%d",i), JACK_DEFAULT_AUDIO_TYPE, JackPortIsInput, 0UL )
              val () 
                = assert_errmsg( ~cptr_is_null(input_port)
                  , "[atsaudio] Could not open JACK input port")
              val () = x := input_port
            }
          }

        val () = arrayptr_initize<cPtr0(jack_port_t)>(out_ports, sout) where {
            implement
            array_initize$init<cPtr0(jack_port_t)>(i,x) = {
              var buf = @[byte][32]() 
              val output_port 
                = jack_port_register( client, snprintf(buf,32,"out-%d",i), JACK_DEFAULT_AUDIO_TYPE, JackPortIsOutput, 0UL )
              val () 
                = assert_errmsg( ~cptr_is_null(output_port)
                    , "[atsaudio] Could not open JACK output port")
              val () = x := output_port
            }
          }
        
        val impl : audio_io_jack_impl(cin,cout) = @{
            client = client
          , in_ports = in_ports 
          , out_ports = out_ports 
          , in_buffers = in_buffers
          , out_buffers = out_buffers
          , sin = sin
          , sout = sout
          , t = i2sz(0)
        }

     in AIO_JACK( impl )
    end

implement {}
audio_io_free{cin,cout}(aio) 
  = case+ aio of
    | @AIO_JACK( impl ) => 
      let
        (** Deactivate BEFORE freeing, or the process may segfault **)
        val _ = jack_deactivate( impl.client );
        val _ = jack_client_close( impl.client );
      in
        arrayptr_free( impl.in_ports );
        arrayptr_free( impl.out_ports );
        arrayptr_free( impl.in_buffers );
        arrayptr_free( impl.out_buffers );
        free@aio;
      end

implement {}
audio_io_process_beg{cin,cout,t}(aio,szt) = 
  case+ aio of
   | @AIO_JACK( impl ) => {

     vtypedef env(n:int) 
        = @(arrayptr(cPtr0(jack_port_t),n) , sizeBtwe(0,n) , jack_nframes_t)
     (** Get the buffers **)

     (** UGHHHHHH: the cptr issue again **)
     absvt@ype env0(n:int) = env(n)

     extern
     praxi env_reveal{n:int}( &env0(n) >> env(n) ) : void
     extern
     praxi env_conceal{n:int}( &env(n) >> env0(n) ) : void
  
     overload reveal with env_reveal
     overload conceal with env_conceal

    (** **)

     val bsz = $UNSAFE.cast{jack_nframes_t}( szt )

     var env_in : env(cin) = @(impl.in_ports, impl.sin ,bsz)
     var env_out : env(cout) = @(impl.out_ports,impl.sout,bsz)

      implement (n)
      array_foreach$fwork<ptr><env0(n)>( x, env ) = (
        if i > i2sz(0)
        then let
          val () = (
            env.1 := i - 1; 
            x := jack_port_get_buffer(arrayptr_get_at<cPtr0(jack_port_t)>(env.0,env.1),env.2)
          )
          prval () = conceal( env )
        in end
        else {
          prval () = conceal( env )
        } 
      ) where {
        prval () = reveal( env )
        val i = env.1
      }

     (** UGHHHHHH: the cptr issue again **)
     prval () = conceal( env_in ) and  () = conceal( env_out )
     (** *** *** **)

     val _ = arrayptr_foreach_env<ptr><env0(cin)>( impl.in_buffers, impl.sin, env_in ) 
     val _ = arrayptr_foreach_env<ptr><env0(cout)>( impl.out_buffers, impl.sout, env_out ) 

     (** UGHHHHHH: the cptr issue again **)
     prval () = reveal( env_in ) and () = reveal( env_out )
     (** *** *** **)

     val () = impl.in_ports := env_in.0
     val () = impl.out_ports := env_out.0

    val () = impl.t := i2sz(0)
//   val bsz = jack_get_buffer_size( impl.client ) 
    prval () = fold@aio
  }

implement {}
audio_io_process_end(aio) = ()

implement {}
audio_io_blocksize{cin,cout}(aio) 
  = $UNSAFE.cast{sizeGte(0)}( bsz )
  where {
    val client = audio_io_jack_client( aio )
    val bsz = jack_get_buffer_size( client )
  }

implement {}
audio_io_sample_rate{cin,cout}(aio) 
  = $UNSAFE.cast{sizeGte(0)}( sr )
  where {
    val client = audio_io_jack_client( aio )
    val sr = jack_get_sample_rate( client )
  }

implement {}
audio_io_sample_in{cin,cout}(aio, buf) = 
  case+ aio of 
  | @AIO_JACK( impl ) => {
    extern praxi
    is_initized{a:t@ype+}{n:nat}( &(@[float?][n]) >> @[float][n] ) : void
    prval () = is_initized( buf )

     vtypedef env(n:int) 
        = @(arrayptr(ptr,n) , sizeBtwe(0,n), size_t n, size_t)
    
    var e0 : env(cin) = @(impl.in_buffers, i2sz(0), impl.sin, impl.t )

    val _ = array_foreach_env<float><env(cin)>( buf, impl.sin, e0 ) where {
            implement
            array_foreach$fwork<float><env(cin)>( x, env ) = ( 
              if i < n
              then (
                x := $UNSAFE.ptr0_get<float>( 
                    ptr_add<float>( arrayptr_get_at<ptr>(env.0, i), env.3 ) 
                  );
                env.1 := i + 1; 
              )
              else () 
            ) where {
              val i = env.1
              val n = env.2
            }
        }
 
    val () = impl.in_buffers := e0.0

    prval () = fold@aio 
  }

implement {}
audio_io_sample_out{cin,cout}(aio, buf) = 
  case+ aio of 
  | @AIO_JACK( impl ) => {

     vtypedef env(n:int) 
        = @(arrayptr(ptr,n) , sizeBtwe(0,n), size_t n, size_t)
    
    var e0 : env(cout) = @(impl.out_buffers, i2sz(0), impl.sout, impl.t )

    val _ = array_foreach_env<float><env(cout)>( buf, impl.sout, e0 ) where {
            implement
            array_foreach$fwork<float><env(cout)>( x, env ) = ( 
              if i < n
              then (
                $UNSAFE.ptr0_set<float>( 
                    ptr_add<float>( arrayptr_get_at<ptr>(env.0, i), env.3 ), x 
                );
                env.1 := i + 1; 
              )
              else () 
            ) where {
              val i = env.1
              val n = env.2
            }
        }
 
    val () = impl.out_buffers := e0.0
    val () = impl.t := impl.t + 1
 
    prval () = fold@aio
  }


fun {p:audioproc}{cin,cout:int}
audio_jack_process{cin >= 0; cout >= 0}( nf: jack_nframes_t, audio: !audio(cin,cout,p) ) 
    : int = 0 where {
    val () =  audio_process<p><cin,cout>( audio, $UNSAFE.cast{[t:nat] size_t t}(nf) )
  } 

implement {proc}{cin,cout} 
audio_run(  audio ) =
  let
    val aio = UN_audio_get_io( audio ) 
    val client = audio_io_jack_client( aio )

    val _ = jack_set_process_callback( client, 
        $UNSAFE.cast{JackProcessCallback}( audio_jack_process<proc><cin,cout> ), $UNSAFE.castvwtp1{ptr}(audio) ) 
    val _ = jack_activate( client )

    prval () = $UNSAFE.cast2void( aio ) 
  in
  end
(*
implement {}
audio_io_samples_in(aio, buf,t) = ()
implement {}
audio_io_samples_out(aio, buf,t) = ()
*)
end
