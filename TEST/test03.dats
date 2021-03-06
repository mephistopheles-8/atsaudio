(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"
#define ATSAUDIO_IO_JACK
#include "./../mylibies.hats"

staload "libats/libc/SATS/stdlib.sats"
staload "libats/libc/SATS/unistd.sats"

macdef RAND_MAX = $extval(lint,"RAND_MAX")
 
implement
main0 ( ) 
  = println!("Hello [test03]") where {
      stacst random : int
      stacst bpm : int
      stacst decay_rate  : int

      stadef p  =
        PURE(bpm,mono) --> bpm_ --> 
        second_(mono,mono, PURE(random,mono) --> OUT(0,mono))-->
           OUT(0,mono)

      implement (a)
      audio$process<random><a,mono>( x ) 
        = $UNSAFE.cast{float}(rand()) / $UNSAFE.cast{float}(RAND_MAX) 

      implement 
      audio$process<0><stereo,mono>( x ) = x.0
        where {
          val () = if x.0 = 1 then println!(x.0, " ", x.1)
        }
      implement (a)
      audio$process<bpm><a,mono>( x ) = 120.0f

      var env : int = 0
      var audio0 : audio(0,1,p)
        = audio_init<p><0,1>( i2sz(0), i2sz(1), env )

      val () = audio_run<p><0,1> ( audio0 )
      val _ = sleep(5)

      val () = audio_free<p><0,1>( audio0 )
  }

