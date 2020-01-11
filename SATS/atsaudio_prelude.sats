(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
staload "./atsaudio.sats"
#include "./../HATS/atsaudio_infix.hats"


stadef _sample_rate = ~1
stadef sample_rate_ = PURE(_sample_rate,mono)

