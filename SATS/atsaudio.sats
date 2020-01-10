(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"

fun {id:int}{env:vt@ype+}
  audio$init() : env

fun {env:vt@ype+}
  audio$free( env ) : void

(** Process pure **)
fun {id:int}{a,b:t@ype+}
audio$process( a ) : b

(** Functional style; may involve more copying with larger state **)
fun {id:int}{a,b:t@ype+}{env:vt@ype+}
audio$processF( a, env ) : @(b,env)

(** Call-by-reference style **)
fun {id:int}{a,b:t@ype+}{env:vt@ype+}
audio$processR( a, &env >> _ ) : b

(** to define processes in nice types, like tuples **)

fun {id:int}{a:t@ype+}{cin:int}
audio$input{cin >= 0}( &(@[float][cin]) ) : a

fun {b:t@ype+}{cout:int}
audio$output{cout >= 0}( b, &(@[float?][cout]) >> @[float][cout] ) : void

(** Accumulators (for parallel signals) **)

fun {id:int}{a,b:t@ype+}
audio$accumR( a, &b >> _ ) : void

fun {id:int}{a,b:t@ype+}
audio$accumF( a, b ) : b

(** For recursive signals **)
fun {id:int}{a,b:t@ype+}
audio$into( a ) : b

datasort audionode =
  | audionode_dyn of (int,t@ype+,vt@ype+)
  | audionode_pure of (int,t@ype+)
  | audionode_par of (int,t@ype+,audioproc_list) (** id, accumulator type, par list **)
  | audionode_rec of (int,t@ype+,t@ype+,audioproc) (** id, audioproc out, process out, audioproc **)

and audioproc_list =
  | audioproc_list_nil
  | audioproc_list_cons of (audioproc, audioproc_list)

and audioproc = 
  | audioproc_cons of (audionode,audioproc)
  | audioproc_out of (int,t@ype+)

#include "./../HATS/atsaudio_infix.hats"

typedef mono   = float
typedef stereo = @(float,float)
typedef chan3  = @(float,float,float)
typedef chan4  = @(float,float,float,float)
typedef chan5  = @(float,float,float,float,float)
typedef chan6  = @(float,float,float,float,float,float)

// eg
//stadef x = DYN(mono,float) --> PURE(stereo) --> OUT(id,int) 

datavtype audiograph( audioproc ) =
  | {id:int}{a:t@ype+} 
    audiograph_out(OUT(id,a))
  | {id:int}{a:t@ype+}{sp:audioproc} 
    audiograph_pure( PURE(id,a) --> sp ) 
      of audiograph( sp ) 
  | {id:int}{a:t@ype+}{env:vt@ype+}{sp:audioproc} 
    audiograph_dyn( DYN(id,a,env) --> sp )  
      of (audiograph( sp ),env)
  | {id:int}{a:t@ype+}{xs:audioproc_list}{sp:audioproc}
    audiograph_par( PAR(id,a,xs) --> sp ) 
      of ( audiograph(sp), audiograph_list( xs ) )
  | {id:int}{a,b:t@ype+}{sp0,sp1:audioproc}
    audiograph_rec( REC(id,a,b,sp0) --> sp1 ) 
      of ( audiograph(sp1), a, audiograph( sp0 ) )
 
and audiograph_list(audioproc_list) =
  | audiograph_list_nil( apnil )
  | {ap:audioproc}{xs:audioproc_list}
    audiograph_list_cons( ap ::: xs )
      of ( audiograph(ap), audiograph_list(xs) ) 


fun {pr:audioproc} 
  audiograph_create() : audiograph( pr )

fun {xs:audioproc_list} 
  audiograph_list_create() : audiograph_list( xs )

fun {pr:audioproc} 
  audiograph_free( audiograph(pr) ) : void

fun {xs:audioproc_list} 
  audiograph_list_free( audiograph_list( xs ) ) : void

absvt@ype audio(sysin:int,sysout:int, audioproc)
absvtype audio_io(sysin:int,sysout:int) = ptr


fun {p:audioproc}{cin,cout:int}
audio_init{cin >= 0; cout >= 0}(size_t cin, size_t cout) : audio(cin,cout,p)

fun {p:audioproc}{cin,cout:int}
audio_run{cin >= 0; cout >= 0}(!audio(cin,cout,p)) : void

fun {p:audioproc}{cin,cout:int}
audio_free{cin >= 0; cout >= 0}( audio(cin,cout,p) ) : void

fun {} 
audio_io_init{cin,cout:nat}(size_t cin, size_t cout) : audio_io(cin,cout)
fun {}
audio_io_free{cin,cout:nat}(audio_io(cin,cout)) : void

fun {}
audio_io_blocksize{cin,cout:nat}( aio: !audio_io(cin,cout) ) : [bsz:nat] size_t bsz
fun {}
audio_io_sample_rate{cin,cout:nat}( aio: !audio_io(cin,cout) ) : [sr:nat] size_t sr

fun {}
audio_io_process_beg{cin,cout:nat}( aio: !audio_io(cin,cout) ) : void
fun {}
audio_io_process_end{cin,cout:nat}( aio: !audio_io(cin,cout) ) : void

(** I don't know if it's best to write in large blocks here, or write per-sample;
    writing the block is O(3*t) and writing samples is O(t), however writing the block
    may still be better optimized.
 **)
fun {}
audio_io_sample_in{cin,cout:nat}( aio: !audio_io(cin,cout), buf: &(@[float?][cin]) >> @[float][cin] ) : void
fun {}
audio_io_sample_out{cin,cout:nat}( aio: !audio_io(cin,cout), buf: &(@[float][cout])) : void

fun {}
audio_io_samples_in{cin,cout:nat}{t:nat}( aio: !audio_io(cin,cout), buf: !matrixptr(float,t,cin + cout), size_t t ) : void
fun {}
audio_io_samples_out{cin,cout:nat}{t:nat}( aio: !audio_io(cin,cout), buf: !matrixptr(float,t,cin + cout), size_t t ) : void


fun {p:audioproc}{cin,cout:int}
audio_process{cin >= 0; cout >= 0}(
  env : &audio(cin,cout,p) 
) : void

