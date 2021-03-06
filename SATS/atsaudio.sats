(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"

fun {id:int}{b:vt@ype+}
  audio$init() : b

(** We allow the initialization of DYN nodes to be constructed
    with some initial state 
    This way, DYN nodes can be wired to the external world

    This defaults to `audio$init`
**)
fun {id:int}{env,b:vt@ype+}
  audio$init_env(&env >> _) : b

fun {env:vt@ype+}
  audio$free( env ) : void

(** Process pure **)
fun {id:int}{a,b:t@ype+}
audio$process( a ) : b

(** This can be used in place of a graph with sample rate **)
fun {id:int}{a,b:t@ype+}
audio$processSys{sr:nat}( a, size_t sr ) : b

(** Functional style; may involve more copying with larger state **)
fun {id:int}{a,b:t@ype+}{env:vt@ype+}
audio$processF( a,  env ) : @(b,env)

(** Call-by-reference style; this defaults to `audio$processF` **)
fun {id:int}{a,b:t@ype+}{env:vt@ype+}
audio$processR( a,  &env >> _ ) : b

(** Call-by-reference style; this defaults to `audio$processF`; this can be used in place of a graph with sample rate **)
fun {id:int}{a,b:t@ype+}{env:vt@ype+}
audio$processSysR{sr:nat}( a, size_t sr, &env >> _ ) : b

(** This takes the input array and returns a value of type a 
    For the first node of the sequence, this is assumed to be
    the process return type
    
    Defaults are defined if a is a tuple and cin is equal to 
    the number of values
    eg., 
    a      | cin
    ------------
    mono   |  1
    stereo |  2
    chan3  |  3
    ...
    etc.

**)

fun {id:int}{a:t@ype+}{cin:int}
audio$input{cin >= 0}( &(@[float][cin]) ) : a

(** With final type `b`, write to the array.
    Defaults are defined if `b` is a tuple and 
    `cout` is equal to the number of values (see `audio$input`) 
**) 

fun {b:t@ype+}{cout:int}
audio$output{cout >= 0}( b, &(@[float?][cout]) >> @[float][cout] ) : void

(** Accumulators (for parallel signals) **)

(** Call by reference accumulator: defaults to `audio$accumF` **)
fun {id:int}{a,b:t@ype+}
audio$accumR( a, &b >> _ ) : void

(** Functional accumulator; may involve more copying with larger state **)
fun {id:int}{a,b:t@ype+}
audio$accumF( a, b ) : b

(** For recursive signals **)

fun {id:int}{a,b:t@ype+}
audio$into( a ) : b

(** For conditional signals **)

fun {id:int}{a:t@ype+}
audio$cond( a ) : bool


datasort audionode =
  | audionode_dyn of (int,t@ype+,vt@ype+) (** id, process out, env **)
  | audionode_pure of (int,t@ype+)        (** id, process out **)
  | audionode_par of (int,t@ype+,audioproc_list) (** id, accumulator type, par list **)
  | audionode_sing of (int,t@ype+,audioproc) (** id, audioproc out, audioproc **)
  | audionode_rec of (int,t@ype+,t@ype+,audioproc) (** id, audioproc out, process out, audioproc **)
  | audionode_if  of (int, t@ype+,audioproc, audioproc ) (** id, proc out, if proc, else proc **)

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
  | {id:int}{a:t@ype+}{sp0,sp1:audioproc}
    audiograph_sing( SING(id,a,sp0) --> sp1 ) 
      of ( audiograph(sp1), audiograph( sp0 ) )
  | {id:int}{a,b:t@ype+}{sp0,sp1:audioproc}
    audiograph_rec( REC(id,a,b,sp0) --> sp1 ) 
      of ( audiograph(sp1), a, audiograph( sp0 ) )
  | {id:int}{a:t@ype+}{sp0,sp1,sp2:audioproc}
    audiograph_if( IF(id,a,sp0,sp1) --> sp2 ) 
      of ( audiograph(sp2), audiograph( sp0 ), audiograph(sp1) )
 
and audiograph_list(audioproc_list) =
  | audiograph_list_nil( apnil )
  | {ap:audioproc}{xs:audioproc_list}
    audiograph_list_cons( ap ::: xs )
      of ( audiograph(ap), audiograph_list(xs) ) 


fun {pr:audioproc}{env: vt@ype+} 
  audiograph_create( &env >> _ ) : audiograph( pr )

fun {xs:audioproc_list}{env: vt@ype+} 
  audiograph_list_create( &env >> _ ) : audiograph_list( xs )

fun {pr:audioproc} 
  audiograph_free( audiograph(pr) ) : void

fun {xs:audioproc_list} 
  audiograph_list_free( audiograph_list( xs ) ) : void

absvtype audio(sysin:int,sysout:int, audioproc)
absvtype audioout(sysin:int,sysout:int, p:audioproc) = audio(sysin,sysout,p)
absvtype audio_io(sysin:int,sysout:int) = ptr

fun {} audio_system_init() : void
fun {} audio_system_shutdown() : void

fun {p:audioproc}{cin,cout:int}{env:vt@ype+}
audio_init{cin >= 0; cout >= 0}(size_t cin, size_t cout, &env >> _) : audio(cin,cout,p)


fun {p:audioproc}{cin,cout:int}
audio_run{cin >= 0; cout >= 0}( !audio(cin,cout,p)) : void

fun {p:audioproc}{cin,cout:int}
audio_free{cin >= 0; cout >= 0}( audio(cin,cout,p) ) : void

fun {} UN_audio_get_io{p:audioproc}{cin,cout:int}( !audio(cin,cout,p) ) 
  : audio_io(cin,cout) 

fun {} 
audio_io_init{cin,cout:nat}(size_t cin, size_t cout) : audio_io(cin,cout)
fun {}
audio_io_free{cin,cout:nat}(audio_io(cin,cout)) : void

fun {} audio_io_desired_sample_rate() : [n:pos] size_t n
fun {} audio_io_desired_blocksize() : [n:pos] size_t n

fun {}
audio_io_blocksize{cin,cout:nat}( aio: !audio_io(cin,cout) ) : [bsz:nat] size_t bsz
fun {}
audio_io_sample_rate{cin,cout:nat}( aio: !audio_io(cin,cout) ) : [sr:nat] size_t sr

fun {}
audio_io_process_beg{cin,cout,t:nat}( aio: !audio_io(cin,cout), size_t t ) : void
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
audio_process{cin >= 0; cout >= 0}{t:nat}(
  env : !audio(cin,cout,p), size_t t 
) : void

