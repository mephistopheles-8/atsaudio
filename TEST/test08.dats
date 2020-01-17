(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"
#define ATSAUDIO_IO_PORTAUDIO
#include "./../mylibies.hats"

(** Test Portaudio **)

staload "libats/libc/SATS/unistd.sats"

implement
main0 ( ) 
  = println!("Hello [test08]") where {
      stacst freq : int
      stadef p  
        = PURE(freq,mono)
            --> osc_
            --> OUT(0,stereo)

      implement(a)
      audio$process<freq><a,mono>( x ) = 440.0f

      implement (id)
      audio$process<id><mono,stereo>(x) = @(x,x)

      val () = audio_system_init()
      var env : int = 0
      var audio1 : audio(0,2,p)
        = audio_init<p><0,2>( i2sz(0), i2sz(2), env )

      val () = audio_run<p><0,2> ( audio1 )
      val _ = sleep(10)

      val () = audio_free<p><0,2>( audio1 )

      val () = audio_system_shutdown()
  }

