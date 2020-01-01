

fun {env:vt@ype+}
  atsaudio$init() : env

(** Process pure **)
fun {a,b:t@ype+}
atsaudio$process( a ) : b

(** Functional style; may involve more copying with larger state **)
fun {a,b:t@ype+}{env:vt@ype+}
atsaudio$processF( a, env ) : @(b,env)

(** Call-by-reference style **)
fun {a,b:t@ype+}{env:vt@ype+}
atsaudio$processR( a, &env >> _ ) : b

(** to define processes in nice types, like tuples **)

fun {a:t@ype+}{cin:int}
atsaudio$input{cin >= 0}( &(@[float][cin]) ) : a

fun {b:t@ype+}{cout:int}
atsaudio$output{cout >= 0}( b, &(@[float?][cout]) >> @[float][cout] ) : void

datasort senv =
  | sdyn of (t@ype+,vt@ype+)
  | spure of (t@ype+)

datasort proc = 
  | proc_cons of (senv,proc)
  | proc_out of (t@ype+)

infixr -->
#define --> proc_cons
#define OUT proc_out


typedef mono   = float
typedef stereo = @(float,float)
typedef chan3  = @(float,float,float)
typedef chan4  = @(float,float,float,float)
typedef chan5  = @(float,float,float,float,float)
typedef chan6  = @(float,float,float,float,float,float)

// eg
//stadef x = sdyn(mono,float) --> spure(stereo) --> OUT(int) 

datavtype audiograph_state( proc ) =
  | {a:t@ype+} 
    ag_out(OUT(a))
  | {a:t@ype+}{sp:proc} 
    ag_pure( spure(a) --> sp ) of audiograph_state( sp ) 
  | {a:t@ype+}{env:vt@ype+}{sp:proc} 
    ag_dyn( sdyn(a,env) --> sp )  of (env, audiograph_state( sp )) 

fun {pr:proc} 
  audiograph_state_create() : audiograph_state( pr )

fun {p:proc}{cin,cout:int}
atsaudio_process{cin >= 0; cout >= 0}{t:nat}(
  sin  : !matrixptr(float,cin,t)
, sout : !matrixptr(float?,cout,t) >> matrixptr(float,cout,t)
, namp : size_t t
, env : !audiograph_state(p) 
) : void

absvt@ype audio(sysin:int,sysout:int, proc)


