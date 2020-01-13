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

(** By convention, simple "thru" **)
stadef _id = 0

(** For tagging channels **)
stacst _chan1 : int
stacst _chan2 : int
stacst _chan3 : int
stacst _chan4 : int
stacst _chan5 : int
stacst _chan6 : int

(** Constants **)
stacst _pi : int
stacst _e : int

(** Arith **)
stacst _times : int
stacst _plus : int
stacst _minus : int
stacst _div : int
stacst _pow : int
stacst _mod : int
stacst _product : int
stacst _sum : int

stacst _min : int
stacst _max : int
stacst _ceil : int
stacst _floor : int
stacst _round : int
stacst _exp : int

(** Trig **)
stacst _sin : int
stacst _cos : int
stacst _tan : int
stacst _asin : int
stacst _acos : int
stacst _atan : int
stacst _atan2 : int
stacst _sinh : int
stacst _cosh : int
stacst _tanh : int
stacst _asinh : int
stacst _acosh : int
stacst _atanh : int

(** Arrow semantics **)
stacst _first : int
stacst _second : int

stacst _sample_rate : int
stacst _pulse : int
stacst _bpm : int
stacst _exp_decay : int
stacst _wavetable : int
stacst _osc : int
stacst _noise : int

stadef out_( an: audionode, a:t@ype+ ) = an --> OUT(0,a)

stadef pi_ = PURE(_pi,mono)
stadef e_ = PURE(_e,mono)

stadef times_ = SING(_times, mono,
    PURE(0,stereo) --> PURE(_times,mono) --> OUT(0,mono)
  ) 
stadef plus_ = SING(_plus, mono,
    PURE(0,stereo) --> PURE(_plus,mono) --> OUT(0,mono)
  ) 
stadef minus_ = SING(_minus, mono,
    PURE(0,stereo) --> PURE(_minus,mono) --> OUT(0,mono)
  ) 
stadef div_ = SING(_div, mono,
    PURE(0,stereo) --> PURE(_div,mono) --> OUT(0,mono)
  ) 
stadef pow_ = SING(_pow, mono,
    PURE(0,stereo) --> PURE(_pow,mono) --> OUT(0,mono)
  ) 
stadef mod_ = SING(_mod, mono,
    PURE(0,stereo) --> PURE(_mod,mono) --> OUT(0,mono)
  )
stadef product_ = PURE(_product,mono)
stadef sum_     = PURE(_sum,mono)

stadef min_ = SING(_min, mono,
    PURE(0,stereo) --> PURE(_min,mono) --> OUT(0,mono)
  ) 
stadef max_ = SING(_max, mono,
    PURE(0,stereo) --> PURE(_max,mono) --> OUT(0,mono)
  ) 
stadef ceil_ = SING(_ceil, mono,
    PURE(0,mono) --> PURE(_ceil,mono) --> OUT(0,mono)
  )
stadef floor_ = SING(_floor, mono,
    PURE(0,mono) --> PURE(_floor,mono) --> OUT(0,mono)
  )
stadef round_ = SING(_round, mono,
    PURE(0,mono) --> PURE(_round,mono) --> OUT(0,mono)
  )
stadef exp_ = SING(_exp, mono,
    PURE(0,mono) --> PURE(_exp,mono) --> OUT(0,mono)
  )

stadef sin_ = SING(_sin, mono,
    PURE(0,mono) --> PURE(_sin,mono) --> OUT(0,mono)
  )
stadef cos_ = SING(_cos, mono,
    PURE(0,mono) --> PURE(_cos,mono) --> OUT(0,mono)
  )
stadef tan_ = SING(_tan, mono,
    PURE(0,mono) --> PURE(_tan,mono) --> OUT(0,mono)
  )
stadef asin_ = SING(_asin, mono,
    PURE(0,mono) --> PURE(_asin,mono) --> OUT(0,mono)
  )
stadef acos_ = SING(_acos, mono,
    PURE(0,mono) --> PURE(_acos,mono) --> OUT(0,mono)
  )
stadef atan_ = SING(_atan, mono,
    PURE(0,mono) --> PURE(_atan,mono) --> OUT(0,mono)
  )
stadef atan2_ = SING(_atan2, mono,
    PURE(0,stereo) --> PURE(_atan2,mono) --> OUT(0,mono)
  )
stadef sinh_ = SING(_sinh, mono,
    PURE(0,mono) --> PURE(_sinh,mono) --> OUT(0,mono)
  )
stadef cosh_ = SING(_cosh, mono,
    PURE(0,mono) --> PURE(_cosh,mono) --> OUT(0,mono)
  )
stadef tanh_ = SING(_tanh, mono,
    PURE(0,mono) --> PURE(_tanh,mono) --> OUT(0,mono)
  )
stadef asinh_ = SING(_asinh, mono,
    PURE(0,mono) --> PURE(_asinh,mono) --> OUT(0,mono)
  )
stadef acosh_ = SING(_acosh, mono,
    PURE(0,mono) --> PURE(_acosh,mono) --> OUT(0,mono)
  )
stadef atanh_ = SING(_atanh, mono,
    PURE(0,mono) --> PURE(_atanh,mono) --> OUT(0,mono)
  )

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

absvt@ype wavetable(id:int)

fun {id:int} wavetable$size() : sizeGt(0)
fun {id:int} wavetable$init( size_t ) : float
fun {id:int} wavetable_init( ) : wavetable(id)


stadef wavetable_(id:int) = SING(_wavetable, mono,
        PURE(0,mono) (** freq (Hz) **)
        --> second_(mono, mono, out_(sample_rate_,mono)) 
        --> DYN(_wavetable,mono,wavetable(id))
        --> OUT(0,mono)
    )

stadef osc_ = SING(_osc, mono,
        PURE(0,mono) (** freq (Hz) **)
        --> wavetable_(_osc)
        --> OUT(0,mono)
    )


