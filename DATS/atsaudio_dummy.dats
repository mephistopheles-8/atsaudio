(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"
staload "./../SATS/atsaudio.sats"

local
absimpl audio_io(sin,sout) = ptr 
in
implement {}
audio_io_init(sin,sout) = the_null_ptr
implement {}
audio_io_free(aio) = ()
implement {}
audio_io_process_beg(aio,t) = ()
implement {}
audio_io_process_end(aio) = ()
implement {}
audio_io_blocksize(aio) = i2sz(256)
implement {}
audio_io_sample_rate(aio) = i2sz(44500)
implement {}
audio_io_sample_in(aio, buf) = ()
  where {
    extern praxi
    is_initized{a:t@ype+}{n:nat}( &(@[float?][n]) >> @[float][n] ) : void
    prval () = is_initized( buf )
  }
implement {}
audio_io_sample_out(aio, buf) = ()
implement {}
audio_io_samples_in(aio, buf,t) = ()
implement {}
audio_io_samples_out(aio, buf,t) = ()

end
