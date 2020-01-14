(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"
#define ATSAUDIO_IO_JACK
#include "./../mylibies.hats"


(** NOTE: this example requires my spsc library **)
(** This will read from stdin and encode the ascii as midi **)
#include "./../../spsc/mylibies.hats"

staload "libats/libc/SATS/unistd.sats"
staload "libats/libc/SATS/math.sats"

fn edo2freq(
  root    : double
, octival : double
, steps   : double
, key     : double
):<> double 
= root * pow(octival , (key / steps ))


fn midi2freq(
  note_num : double 
):<> double 
= edo2freq( 440.0, 2.0, 12.0, note_num - 69.0)
 
implement
main0 ( ) 
  = println!("Hello [test07]") where {
      (** Test bpm, exp_decay, second_ and simple arithmatic **)
      stacst bpm : int
      stacst decay_rate  : int
      stacst consolein : int
      
      vtypedef consolein_state = @{
        handle = rconn( char )
      , freq   = float
      } 
      
      stadef p  =
        PURE(bpm,mono) 
        --> bpm_ 
        --> second_(mono,mono, out_( PURE(decay_rate,mono), mono ))
        --> exp_decay_
        --> second_(mono,mono, 
              DYN(consolein,mono,consolein_state)
              --> out_(osc_, mono)
          )
        --> times_
        --> OUT(0,mono)

      implement (id)
      audio$init_env<id><Option_vt(rconn(char)),consolein_state>( env )
        = let
            val-~Some_vt(rconn) = env
            val () = env := None_vt()
          in @{ handle = rconn, freq = 440.0f }
          end

      implement (id)
      audio$free<consolein_state>( x ) = rconn_free<char>( x.handle )

      implement (a)
      audio$processR<consolein><a,mono><consolein_state>(x,env) 
        = env.freq where {
            fun loop( env : &consolein_state >> _ ) 
              : void =
              let
                 var c : char? 
               in if rconn_read<char>( env.handle, c )
                  then (if c != '\n' then env.freq := g0float2float( midi2freq($UNSAFE.cast{double}(c)) ); loop(env)) where {
                        prval () = opt_unsome( c )
                      }
                  else {
                        prval () = opt_unnone( c )
                    } 
               end
            val () = loop( env )
          } 
        

      implement (a)
      audio$process<bpm><a,mono>( x ) = 120.0f
      implement (a)
      audio$process<decay_rate><a,mono>( x ) = 10.0f
      
      val q  = spsc_create<char>( i2sz( 128 ) )

      val @(rconn, wconn) = spsc_split( q )

      var env : Option_vt(rconn(char)) = Some_vt(rconn)

      var audio0 : audio(0,1,p)
        = audio_init<p><0,1><Option_vt(rconn(char))>( i2sz(0), i2sz(1), env )

      val () = audio_run<p><0,1> ( audio0 )

      var wconn0 : wconn(char) = wconn

      val () = fileref_foreach_env<wconn(char)>( stdin_ref, wconn0 ) where {
      
          implement {} fileref_foreach$bufsize((*void*)) = i2sz(1)

          implement
          fileref_foreach$fwork<wconn(char)>(c,env) = 
            if ~wconn_fire0<char>(env,c) then println!("Buffer full...") else ignoret(usleep(50000))
 
        } 
      val () = audio_free<p><0,1>( audio0 )

      val-~None_vt() = env
      val () = wconn_free<char>( wconn0 )
  }

