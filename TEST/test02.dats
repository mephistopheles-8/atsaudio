(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"
#include "./../mylibies.hats"

local
  absreimpl audio
in
  fun {} print_audio{pr:audioproc}{cin,cout:nat}( audio0: !audio(cin,cout,pr) ) 
    : void = {
      val () = fprint_matrixptr_sep<float>( stdout_ref, audio0.buffer, i2sz(256), audio0.sin + audio0.sout, ",","\n" )
      val () = print_newline()
    }
end
 
implement
main0 ( ) 
  = println!("Hello [test02]") where {
      stadef p = PURE(0,stereo) --> DYN(0,mono,float) --> OUT(0,stereo)
 
      var audio0 : audio(0,2,p)
        = audio_init<p><0,2>( i2sz(0), i2sz(2) )
          where {
            implement
            audio$init<0><float>( ) = ~1.0f 
          }
         

      val () = audio_process<p><0,2>( audio0 ) 
        where {
          implement
          audio$processR<0><stereo,mono><float>( st, env ) = (env := env + 1.0f; env) 
          implement
          audio$process<0><mono,stereo>( m ) = @(m,m)
        }

      val () = print_audio( audio0 )
      val () = audio_free<p><0,2>( audio0 )
  }
