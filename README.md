# atsaudio

This is an audio library / eDSL for ATS2, largely inspired by the FAUST
block diagram model.

The `audioproc` datasort should be reminiscent of Haskell arrows.

To use, define the static node graph, and then implement the process /
initialization templates.

See the `TEST` directory for examples.

Included are backends for JACK, OpenAL and PortAudio.

LICENSE: BSD3
