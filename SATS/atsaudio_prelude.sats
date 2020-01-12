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
, freq = double
}

fun {} audio$bpm() : double

stadef _sample_rate = ~1
stadef _pulse = ~2
stadef _bpm = ~3

stadef sample_rate_ = PURE(_sample_rate,mono)
stadef pulse_ = SING( _pulse, mono, sample_rate_ --> DYN(_pulse,mono,pulse_state) --> OUT(0,mono) )
stadef bpm_   = SING( _bpm, mono, sample_rate_ --> DYN(_bpm,mono,pulse_state) --> OUT(0,mono) )




