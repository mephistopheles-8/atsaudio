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
staload "libats/libc/SATS/math.sats"
staload _ = "libats/libc/DATS/math.dats"
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
audio$process<_chan1><a,@(int,a)>( x ) = @(1,x)
implement (a:t@ype+)
audio$process<_chan2><a,@(int,a)>( x ) = @(2,x)
implement (a:t@ype+)
audio$process<_chan3><a,@(int,a)>( x ) = @(3,x)
implement (a:t@ype+)
audio$process<_chan4><a,@(int,a)>( x ) = @(4,x)
implement (a:t@ype+)
audio$process<_chan5><a,@(int,a)>( x ) = @(5,x)
implement (a:t@ype+)
audio$process<_chan6><a,@(int,a)>( x ) = @(6,x)

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


implement (a:t@ype+)
audio$process<_pi><a,mono>( x ) = g0float2float( M_PI )
implement (a:t@ype+)
audio$process<_e><a,mono>( x ) = g0float2float( M_E )

implement 
audio$process<_times><stereo,mono>( x ) = x.0*x.1
implement 
audio$process<_plus><stereo,mono>( x ) = x.0 + x.1
implement 
audio$process<_minus><stereo,mono>( x ) = x.0 - x.1
implement 
audio$process<_div><stereo,mono>( x ) = x.0 / x.1
implement 
audio$process<_pow><stereo,mono>( x ) = pow(x.0 , x.1)
implement 
audio$process<_mod><stereo,mono>( x ) = fmod(x.0 , x.1)

implement
audio$process<_product><mono,mono>( x ) = x
implement
audio$process<_product><stereo,mono>( x ) = x.0*x.1
implement
audio$process<_product><chan3,mono>( x ) = x.0*x.1*x.2
implement
audio$process<_product><chan4,mono>( x ) = x.0*x.1*x.2*x.3
implement
audio$process<_product><chan5,mono>( x ) = x.0*x.1*x.2*x.3*x.4
implement
audio$process<_product><chan6,mono>( x ) = x.0*x.1*x.2*x.3*x.4*x.5

implement
audio$process<_sum><mono,mono>( x ) = x
implement
audio$process<_sum><stereo,mono>( x ) = x.0+x.1
implement
audio$process<_sum><chan3,mono>( x ) = x.0+x.1+x.2
implement
audio$process<_sum><chan4,mono>( x ) = x.0+x.1+x.2+x.3
implement
audio$process<_sum><chan5,mono>( x ) = x.0+x.1+x.2+x.3+x.4
implement
audio$process<_sum><chan6,mono>( x ) = x.0+x.1+x.2+x.3+x.4+x.5

implement 
audio$process<_min><stereo,mono>( x ) = min(x.0 , x.1)
implement 
audio$process<_max><stereo,mono>( x ) = max(x.0 , x.1)
implement
audio$process<_ceil><mono,mono>( x ) = ceil( x )
implement
audio$process<_floor><mono,mono>( x ) = floor( x )
implement
audio$process<_round><mono,mono>( x ) = round( x )
implement
audio$process<_exp><mono,mono>( x ) = exp( x )

implement
audio$process<_sin><mono,mono>( x ) = sin( x )
implement
audio$process<_cos><mono,mono>( x ) = cos( x )
implement
audio$process<_tan><mono,mono>( x ) = tan( x )
implement
audio$process<_asin><mono,mono>( x ) = asin( x )
implement
audio$process<_acos><mono,mono>( x ) = acos( x )
implement
audio$process<_atan><mono,mono>( x ) = atan( x )
implement
audio$process<_atan2><stereo,mono>( x ) = atan2( x.0, x.1 )
implement
audio$process<_sinh><mono,mono>( x ) = sinh( x )
implement
audio$process<_cosh><mono,mono>( x ) = cosh( x )
implement
audio$process<_tanh><mono,mono>( x ) = tanh( x )
implement
audio$process<_asinh><mono,mono>( x ) = asinh( x )
implement
audio$process<_acosh><mono,mono>( x ) = acosh( x )
implement
audio$process<_atanh><mono,mono>( x ) = atanh( x )

implement (a)
audio$processSys<_sample_rate><a,mono>( x, sr ) = g0int2float( sz2i(sr) )

implement
audio$init<_pulse><pulse_state>() = @{
    time = 0.0
  }

implement
audio$init<_bpm><pulse_state>() = @{
    time = 0.0
  }

implement 
audio$processF<_pulse><stereo,mono><pulse_state>( p, state ) =
  let
    val @(freq,sr) = p
    val dt = 1.0/g0float2float(sr)
    val t  = state.time - dt
    val period = 1.0/g0float2float(freq)
  in if t <= 0.0
     then @( 1.0f, @{ time = t + period  })
     else @( 0.0f, @{ time = t  })
  end

implement 
audio$processF<_bpm><stereo,mono><pulse_state>( p, state ) =
  let
    val @(bpm,sr) = p
    val dt = 1.0/g0float2float(sr)
    val t  = state.time - dt
    val period = 60.0/g0float2float(bpm)
  in if t <= 0.0
     then @( 1.0f, @{ time = t + period  })
     else @( 0.0f, @{ time = t  })
  end

implement 
audio$process<_exp_decay>< @(@(stereo,mono),mono),mono >( x ) 
  = let
        val (((trig,decay),sr), x0) = x
        val dt = 1.0f/sr
     in if trig != 0.0f then trig else x0 - dt*decay*x0 
    end

local
absimpl wavetable(id) = [n:pos] @{
    buffer = arrayptr(float,n)
  , n = size_t n
  , i = sizeBtwe(0,n)
  , t = float
  }
in

implement {id}
wavetable_init(  ) = @{
    buffer = buf
  , n = n
  , i = i2sz(0)
  , t = 0.0f
  } where {
    val [n:int] (n : size_t n) = wavetable$size<id>()
    val buf = arrayptr_make_uninitized<float>( n )
    val () = arrayptr_initize<float>(buf,n) where {
      implement
      array_initize$init<float>( i, x ) = x := wavetable$init<id>(i)
    } 
  }

implement (id,wid)
audio$init<id>< wavetable(wid) >() = wavetable_init<wid>(  )

implement (id)
audio$free< wavetable(id) >(wt) = arrayptr_free( wt.buffer ) 


implement (id) 
audio$processR<_wavetable><stereo,mono><wavetable(id)>( x, env ) = 
  let
    val @(freq,sr) = x
    val dt = 1.0f/sr
    val dsamps = env.t + dt*freq*g0int2float(sz2i(env.n)) 
    val frac  = dsamps - floor(dsamps)
    val () = env.i := ( env.i + $UNSAFE.cast{sizeGte(0)}( dsamps ) ) mod env.n
    val () = env.t := frac

    val s1 = arrayptr_get_at(env.buffer, env.i)
    val s2 = arrayptr_get_at(env.buffer, (env.i + 1) mod env.n)

   in s1*(1.0f - frac) + s2*frac
  end 

end

implement
wavetable$size<_osc>() = i2sz(1024)
implement
wavetable$init<_osc>( i )
   = g0float2float( sin(2.0*M_PI*i/1024.0) )
    where {
        val i = g0int2float(sz2i(i))
    }





