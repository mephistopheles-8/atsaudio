(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"
staload "./../SATS/atsaudio.sats"
staload "./../SATS/atsaudio_prelude.sats"
#include "./../HATS/atsaudio_infix.hats"

implement (a)
audio$process<_sample_rate><a,mono>( x, sr) = g0int2float( sz2i(sr) )
