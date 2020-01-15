(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#ifndef _ATSAUDIO_MYLIBIES_HATS
#define _ATSAUDIO_MYLIBIES_HATS

staload "./SATS/atsaudio.sats"
staload _ = "./DATS/atsaudio.dats"

staload "./SATS/atsaudio_prelude.sats"
staload _ = "./DATS/atsaudio_prelude.dats"

#ifdef ATSAUDIO_IO_DUMMY
staload _ = "./DATS/atsaudio_dummy.dats"
#elifdef ATSAUDIO_IO_JACK
staload _ = "./DATS/atsaudio_jack.dats"
#elifdef ATSAUDIO_IO_PORTAUDIO
staload _ = "./DATS/atsaudio_portaudio.dats"
#endif

#include "./HATS/atsaudio_infix.hats"
#include "./mydepies.hats"

#endif
