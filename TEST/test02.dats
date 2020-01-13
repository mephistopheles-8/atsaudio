(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"
#define ATSAUDIO_IO_DUMMY
#include "./../mylibies.hats"

local
  absreimpl audio
in
  fun {} print_audio{pr:audioproc}{cin,cout:nat}( audio0: !audio(cin,cout,pr) ) 
    : void = {
      val () = fprint_arrayptr<float>( stdout_ref, audio0.buffer, audio0.sin + audio0.sout )
      val () = print_newline()
    }
end
 
implement
main0 ( ) 
  = println!("Hello [test02]") where {
      stadef sum = 1
      stadef times_two = 2
      stadef plus_five = 3
      stadef increment = 4
      stadef rec_test = 5
      stadef plus_one = 6
      stadef mycond = 7
      stadef par_rec_test = ~8 
      stadef increment_ = DYN(increment,mono,float)
      stadef par_rec_test_ = 
            SING(par_rec_test,mono,
              PAR(sum,mono, OUT(times_two,mono) ::: OUT(plus_five,mono) ::: apnil)
              --> REC(rec_test,mono, mono, OUT(plus_one,mono)) --> OUT(0,mono)
             )
      stadef p 
          = PURE(0,mono)
            --> increment_ --> par_rec_test_ 
            --> IF(mycond,mono,OUT(plus_one,mono), OUT(plus_five,mono))
            --> OUT(0,stereo)
 

      implement
      audio$accumF<sum><mono,mono>( x, y ) = y + x

      implement
      audio$process<rec_test><(@(mono,mono)),mono>( x ) = x.0 + x.1

      implement
      audio$cond<mycond><mono>( x ) = x > 20000.0f

      implement
      audio$process<times_two><mono,mono>( x ) = x*2.0f 
      implement
      audio$process<plus_one><mono,mono>( x ) = x + 1.0f
      implement
      audio$process<plus_five><mono,mono>( x ) = x + 5.0f 


      var audio0 : audio(0,2,p)
        = audio_init<p><0,2><int>( i2sz(0), i2sz(2), x )
          where {
            implement
            audio$init<increment><float>( ) = 0.0f
            var x : int = 0 
          }
         

      val () = audio_process<p><0,2>( audio0, i2sz(4) ) 
        where {
          implement (a)
          audio$processF<increment><a,mono><float>( st, env ) = @(env,env + 1) 
          implement
          audio$process<0><mono,stereo>( m ) = @(m,m)
        }

      val () = print_audio( audio0 )
      val () = audio_free<p><0,2>( audio0 )
  }

