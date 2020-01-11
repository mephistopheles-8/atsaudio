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
      stadef random = 0
      stadef p  = OUT(random,mono)

      implement
      audio$process<random><mono,mono>( x ) 
        = $UNSAFE.cast{float}(random()) / $UNSAFE.cast{float}(RAND_MAX) 

      var audio0 : audio(0,1,p)
        = audio_init<p><0,1>( i2sz(0), i2sz(1) )

      val () = audio_run<p><0,1> ( audio0 )
      val _ = sleep(5)

      val () = audio_free<p><0,1>( audio0 )
  }

