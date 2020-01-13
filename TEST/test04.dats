(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"
#define ATSAUDIO_IO_JACK
#include "./../mylibies.hats"

staload "libats/libc/SATS/unistd.sats"

implement
main0 ( ) 
  = println!("Hello [test04]") where {
      stacst bpm : int
      stacst decay_rate  : int
      stacst times : int
      stacst sinosc : int
      stacst freq : int

      stadef p  =
        PURE(bpm,mono) 
        --> bpm_ 
        --> second_(mono,mono, out_( PURE(decay_rate,mono), mono ))
        --> exp_decay_
        --> second_(mono,mono, PURE(freq,mono) --> out_(osc_, mono))
        --> times_
        --> OUT(0,mono)

      implement (a)
      audio$process<bpm><a,mono>( x ) = 120.0f
      implement (a)
      audio$process<decay_rate><a,mono>( x ) = 10.0f
      implement
      audio$process<times><stereo,mono>( x ) = x.0*x.1
      implement (a)
      audio$process<freq><a,mono>( x ) = 440.0f

      var env : int = 0
      var audio0 : audio(0,1,p)
        = audio_init<p><0,1>( i2sz(0), i2sz(1), env )

      val () = audio_run<p><0,1> ( audio0 )
      val _ = sleep(20)

      val () = audio_free<p><0,1>( audio0 )
  }

