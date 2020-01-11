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

#ifdef ATSAUDIO_IO_DUMMY
staload _ = "./DATS/atsaudio_dummy.dats"
#elifdef ATSAUDIO_IO_JACK
staload _ = "./DATS/atsaudio_jack.dats"
#endif

#include "./HATS/atsaudio_infix.hats"

#endif
