# atsaudio

__Note: This is a prototype__

This is an audio library / eDSL for ATS2, largely inspired by the 
[FAUST](https://faust.grame.fr) block diagram model.  

To use, define the static node graph, and then implement the templates
by id.  The prelude should define many sensible defaults and functions
for unboxed tuples/floats.  

See the `TEST` directory for examples.

Included are raw backends for JACK and PortAudio.

## Examples

This library is configured by `datasort` declarations to generate a 
high-performance callback.  The more nodes you have, the more you
can compose in the statics.

A basic example: 

```ats2
      stacst freq : int
      stadef p  
        = PURE(freq,mono) --> osc_ --> OUT(0,stereo)

      implement(a)
      audio$process<freq><a,mono>( x ) = 440.0f

      implement (id)
      audio$process<id><mono,stereo>(x) = @(x,x)

      val () = audio_system_init()
      var env : int = 0
      var audio1 : audio(0,2,p)
        = audio_init<p><0,2>( i2sz(0), i2sz(2), env )

      val () = audio_run<p><0,2> ( audio1 )
      val _ = sleep(10)

      val () = audio_free<p><0,2>( audio1 )

      val () = audio_system_shutdown()

```


A more complex example is `phasor_`, which is implemented entirely in terms of
prelude nodes:

```ats2
stadef phasor_ = SING(_phasor, mono, 
           PURE(0,mono) (** Freq (Hz) **)
             --> second_(mono,mono,out_(dt_,mono))
             --> times_
             --> REC(0,mono,stereo,
                    plus_ 
                    --> second_(mono,mono,out_(one_,mono))
                    --> mod_ 
                    --> OUT(0,mono)
                  )
            --> plus_ 
            --> OUT(0,mono)
        )
```

## Caveats

It might be easy to lose track of template implementations, and errors
in the C-compilation phase are somewhat difficult to debug.  Look for
`audio${METHOD}` where `{METHOD}` is one of the template methods in the
interface.  Also, remember to compile with `-O2` or `-O3`. 

 
LICENSE: BSD3
