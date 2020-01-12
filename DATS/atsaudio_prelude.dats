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
audio$process<_sample_rate><a,mono>( x, sr ) = g0int2float( sz2i(sr) )

implement {} 
audio$bpm() = 120.0

implement
audio$init<_pulse><pulse_state>() = @{
    time = 0.0
  , freq = 1.0 
  }

implement
audio$init<_bpm><pulse_state>() = @{
    time = 0.0
  , freq = audio$bpm()
  }

implement 
audio$processF<_pulse><mono,mono><pulse_state>( sr, sr0, env ) =
  let
    val dt = 1.0/g0float2float(sr)
    val t  = env.time + dt
    val period = 1.0/env.freq
  in if t > period
     then @( 1.0f, @{ time = t - period, freq = env.freq })
     else @( 0.0f, @{ time = t, freq = env.freq })
  end

implement 
audio$processF<_bpm><mono,mono><pulse_state>( sr, sr0, env ) =
  let
    val dt = 1.0/g0float2float(sr)
    val t  = env.time + dt
    val period = 60.0/(env.freq)
  in if t > period
     then @( 1.0f, @{ time = t - period, freq = env.freq })
     else @( 0.0f, @{ time = t, freq = env.freq })
  end

