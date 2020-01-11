(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"
staload "./../SATS/atsaudio.sats"
#include "./../HATS/atsaudio_infix.hats"

implement (id)
audio$init<id><float>( ) = 0.0f 
implement (id)
audio$init<id><double>( ) = 0.0 
implement (id)
audio$init<id><int>( ) = 0 
implement (id)
audio$init<id><uint>( ) = 0U 
implement (id)
audio$init<id><ulint>( ) = 0UL 
implement (id)
audio$init<id><stereo>( ) = @(0.0f,0.0f) 
implement (id)
audio$init<id><chan3>( ) = @(0.0f,0.0f,0.0f) 
implement (id)
audio$init<id><chan4>( ) = @(0.0f,0.0f,0.0f,0.0f) 
implement (id)
audio$init<id><chan5>( ) = @(0.0f,0.0f,0.0f,0.0f,0.0f) 
implement (id)
audio$init<id><chan6>( ) = @(0.0f,0.0f,0.0f,0.0f,0.0f,0.0f) 
implement (id)
audio$init<id><bool>( ) = false 


implement (id,a:t@ype+)
audio$input<id><a><0>( inp ) = audio$init<id><a>()
 
implement (id)
audio$input<id><mono><1>( inp ) = inp[0] 
implement (id)
audio$input<id><stereo><2>( inp ) = @(inp[0],inp[1]) 
implement (id)
audio$input<id><chan3><3>( inp ) = @(inp[0],inp[1],inp[2]) 
implement (id)
audio$input<id><chan4><4>( inp ) = @(inp[0],inp[1],inp[2],inp[3]) 
implement (id)
audio$input<id><chan5><5>( inp ) = @(inp[0],inp[1],inp[2],inp[3],inp[4]) 
implement (id)
audio$input<id><chan6><6>( inp ) = @(inp[0],inp[1],inp[2],inp[3],inp[4],inp[5]) 

implement
audio$output<mono><1>( m, out ) = array_copy<float>( out, arr, i2sz(1) )
  where {
    var arr = @[float][1]( m )
  }

implement
audio$output<stereo><2>( st, out ) = array_copy<float>( out, arr, i2sz(2) )
  where {
    var arr = @[float][2]( st.0, st.1 )
  }

implement
audio$output<chan3><3>( st, out ) = array_copy<float>( out, arr, i2sz(3) )
  where {
    var arr = @[float][3]( st.0, st.1, st.2 )
  }

implement
audio$output<chan4><4>( st, out ) = array_copy<float>( out, arr, i2sz(4) )
  where {
    var arr = @[float][4]( st.0, st.1, st.2, st.3 )
  }

implement
audio$output<chan5><5>( st, out ) = array_copy<float>( out, arr, i2sz(5) )
  where {
    var arr = @[float][5]( st.0, st.1, st.2, st.3, st.4 )
  }

implement
audio$output<chan6><6>( st, out ) = array_copy<float>( out, arr, i2sz(6) )
  where {
    var arr = @[float][6]( st.0, st.1, st.2, st.3, st.4, st.5 )
  }

implement (id,a:t@ype+)
audio$process<id><a,a>( inp ) = inp 

implement (id,a:t@ype+)
audio$into<id><a,a>( inp ) = inp 

(** Implement call-by-reference procedures in terms
    of their functional equivalent **)
implement (id,a:t@ype+,b:t@ype+,env:vt@ype+)
audio$processR<id><a,b><env>( x, env ) = y where {
    val @(y,env0) = audio$processF<id><a,b><env>(x,env)
    val () = (env := env0) 
  }

implement (id,a:t@ype+,b:t@ype+)
audio$accumR<id><a,b>( x, y ) = {
    val () = y := audio$accumF<id><a,b>(x,y)
  }

implement (a:t@ype+)
audio$free<a>( x ) = ()

implement (id,a:t@ype+)
audiograph_create<OUT(id,a)>() = audiograph_out()

implement (id,sp,a:t@ype+)
audiograph_create<PURE(id,a) --> sp>() 
  = audiograph_pure(st) where {
     val st = audiograph_create<sp>() 
  }

implement (id,sp,a:t@ype+,env:vt@ype+)
audiograph_create<DYN(id,a,env) --> sp>() 
  = audiograph_dyn(st,env) where {
     val st = audiograph_create<sp>() 
     val env = audio$init<id><env>() 
  }

implement (id,a:t@ype+,xs,sp)
audiograph_create<PAR(id,a,xs) --> sp>() 
  = audiograph_par(sp,xs) where {
     val sp = audiograph_create<sp>()
     val xs = audiograph_list_create<xs>() 
  }

implement (id,a:t@ype+,b:t@ype+,sp0,sp1)
audiograph_create<REC(id,a,b,sp0) --> sp1>() 
  = audiograph_rec(sp1,x,sp0) where {
     val sp0 = audiograph_create<sp0>()
     val sp1 = audiograph_create<sp1>()
     val x   = audio$init<id><a>() 
  }

implement (id,a:t@ype+,sp0,sp1,sp2)
audiograph_create<IF(id,a,sp0,sp1) --> sp2>() 
  = audiograph_if(sp2,sp0,sp1) where {
     val sp0 = audiograph_create<sp0>()
     val sp1 = audiograph_create<sp1>()
     val sp2 = audiograph_create<sp2>()
  }

implement 
audiograph_list_create<apnil>() = audiograph_list_nil()

implement (ap,xs) 
audiograph_list_create< ap ::: xs  >() 
  = audiograph_list_cons(ag,xs) where {
      val ag = audiograph_create<ap>()
      val xs = audiograph_list_create<xs>()
  }

implement (id,a:t@ype+)
audiograph_free<OUT(id,a)>( out ) = {
    val ~audiograph_out() = out
  }

implement (id,sp,a:t@ype+)
audiograph_free<PURE(id,a) --> sp>( out ) = {
    val ~audiograph_pure(sp) = out
    (** avoid TCO **)
    val () = audiograph_free<sp>(sp)
    val () = ignoret(5)
  }

implement (id,sp,a:t@ype+,env:vt@ype+)
audiograph_free<DYN(id,a,env) --> sp>( out ) = {
    val ~audiograph_dyn(sp,env) = out
    (** avoid TCO **)
    val () = audiograph_free<sp>(sp)
    val () = audio$free<env>( env )
  }

implement (id,a:t@ype+,xs,sp)
audiograph_free<PAR(id,a,xs) --> sp>( out ) = {
    val ~audiograph_par(sp,xs) = out
    (** avoid TCO **)
    val () = audiograph_free<sp>(sp) 
    val () = audiograph_list_free<xs>( xs )
  }

implement (id,a:t@ype+,b:t@ype+,sp0,sp1)
audiograph_free<REC(id,a,b,sp0) --> sp1>( out ) = {
    val ~audiograph_rec(sp1,x,sp0) = out
    (** avoid TCO **)
    val () = audiograph_free<sp0>(sp0) 
    val () = audiograph_free<sp1>(sp1) 
    val () = ignoret(5)
  }

implement (id,a:t@ype+,sp0,sp1,sp2)
audiograph_free<IF(id,a,sp0,sp1) --> sp2>( out ) = {
    val ~audiograph_if(sp2,sp0,sp1) = out
    (** avoid TCO **)
    val () = audiograph_free<sp0>(sp0) 
    val () = audiograph_free<sp1>(sp1) 
    val () = audiograph_free<sp2>(sp2) 
    val () = ignoret(5)
  }

implement 
audiograph_list_free<apnil>(xs) = {
    val ~audiograph_list_nil() = xs 
  }

implement (ap,xs) 
audiograph_list_free< ap ::: xs  >(xs) 
  = {
    val  ~audiograph_list_cons(ag,xs) = xs
    (** avoid TCO **)
    val xs = audiograph_list_free<xs>(xs)
    val () = audiograph_free<ap>(ag) 
  }

local
absimpl audio(sin,sout,p) = @{
     state = audiograph(p)
   , buffer = matrixptr(float,256,sin + sout)
   , sin   = size_t sin
   , sout   = size_t sout
   , io     = audio_io(sin,sout)
  }
in
implement {p}{cin,cout} 
audio_init( sin, sout ) 
    = @{
      state = audiograph_create<p>()
    , buffer = matrixptr_make_elt<float>(i2sz(256),sin + sout,0.0f)
    , sin    = sin
    , sout   = sout
    , io     = audio_io_init(sin, sout) 
    }  

implement {p}{cin,cout} 
audio_free( audio )
  = (
      audio_io_free(audio.io);
      audiograph_free<p>(audio.state); 
      matrixptr_free(audio.buffer);
    )

extern 
fun {p:audioproc}{cin,cout:int}
audio_process$run{cin >= 0; cout >= 0}( !audiograph(p), &(@[float][cin]), &(@[float?][cout]) >> @[float][cout] ) 
  : void 

extern 
fun {p:audioproc}{a:vt@ype+}{cout:int}
audio_process$step{cout >= 0}( !audiograph(p), a, &(@[float?][cout]) >> @[float][cout] ) 
  : void 

extern 
fun {id:int}{p:audioproc}{a,b:t@ype+}
audio_process$fold$accum( !audiograph(p), a, &b >> _ ) 
  : void

extern 
fun {id:int}{xs:audioproc_list}{a,b:t@ype+}
audio_process$fold( !audiograph_list(xs), a, &b >> _ ) 
  : void
 

implement (id,cin,cout,sp,a:t@ype+)
audio_process$run<PURE(id,a) --> sp><cin,cout>( ag, arrin, arrout ) = {
    val audiograph_pure(sp) = ag 
    val x = audio$input<id><a><cin>( arrin )
    val x0 = audio$process<id><a,a>( x )
    val () = audio_process$step<sp><a><cout>( sp, x0, arrout )
  }

implement (id,cin,cout,sp,a:t@ype+,env:vt@ype+)
audio_process$run<DYN(id,a,env) --> sp><cin,cout>( ag, arrin, arrout ) = {
    val @audiograph_dyn(sp,env0) = ag 
    val x = audio$input<id><a><cin>( arrin )
    val x0 = audio$processR<id><a,a><env>( x, env0 )
    val () = audio_process$step<sp><a><cout>( sp, x0, arrout )
    prval () = fold@ag
  }

implement (id,xs,cin,cout,sp,a:t@ype+)
audio_process$run<PAR(id,a,xs) --> sp><cin,cout>( ag, arrin, arrout ) = {
    val audiograph_par(sp,xs) = ag
    
    val x = audio$input<id><a>( arrin )
    var y : a = audio$init<id><a>( )
    val () = audio_process$fold<id><xs><a,a>(xs,x,y)
 
    val () = audio_process$step<sp><a><cout>( sp, x, arrout )
  }

implement (id,cin,cout,sp0,sp1,a:t@ype+,b:t@ype+)
audio_process$run<REC(id,a,b,sp0) --> sp1><cin,cout>( ag, arrin, arrout ) = {
    val @audiograph_rec(sp1,y,sp0) = ag 
    val x = audio$input<id><b><cin>( arrin )
    val x0 = audio$process<id><(@(b,a)),b>( @(x,y) )
    val () = audio_process$step<sp1><b><cout>( sp1, x0, arrout )
    val () = audio_process$fold$accum<id><sp0><b,a>( sp0, x0, y ) where {
            implement (a:t@ype+,b:t@ype+)
            audio$accumF<id><a,b>( x, y ) = audio$into<id><a,b>( x )
        }
    prval () = fold@ag
  }

implement (id,cin,cout,sp0,sp1,sp2,a:t@ype+)
audio_process$run<IF(id,a,sp0,sp1) --> sp2><cin,cout>( ag, arrin, arrout ) = {
    val audiograph_if(sp2,sp0,sp1) = ag 
    var x : a = audio$input<id><a><cin>( arrin )
    val () = (
        if audio$cond<id><a>( x )
        then audio_process$fold$accum<id><sp0><a,a>( sp0, x, x )
        else audio_process$fold$accum<id><sp1><a,a>( sp1, x, x )
      ) where {
            implement (a:t@ype+,b:t@ype+)
            audio$accumF<id><a,b>( x, y ) = audio$into<id><a,b>( x )
        }
    
    val () = audio_process$step<sp2><a><cout>( sp2, x, arrout )
  }

implement (id,cin,cout,a:t@ype+)
audio_process$run<OUT(id,a)><cin,cout>( ag, arrin, arrout ) = {
    val audiograph_out() = ag 
    val x = audio$input<id><a><cin>( arrin )
    val x0 = audio$process<id><a,a>( x )
    val () = audio$output<a><cout>(x0,arrout)
  }

implement (id,cout,sp,a:t@ype+,b:t@ype+)
audio_process$step<PURE(id,b) --> sp><a><cout>( ag, x, arrout ) = {
    val audiograph_pure(sp) = ag 
    val y = audio$process<id><a,b>( x )
    (** avoid TCO **)
    val () = audio_process$step<sp><b><cout>( sp, y, arrout )
    val () = ignoret(0)
  }

implement (id,cout,sp,a:t@ype+,b:t@ype+,env:vt@ype+)
audio_process$step<DYN(id,b,env) --> sp><a><cout>( ag, x, arrout ) = {
    val @audiograph_dyn(sp,env0) = ag 
    val y = audio$processR<id><a,b>( x, env0 )
    (** avoid TCO **)
    val () = audio_process$step<sp><b><cout>( sp, y, arrout )
    prval () = fold@ag
    val () = ignoret(0)
  }

implement (id,xs,cout,sp,a:t@ype+,b:t@ype+)
audio_process$step<PAR(id,b,xs) --> sp><a><cout>( ag, x, arrout ) = {
    val audiograph_par(sp,xs) = ag
    
    var y : b = audio$init<id><b>()
    val () = audio_process$fold<id><xs><a,b>(xs,x,y)
    (** avoid TCO **)
    val () = audio_process$step<sp><b><cout>( sp, y, arrout )
    val () = ignoret(0)
  }

implement (id,cout,sp0,sp1,a:t@ype+,b:t@ype+,c:t@ype+)
audio_process$step<REC(id,b,c,sp0) --> sp1><a><cout>( ag, x, arrout ) = {
    val @audiograph_rec(sp1,y,sp0) = ag 
    val x0 = audio$process<id><(@(a,b)),c>( @(x,y) )
    (** avoid TCO **)
    val () = audio_process$step<sp1><c><cout>( sp1, x0, arrout )
    val () = audio_process$fold$accum<id><sp0><c,b>( sp0, x0, y ) where {
            implement (a:t@ype+,b:t@ype+)
            audio$accumF<id><a,b>( x, y ) = audio$into<id><a,b>( x )
      }
    prval () = fold@ag
  }

implement (id,cout,sp0,sp1,sp2,a:t@ype+,b:t@ype+)
audio_process$step<IF(id,b,sp0,sp1) --> sp2><a><cout>( ag, x, arrout ) = {
    val audiograph_if(sp2,sp0,sp1) = ag
    var y : b = audio$init<id><b>() 
    val () = (
        if audio$cond<id><a>( x )
        then audio_process$fold$accum<id><sp0><a,b>( sp0, x, y )
        else audio_process$fold$accum<id><sp1><a,b>( sp1, x, y )
      ) where {
            implement (a:t@ype+,b:t@ype+)
            audio$accumF<id><a,b>( x, y ) = audio$into<id><a,b>( x )
        }
    
    (** avoid TCO **)
    val () = audio_process$step<sp2><b><cout>( sp2, y, arrout )
    val () = ignoret(0)
  }

implement (id,cout,a:t@ype+,b:t@ype+)
audio_process$step<OUT(id,b)><a><cout>( ag, x, arrout ) = {
    val audiograph_out() = ag 
    val y = audio$process<id><a,b>( x )
    val () = audio$output<b><cout>(y,arrout)
  }

implement (fid,id,sp,a:t@ype+,b:t@ype+,c:t@ype+)
audio_process$fold$accum<fid><PURE(id,b) --> sp><a,c>( ag, x, y ) = {
    val audiograph_pure(sp) = ag 
    val z = audio$process<id><a,b>( x )
    (** avoid TCO **)
    val () = audio_process$fold$accum<fid><sp><b,c>( sp, z, y )
    val () = ignoret(0)
  }

implement (fid,id,sp,a:t@ype+,b:t@ype+,c:t@ype+,env:vt@ype+)
audio_process$fold$accum<fid><DYN(id,b,env) --> sp><a,c>( ag, x, y ) = {
    val @audiograph_dyn(sp,env0) = ag 
    val z = audio$processR<id><a,b>( x, env0 )
    (** avoid TCO **)
    val () = audio_process$fold$accum<fid><sp><b,c>( sp, z, y )
    prval () = fold@ag
    val () = ignoret(0)
  }

implement (fid,id,xs,sp,a:t@ype+,b:t@ype+,c:t@ype+)
audio_process$fold$accum<fid><PAR(id,b,xs) --> sp><a,c>( ag, x, y ) = {
    val audiograph_par(sp,xs) = ag
    
    var z : b = audio$init<id><b>()
    val () = audio_process$fold<id><xs><a,b>(xs,x,z)
    (** avoid TCO **)
    val () = audio_process$fold$accum<fid><sp><b,c>( sp, z, y )
    val () = ignoret(0)
  }

implement (fid,id,sp0,sp1,a:t@ype+,b:t@ype+,c:t@ype+,d:t@ype+)
audio_process$fold$accum<fid><REC(id,b,c,sp0) --> sp1><a,d>( ag, x, y ) = {
    val @audiograph_rec(sp1,z,sp0) = ag 
    val x0 = audio$process<id><(@(a,b)),c>( @(x,z) )
    (** avoid TCO **)
    val () = audio_process$fold$accum<fid><sp1><c,d>( sp1, x0, y )
    val () = audio_process$fold$accum<id><sp0><c,b>( sp0, x0, z ) where {
            implement (a:t@ype+,b:t@ype+)
            audio$accumF<id><a,b>( x, y ) = audio$into<id><a,b>( x )
      }
    val () = ignoret(0)
    prval () = fold@ag
  }

implement (fid,id,cout,sp0,sp1,sp2,a:t@ype+,b:t@ype+,c:t@ype+)
audio_process$fold$accum<fid><IF(id,b,sp0,sp1) --> sp2><a,c>( ag, x, y ) = {
    val audiograph_if(sp2,sp0,sp1) = ag
    var z : b = audio$init<id><b>() 
    val () = (
        if audio$cond<id><a>( x )
        then audio_process$fold$accum<id><sp0><a,b>( sp0, x, z )
        else audio_process$fold$accum<id><sp1><a,b>( sp1, x, z )
      ) where {
            implement (a:t@ype+,b:t@ype+)
            audio$accumF<id><a,b>( x, y ) = audio$into<id><a,b>( x )
        }
   
    (** Avoid TCO **) 
    val () = audio_process$fold$accum<fid><sp2><b,c>( sp2, z, y )
    val () = ignoret(0)
  }


implement (fid,id,cout,a:t@ype+,b:t@ype+,c:t@ype+)
audio_process$fold$accum<fid><OUT(id,b)><a,c>( ag, x, y ) = {
    val audiograph_out() = ag 
    val z = audio$process<id><a,b>( x )
    val () = audio$accumR<fid><b,c>(z,y)
  }

implement (fid,sp,xs,a:t@ype+,b:t@ype+) 
audio_process$fold<fid>< sp ::: xs ><a,b>( xs, x ,y ) = {
  val audiograph_list_cons(ag,xs0) = xs

  val () = audio_process$fold$accum<fid><sp><a,b>( ag, x, y )
  (** avoid TCO **)
  val () = audio_process$fold<fid><xs><a,b>(xs0,x,y)
  val () = ignoret(0)
}

implement (fid,a:t@ype+,b:t@ype+) 
audio_process$fold<fid>< apnil ><a,b>( xs, x ,y ) = { (** NOOP **) }

implement {p}{cin,cout} 
audio_process( audio ) = {
    
      val p = matrixptr2ptr( audio.buffer ) 
      prval pf = matrixptr_takeout( audio.buffer )

      vtypedef env = @(size_t cin, size_t cout, audiograph(p), audio_io(cin,cout))

      val () = audio_io_process_beg(audio.io)

      var env0 : env = @(audio.sin, audio.sout, audio.state, audio.io)
      val () = matrix_foreachrow_env<float><env>( !p, i2sz(256), audio.sin + audio.sout, env0 )
          where {
            implement matrix_foreachrow$fwork<float><env>( arr, n, env ) 
              = let
                    prval pv = view@arr
                    val () = assertloc( env.0 + env.1 = n )
                    prval (pa0,pa1) = array_v_split{float}{..}{cin + cout}{cin}( pv )

                    val p0 = addr@arr
                    val p1 = ptr_add<float>(p0,env.0)

                    val () = audio_io_sample_in( env.3, !p0 )

                    val () = audio_process$run<p><cin,cout>( env.2, !p0, !p1 )

                    val () = audio_io_sample_out( env.3, !p1 )
 
                    prval pv = array_v_unsplit( pa0, pa1 ) 
                    prval () = view@arr := pv
                 in
                end
          }
      val () = audio_io_process_end(env0.3)
      val () = audio.state := env0.2
      val () = audio.io := env0.3
      prval () = matrixptr_addback( pf | audio.buffer  )
  }


implement {}
UN_audio_get_io( audio ) = $UNSAFE.castvwtp1(audio.io)


end

