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

datasort senv =
  | sdyn of (int,t@ype+,vt@ype+)
  | spure of (int,t@ype+)

datasort proc = 
  | proc_cons of (senv,proc)
  | proc_out of (int,t@ype+)

#include "./../HATS/atsaudio_infix.hats"

typedef mono   = float
typedef stereo = @(float,float)
typedef chan3  = @(float,float,float)
typedef chan4  = @(float,float,float,float)
typedef chan5  = @(float,float,float,float,float)
typedef chan6  = @(float,float,float,float,float,float)

// eg
//stadef x = sdyn(mono,float) --> spure(stereo) --> OUT(id,int) 

datavtype audiograph_state( proc ) =
  | {id:int}{a:t@ype+} 
    ag_out(OUT(id,a))
  | {id:int}{a:t@ype+}{sp:proc} 
    ag_pure( spure(id,a) --> sp ) of audiograph_state( sp ) 
  | {id:int}{a:t@ype+}{env:vt@ype+}{sp:proc} 
    ag_dyn( sdyn(id,a,env) --> sp )  of (audiograph_state( sp ),env) 

fun {pr:proc} 
  audiograph_state_create() : audiograph_state( pr )

fun {pr:proc} 
  audiograph_state_free( audiograph_state(pr) ) : void

absvt@ype audio(sysin:int,sysout:int, proc)

fun {p:proc}{cin,cout:int}
audio_init{cin >= 0; cout >= 0}(size_t cin, size_t cout) : audio(cin,cout,p)

fun {p:proc}{cin,cout:int}
audio_run{cin >= 0; cout >= 0}(!audio(cin,cout,p)) : void

fun {p:proc}{cin,cout:int}
audio_free{cin >= 0; cout >= 0}( audio(cin,cout,p) ) : void

fun {p:proc}{cin,cout:int}
audio_process{cin >= 0; cout >= 0}(
  env : &audio(cin,cout,p) 
) : void

