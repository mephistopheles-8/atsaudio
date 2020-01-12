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

implement (a:t@ype+) 
audio$init<_chan1><(@(int,a))>() = @(1,audio$init<0><a>())
implement (a:t@ype+) 
audio$init<_chan2><(@(int,a))>() = @(2,audio$init<0><a>())
implement (a:t@ype+) 
audio$init<_chan3><(@(int,a))>() = @(3,audio$init<0><a>())
implement (a:t@ype+) 
audio$init<_chan4><(@(int,a))>() = @(4,audio$init<0><a>())
implement (a:t@ype+) 
audio$init<_chan5><(@(int,a))>() = @(5,audio$init<0><a>())
implement (a:t@ype+) 
audio$init<_chan6><(@(int,a))>() = @(6,audio$init<0><a>())

implement (a:t@ype+)
audio$process<_chan1><a,@(int,a)>(x,sr) = @(1,x)
implement (a:t@ype+)
audio$process<_chan2><a,@(int,a)>(x,sr) = @(2,x)
implement (a:t@ype+)
audio$process<_chan3><a,@(int,a)>(x,sr) = @(3,x)
implement (a:t@ype+)
audio$process<_chan4><a,@(int,a)>(x,sr) = @(4,x)
implement (a:t@ype+)
audio$process<_chan5><a,@(int,a)>(x,sr) = @(5,x)
implement (a:t@ype+)
audio$process<_chan6><a,@(int,a)>(x,sr) = @(6,x)

implement (a:t@ype+)
audio$into<_chan1><a,@(int,a)>( x ) = @(1,x)
implement (a:t@ype+)
audio$into<_chan2><a,@(int,a)>( x ) = @(2,x)
implement (a:t@ype+)
audio$into<_chan3><a,@(int,a)>( x ) = @(3,x)
implement (a:t@ype+)
audio$into<_chan4><a,@(int,a)>( x ) = @(4,x)
implement (a:t@ype+)
audio$into<_chan5><a,@(int,a)>( x ) = @(5,x)
implement (a:t@ype+)
audio$into<_chan6><a,@(int,a)>( x ) = @(6,x)

implement (a:t@ype+,b:t@ype+)
audio$accumF<_first>< @(int,a),@(a,b) >(x,y0) = @(x.1,y0.1)
implement (a:t@ype+,b:t@ype+)
audio$accumF<_first>< @(int,b),@(a,b) >(x,y0) = @(y0.0,x.1)
implement (a:t@ype+)
audio$accumF<_first>< @(int,a),@(a,a) >(x,y0) 
  = if x.0 = 1 then @(x.1,y0.1) else @(y0.0,x.1)

implement (a:t@ype+,b:t@ype+)
audio$accumF<_second>< @(int,a),@(a,b) >(x,y0) = @(x.1,y0.1)
implement (a:t@ype+,b:t@ype+)
audio$accumF<_second>< @(int,b),@(a,b) >(x,y0) = @(y0.0,x.1)
implement (a:t@ype+)
audio$accumF<_second>< @(int,a),@(a,a) >(x,y0) 
  = if x.0 = 1 then @(x.1,y0.1) else @(y0.0,x.1)

implement (a)
audio$process<_sample_rate><a,mono>( x, sr ) = g0int2float( sz2i(sr) )

implement {} 
audio$bpm() = 120.0

implement
audio$init<_pulse><pulse_state>() = @{
    time = 0.0
  }

implement
audio$init<_bpm><pulse_state>() = @{
    time = 0.0
  }

implement 
audio$processF<_pulse><stereo,mono><pulse_state>( p, sr0, env ) =
  let
    val @(freq,sr) = p
    val dt = 1.0/g0float2float(sr)
    val t  = env.time + dt
    val period = 1.0/g0float2float(freq)
  in if t > period
     then @( 1.0f, @{ time = t - period  })
     else @( 0.0f, @{ time = t  })
  end

implement 
audio$processF<_bpm><stereo,mono><pulse_state>( p, sr0, env ) =
  let
    val @(bpm,sr) = p
    val dt = 1.0/g0float2float(sr)
    val t  = env.time + dt
    val period = 60.0/g0float2float(bpm)
  in if t > period
     then @( 1.0f, @{ time = t - period  })
     else @( 0.0f, @{ time = t  })
  end

