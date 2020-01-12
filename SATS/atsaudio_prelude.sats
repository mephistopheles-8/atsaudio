(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
staload "./atsaudio.sats"
#include "./../HATS/atsaudio_infix.hats"

typedef pulse_state = @{    
  time = double
}

fun {} audio$bpm() : double

stadef _id = 0

stadef _chan1 = ~1
stadef _chan2 = ~2
stadef _chan3 = ~3
stadef _chan4 = ~4
stadef _chan5 = ~5
stadef _chan6 = ~6

stadef _first = ~7
stadef _second = ~8

stadef _sample_rate = ~9
stadef _pulse = ~10
stadef _bpm = ~11

stadef out_( an: audionode, a:t@ype+ ) = an --> OUT(0,a)

stadef first_(a:t@ype+,b:t@ype+, sp: audioproc ) 
  =  PAR(_first,@(a,b),
          ( SING(_chan1, @(int,a) ,sp) --> OUT(0, @(int,a) ) ) ::: 
          ( PURE(_chan2,@(int,b)) --> OUT(0, @(int,b) ) ) ::: apnil 
      )

stadef second_(a:t@ype+,b:t@ype+, sp: audioproc ) 
  =  PAR(_second,@(a,b),
          ( PURE(_chan1,@(int,a)) --> OUT(0, @(int,a) ) ) :::  
          ( SING(_chan2, @(int,b) ,sp) --> OUT(0, @(int,b) ) ) ::: apnil 
      )

stadef sample_rate_ = PURE(_sample_rate,mono)

stadef pulse_ = SING( _pulse, mono, 
    second_(mono,mono, out_(sample_rate_,mono)) 
    --> DYN(_pulse,mono,pulse_state) 
    --> OUT(0,mono) 
  )
stadef bpm_   = SING( _bpm, mono, 
    second_(mono,mono, out_(sample_rate_,mono)) 
    --> DYN(_bpm,mono,pulse_state) 
    --> OUT(0,mono) 
  )




