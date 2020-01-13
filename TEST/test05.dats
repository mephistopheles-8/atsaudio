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
  = println!("Hello [test05]") where {
      (** Test basic audio thru **)
      stadef p  = PURE(0,stereo) --> OUT(0,stereo)

      var env : int = 0
      var audio0 : audio(2,2,p)
        = audio_init<p><2,2>( i2sz(2), i2sz(2), env )

      val () = audio_run<p><2,2> ( audio0 )
      val _ = sleep(5)

      val () = audio_free<p><2,2>( audio0 )
  }

