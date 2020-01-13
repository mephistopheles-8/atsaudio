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

stadef _id = 0

stacst _chan1 : int
stacst _chan2 : int
stacst _chan3 : int
stacst _chan4 : int
stacst _chan5 : int
stacst _chan6 : int

stacst _first : int
stacst _second : int

stacst _sample_rate : int
stacst _pulse : int
stacst _bpm : int
stacst _exp_decay : int

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
    PURE(0,mono) (** Freq (Hz) **)
    --> second_(mono,mono, out_(sample_rate_,mono)) 
    --> DYN(_pulse,mono,pulse_state) 
    --> OUT(0,mono) 
  )

stadef bpm_   = SING( _bpm, mono,
    PURE(0,mono) (** BPM **)
    --> second_(mono,mono, out_(sample_rate_,mono)) 
    --> DYN(_bpm,mono,pulse_state) 
    --> OUT(0,mono) 
  )

stadef exp_decay_   = SING( _exp_decay, mono, 
    PURE(0,stereo) (** @(trigger, decay_rate [0.0..1.0]) **)
    --> second_(stereo,mono, out_(sample_rate_,mono)) 
    --> REC(_exp_decay,mono,mono,OUT(0,mono)) 
    --> OUT(0,mono) 
  )

