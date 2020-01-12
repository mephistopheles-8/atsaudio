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
  = println!("Hello [test02]") where {
      stadef random = 1
      stadef p  = bpm_ --> OUT(0,mono)

      implement {} audio$bpm() = 240.0
      implement
      audio$process<random><mono,mono>( x, sr ) 
        = $UNSAFE.cast{float}(random()) / $UNSAFE.cast{float}(RAND_MAX) 

      var env : int = 0
      var audio0 : audio(0,1,p)
        = audio_init<p><0,1>( i2sz(0), i2sz(1), env )

      val () = audio_run<p><0,1> ( audio0 )
      val _ = sleep(5)

      val () = audio_free<p><0,1>( audio0 )
  }

