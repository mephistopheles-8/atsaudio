# atsaudio

This is an audio library / eDSL for ATS2, largely inspired by the 
[FAUST](https://faust.grame.fr) block diagram model. 

To use, define the static node graph, and then implement the process /
initialization templates.  

See the `TEST` directory for examples.

Included are backends for JACK, OpenAL and PortAudio.

## Caveats

It might be easy to lose track of template implementations, and errors
in the C-compilation phase are somewhat difficult to debug.  Look for
`audio${METHOD}` where `{METHOD}` is one of the template methods in the
interface.  Also realize that there are some [limitations](#limitations)
on which types can be used in templates in ATS2. 
 
LICENSE: BSD3
