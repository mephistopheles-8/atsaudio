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
staload "./../SATS/RAW/OpenSLES.sats"
staload "./../SATS/RAW/OpenSLES_Android.sats"

%{#

#ifndef _ATSAUDIO_OPENSLES_DATS
#define _ATSAUDIO_OPENSLES_DATS

#define _atsaudio_atomic_read(p) __atomic_load_n((atstype_size*)p, __ATOMIC_RELAXED )
#define _atsaudio_atomic_write(p,v) __atomic_store_n((atstype_size*)p, v, __ATOMIC_RELAXED )

#endif
%}

extern
fn atomic_read{n:nat}( &size_t n ) : size_t n = "mac#_atsaudio_atomic_read" 
extern
fn atomic_write{n,m:nat}( &size_t n >> size_t m, size_t m ) : void = "mac#_atsaudio_atomic_write" 

#define null cptr_null()

#define cptrW cptr_wvar
#define cptrR cptr_rvar

extern
castfn cptr_rarr{a:vt0p}{n:nat}(x: &array(a,n)):<> cPtr1(a) // read
extern
castfn cptr_warr{a:vt0p}{n:nat}(x: &array(a?,n) >> array(a,n)):<> cPtr1(a) // write

local

#define NBUFS 64

abst@ype audio_io_sample

vtypedef audio_io_sles_impl(sin:int,sout:int,nbufs:int,bsz:int) = @{
    engine_object = SLObjectItf
  , engine_engine = SLEngineItf
  , input_object = SLObjectItf
  , output_mix = SLObjectItf
  , player_object = SLObjectItf
  , player_play   = SLPlayItf
  , recorder_record   = SLRecordItf
  , input_buffer_queue = SLAndroidSimpleBufferQueueItf
  , output_buffer_queue = SLAndroidSimpleBufferQueueItf

  , inbuf = arrayptr(audio_io_sample,bsz*sin*nbufs)
  , outbuf = arrayptr(audio_io_sample,bsz*sout*nbufs)

  , nbufs = size_t nbufs
  , t = sizeLt(bsz)
  , buf_index_in = sizeLt(nbufs)
  , buf_index_out = sizeLt(nbufs)
  , blocksize = size_t bsz
  , sin = size_t sin
  , sout = size_t sout
  , sem = sizeBtwe(0,2)
  , processing = sizeBtwe(0,2)
  , sample_format = SLPCMSampleFormat
  }
datavtype audio_io_sles(sin:int,sout:int) =
  | {nbufs,bsz:pos} AIO_SLES of audio_io_sles_impl(sin,sout,nbufs,bsz) 

absimpl audio_io(sin,sout) = audio_io_sles(sin,sout)

absimpl SLuint32 = uint

in
implement {}
audio_system_init() = ()
implement {}
audio_system_shutdown() = ()

implement {}
audio_io_desired_sample_rate() = i2sz(44100)
implement {}
audio_io_desired_blocksize() = i2sz(128)

fun {} audio_io_sles_sample_rate() : SLSamplingRate =
  case- sz2i( audio_io_desired_sample_rate<>() ) of
   | 8000   => SL_SAMPLINGRATE_8
   | 11025  => SL_SAMPLINGRATE_11_025
   | 12000  => SL_SAMPLINGRATE_12
   | 16000  => SL_SAMPLINGRATE_16
   | 22050  => SL_SAMPLINGRATE_22_05
   | 24000  => SL_SAMPLINGRATE_24
   | 32000  => SL_SAMPLINGRATE_32
   | 44100  => SL_SAMPLINGRATE_44_1
   | 48000  => SL_SAMPLINGRATE_48
   | 64000  => SL_SAMPLINGRATE_64
   | 88200  => SL_SAMPLINGRATE_88_2
   | 96000  => SL_SAMPLINGRATE_96
   | 192000 => SL_SAMPLINGRATE_192


fun {} audio_io_sles_default_channel_layout( n : size_t ) : SLSpeaker =
  case- sz2i( n ) of 
   | 0 => SL_SPEAKER_NONE  
   | 1 => SL_SPEAKER_FRONT_CENTER
   | 2 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT
   | 3 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT lor SL_SPEAKER_FRONT_CENTER
   | 4 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT lor
          SL_SPEAKER_BACK_LEFT lor SL_SPEAKER_BACK_RIGHT
   | 5 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT lor SL_SPEAKER_FRONT_CENTER lor
          SL_SPEAKER_BACK_LEFT lor SL_SPEAKER_BACK_RIGHT
   | 6 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT lor
          SL_SPEAKER_SIDE_LEFT lor SL_SPEAKER_SIDE_RIGHT lor 
          SL_SPEAKER_BACK_LEFT lor SL_SPEAKER_BACK_RIGHT 
   | 7 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT lor SL_SPEAKER_FRONT_CENTER lor
          SL_SPEAKER_SIDE_LEFT lor SL_SPEAKER_SIDE_RIGHT lor 
          SL_SPEAKER_BACK_LEFT lor SL_SPEAKER_BACK_RIGHT 
   | 8 => SL_SPEAKER_FRONT_LEFT lor SL_SPEAKER_FRONT_RIGHT lor SL_SPEAKER_FRONT_CENTER lor
          SL_SPEAKER_SIDE_LEFT lor SL_SPEAKER_SIDE_RIGHT lor 
          SL_SPEAKER_BACK_LEFT lor SL_SPEAKER_BACK_RIGHT lor SL_SPEAKER_BACK_CENTER 

fun {} audio_io_sles_input_channels( sin : size_t ) : SLSpeaker =
  audio_io_sles_default_channel_layout<>( sin ) 

fun {} audio_io_sles_output_channels( sout : size_t ) : SLSpeaker = 
  audio_io_sles_default_channel_layout<>( sout ) 

fun {} audio_io_sles_sampleformat( ) : SLPCMSampleFormat 
  = SL_PCMSAMPLEFORMAT_FIXED_16 

fun {} audio_io_sles_byteorder( ) : SLByteOrder 
  = SL_BYTEORDER_LITTLEENDIAN 

fun {} audio_io_sles_container_size( ) : SLPCMSampleFormat = (
  ifcase 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_8 => SL_PCMSAMPLEFORMAT_FIXED_8 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_16 => SL_PCMSAMPLEFORMAT_FIXED_16 
   | _  => SL_PCMSAMPLEFORMAT_FIXED_32 
  ) where {
    val sf = audio_io_sles_sampleformat<>()
  }

(** Nothing here makes these conversions "safe", just explicit **)

extern
praxi i8_samp( &SLint8 >> audio_io_sample ) : void
extern
praxi i16_samp( &SLint16 >> audio_io_sample ) : void
extern
praxi i32_samp( &SLint32 >> audio_io_sample ) : void

extern
praxi samp_i8( &audio_io_sample  >> SLint8 ) : void 
extern
praxi samp_i16( &audio_io_sample  >> SLint16 ) : void 
extern
praxi samp_i32( &audio_io_sample  >> SLint32 ) : void
 
extern
praxi samp_i8'( &audio_io_sample?  >> SLint8? ) : void 
extern
praxi samp_i16'( &audio_io_sample?  >> SLint16? ) : void 
extern
praxi samp_i32'( &audio_io_sample? >> SLint32? ) : void 

extern
castfn i8_int( SLint8 ) : int
extern
castfn i16_int( SLint16 ) : int
extern
castfn i32_int( SLint32 ) : int

extern
castfn i8_sampbuf{n:nat}( arrayptr(SLint8,n) ) : arrayptr(audio_io_sample,n)
extern
castfn i16_sampbuf{n:nat}( arrayptr(SLint16,n) ) : arrayptr(audio_io_sample,n)
extern
castfn i32_sampbuf{n:nat}( arrayptr(SLint32,n) ) : arrayptr(audio_io_sample,n)

extern
praxi samp_i8buf{n:nat}( &array(audio_io_sample,n) >> array(SLint8,n) ) : void
extern
praxi samp_i16buf{n:nat}( &array(audio_io_sample,n) >> array(SLint16,n) ) : void
extern
praxi samp_i32buf{n:nat}( &array(audio_io_sample,n) >> array(SLint32,n) ) : void
extern
praxi samp_i8buf'{n:nat}( &array(audio_io_sample?,n) >> array(SLint8?,n) ) : void
extern
praxi samp_i16buf'{n:nat}( &array(audio_io_sample?,n) >> array(SLint16?,n) ) : void
extern
praxi samp_i32buf'{n:nat}( &array(audio_io_sample?,n) >> array(SLint32?,n) ) : void

extern
praxi i8buf_samp{n:nat}( &array(SLint8,n) >> array(audio_io_sample,n) ) : void
extern
praxi i16buf_samp{n:nat}( &array(SLint16,n) >> array(audio_io_sample,n) ) : void
extern
praxi i32buf_samp{n:nat}( &array(SLint32,n) >> array(audio_io_sample,n) ) : void
extern
praxi i8buf_samp'{n:nat}( &array(SLint8,n) >> array(audio_io_sample,n) ) : void
extern
praxi i16buf_samp'{n:nat}( &array(SLint16,n) >> array(audio_io_sample,n) ) : void
extern
praxi i32buf_samp'{n:nat}( &array(SLint32,n) >> array(audio_io_sample,n) ) : void

fun {} audio_io_sample_from_float{n:nat}( 
    samp: &array(audio_io_sample?,n) >> array(audio_io_sample,n)
  , x: &array(float,n)
  , n: size_t n
  , sf: SLPCMSampleFormat 
) : void =
  ifcase 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_8  => {
        prval () = samp_i8buf'( samp )
        val () = array_mapto<float><SLint8>( x, samp, n ) where {
          implement 
          array_mapto$fwork<float><SLint8>( x, y ) =
             y := SLi8( g0float2int( x*g0int2float(0x7F) ) )
        }
 
        prval () = i8buf_samp( samp ) 
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_16  => {
        prval () = samp_i16buf'( samp ) 
        val () = array_mapto<float><SLint16>( x, samp, n ) where {
          implement 
          array_mapto$fwork<float><SLint16>( x, y ) =
             y := SLi16( g0float2int( x*g0int2float(0x7FFF) ) )
            
        }
        prval () = i16buf_samp( samp ) 
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_20  => {
        prval () = samp_i32buf'( samp ) 
        val () = array_mapto<float><SLint32>( x, samp, n ) where {
          implement 
          array_mapto$fwork<float><SLint32>( x, y ) =
             y := SLi32( g0float2int( x*g0int2float(0x7FFFF) ) )
        }
        prval () = i32buf_samp( samp ) 
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_24  => {
        prval () = samp_i32buf'( samp ) 
        val () = array_mapto<float><SLint32>( x, samp, n ) where {
          implement 
          array_mapto$fwork<float><SLint32>( x, y ) =
             y := SLi32( g0float2int( x*g0int2float(0x7FFFFF) ) )
        }
        prval () = i32buf_samp( samp ) 
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_28  => {
        prval () = samp_i32buf'( samp ) 
        val () = array_mapto<float><SLint32>( x, samp, n ) where {
          implement 
          array_mapto$fwork<float><SLint32>( x, y ) =
             y := SLi32( g0float2int( x*g0int2float(0x7FFFFFF) ) )
        }
        prval () = i32buf_samp( samp ) 
    } 
   | _ (*sf = SL_PCMSAMPLEFORMAT_FIXED_32 *) => {
        prval () = samp_i32buf'( samp ) 
        val () = array_mapto<float><SLint32>( x, samp, n ) where {
          implement 
          array_mapto$fwork<float><SLint32>( x, y ) =
             y := SLi32( g0float2int( x*g0int2float(0x7FFFFFFF) ) )
        }
        prval () = i32buf_samp( samp ) 
    } 

fun {} audio_io_sample_to_float{n:nat}( 
    samp: &array(audio_io_sample,n)
  , x: &array(float?,n) >> array(float,n)
  , n: size_t n
  , sf: SLPCMSampleFormat 
) : void =
  ifcase 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_8  => {
        prval () = samp_i8buf( samp ) 
        val () = array_mapto<SLint8><float>(samp,x,n) where {
          implement 
          array_mapto$fwork<SLint8><float>( x, y ) =
             y := g0int2float(i8_int(x))/g0int2float(0x7F) 
        }
        prval () = i8buf_samp( samp )
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_16  => {
        prval () = samp_i16buf( samp )
        val () = array_mapto<SLint16><float>(samp,x,n) where {
          implement 
          array_mapto$fwork<SLint16><float>( x, y ) =
             y := g0int2float(i16_int(x))/g0int2float(0x7FFF) 
        }
        prval () = i16buf_samp( samp )
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_20  => {
        prval () = samp_i32buf( samp ) 
        val () = array_mapto<SLint32><float>(samp,x,n) where {
          implement 
          array_mapto$fwork<SLint32><float>( x, y ) =
             y := g0int2float(i32_int(x))/g0int2float(0x7FFFF) 
        }
        prval () = i32buf_samp( samp )
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_24  => {
        prval () = samp_i32buf( samp ) 
        val () = array_mapto<SLint32><float>(samp,x,n) where {
          implement 
          array_mapto$fwork<SLint32><float>( x, y ) =
             y := g0int2float(i32_int(x))/g0int2float(0x7FFFFF) 
        }
        prval () = i32buf_samp( samp )
    } 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_28  => {
        prval () = samp_i32buf( samp ) 
        val () = array_mapto<SLint32><float>(samp,x,n) where {
          implement 
          array_mapto$fwork<SLint32><float>( x, y ) =
             y := g0int2float(i32_int(x))/g0int2float(0x7FFFFFF) 
        }
        prval () = i32buf_samp( samp )
    } 
   | _ (*sf = SL_PCMSAMPLEFORMAT_FIXED_32 *) => {
        prval () = samp_i32buf( samp ) 
        val () = array_mapto<SLint32><float>(samp,x,n) where {
          implement 
          array_mapto$fwork<SLint32><float>( x, y ) =
             y := g0int2float(i32_int(x))/g0int2float(0x7FFFFFF) 
        }
        prval () = i32buf_samp( samp )
    } 

fun {} audio_io_sles_allocate_buffer{sz:nat}( sz: size_t sz ) : arrayptr(audio_io_sample,sz) = (
  ifcase 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_8 => 
      i8_sampbuf( arrayptr_make_elt<SLint8>( sz, SLi8(0)) ) 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_16 =>  
      i16_sampbuf( arrayptr_make_elt<SLint16>( sz, SLi16(0)) ) 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_32 => 
      i32_sampbuf( arrayptr_make_elt<SLint32>( sz, SLi32(0)) )
   | _ =>  
      i32_sampbuf( arrayptr_make_elt<SLint32>( sz, SLi32(0)) )
  ) where {
    val sf = audio_io_sles_sampleformat<>()
  }

fun {} audio_io_sles_sample_size(sf: SLPCMSampleFormat ) : size_t = (
  ifcase 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_8 => sizeof<SLint8> 
   | sf = SL_PCMSAMPLEFORMAT_FIXED_16 => sizeof<SLint16> 
   | _ =>  sizeof<SLint32>
  )
implement {}
audio_io_init{cin,cout}(sin,sout) =
 let
    var engine_object : SLObjectItf
    var engine_engine : SLEngineItf
    var output_mix : SLObjectItf
    var input_object : SLObjectItf
    var player_object : SLObjectItf
    var player_play   : SLPlayItf
    var recorder_record   : SLRecordItf
    var input_buffer_queue : SLAndroidSimpleBufferQueueItf
    var output_buffer_queue : SLAndroidSimpleBufferQueueItf

    var input_buffer_queue_loc : SLDataLocator_AndroidSimpleBufferQueue 
    var output_buffer_queue_loc : SLDataLocator_AndroidSimpleBufferQueue 
    var output_mix_loc : SLDataLocator_OutputMix
    var input_loc : SLDataLocator_IODevice
    
    var input_pcm : SLDataFormat_PCM 
    var input_source : SLDataSource
    var input_sink : SLDataSink

    var output_pcm : SLDataFormat_PCM 
    var output_source : SLDataSource
    var output_sink : SLDataSink

    var input_ids = @[SLInterfaceID](
      SL_IID_ANDROIDSIMPLEBUFFERQUEUE
    )
    var input_req = @[SLboolean](
      SL_BOOLEAN_TRUE
    )

    var output_ids = @[SLInterfaceID](
      SL_IID_ANDROIDSIMPLEBUFFERQUEUE
    )
    var output_req = @[SLboolean](
      SL_BOOLEAN_TRUE
    )

    val slres = slCreateEngine( cptrW{SLObjectItf}(engine_object), 0U, null, 0U, null, null )
    val () 
      = assert_errmsg( slres = SL_RESULT_SUCCESS
          , "[atsaudio] Could not create OpenSLES engine" )

    val slres = (!engine_object).Realize( engine_object, SL_BOOLEAN_FALSE ) 
    val () 
      = assert_errmsg( slres = SL_RESULT_SUCCESS
          , "[atsaudio] Could not realize OpenSLES engine" )
    
    val slres = (!engine_object).GetInterface( engine_object, SL_IID_ENGINE, addr@engine_engine )
    val () 
      = assert_errmsg( slres = SL_RESULT_SUCCESS
          , "[atsaudio] Could not get OpenSLES engine interface" )
    val _ = cptrW{SLEngineItf}(engine_engine)
    
    val slres = (!engine_engine).CreateOutputMix( engine_engine, cptrW{SLObjectItf}(output_mix), 0U, null, null )
    val () 
      = assert_errmsg( slres = SL_RESULT_SUCCESS
          , "[atsaudio] Could not create OpenSLES output mix" )

    val slres = (!output_mix).Realize( output_mix, SL_BOOLEAN_FALSE ) 
    val () 
      = assert_errmsg( slres = SL_RESULT_SUCCESS
          , "[atsaudio] Could not realize OpenSLES output mix" )

    val () = (
        input_loc.locatorType := SL_DATALOCATOR_IODEVICE;
        input_loc.deviceType := SL_IODEVICE_AUDIOINPUT;
        input_loc.deviceID := SL_DEFAULTDEVICEID_AUDIOINPUT;
        input_loc.device := $UNSAFE.cast{SLObjectItf}(the_null_ptr);
      )

    val () = (
        output_mix_loc.locatorType := SL_DATALOCATOR_OUTPUTMIX;
        output_mix_loc.outputMix := output_mix;
      )
        
    val () = (
        input_buffer_queue_loc.locatorType := SL_DATALOCATOR_ANDROIDSIMPLEBUFFERQUEUE;
        input_buffer_queue_loc.numBuffers := 1U;
      )

    val () = (
        output_buffer_queue_loc.locatorType := SL_DATALOCATOR_ANDROIDSIMPLEBUFFERQUEUE;
        output_buffer_queue_loc.numBuffers := 1U;
      )

    val () = (
        input_pcm.formatType := SL_DATAFORMAT_PCM;
        input_pcm.numChannels := SLu32(sin);
        input_pcm.samplesPerSec := audio_io_sles_sample_rate<>();
        input_pcm.bitsPerSample := audio_io_sles_sampleformat<>();
        input_pcm.containerSize := audio_io_sles_container_size<>();
        input_pcm.channelMask := audio_io_sles_input_channels<>(sin);
        input_pcm.endianness := audio_io_sles_byteorder<>();
      )

    val () = (
        output_pcm.formatType := SL_DATAFORMAT_PCM;
        output_pcm.numChannels := SLu32(sout);
        output_pcm.samplesPerSec := audio_io_sles_sample_rate<>();
        output_pcm.bitsPerSample := audio_io_sles_sampleformat<>();
        output_pcm.containerSize := audio_io_sles_container_size<>();
        output_pcm.channelMask := audio_io_sles_output_channels<>(sout);
        output_pcm.endianness := audio_io_sles_byteorder<>();
      )

    val () = (
        input_source.pLocator := addr@input_loc;
        input_source.pFormat := the_null_ptr;
      )

    val () = (
        output_source.pLocator := addr@output_buffer_queue_loc;
        output_source.pFormat := addr@output_pcm;
      )
    
    val () = (
        input_sink.pLocator := addr@input_buffer_queue_loc;
        input_sink.pFormat := addr@input_pcm;
      )

    val () = (
        output_sink.pLocator := addr@output_mix_loc;
        output_sink.pFormat := the_null_ptr;
      )
  

    val () = (
       if sin > 0
       then {
          val slres 
            = (!engine_engine).CreateAudioRecorder( 
                  engine_engine
                , cptrW{SLObjectItf}(input_object)
                , cptrR(input_source)
                , cptrR(input_sink)
                , 1U
                , cptr_rarr(input_ids)
                , cptr_rarr(input_req) 
              )
          val () = println!( $UNSAFE.cast{int}(slres) )
          val () 
            = assert_errmsg( slres = SL_RESULT_SUCCESS
                , "[atsaudio] Could not create OpenSLES audio recorder" )
         
       
          val slres = (!input_object).Realize( input_object, SL_BOOLEAN_FALSE )
          val () 
            = assert_errmsg( slres = SL_RESULT_SUCCESS
                , "[atsaudio] Could not realize OpenSLES audio recorder" )

          val slres = (!input_object).GetInterface( input_object, SL_IID_ANDROIDSIMPLEBUFFERQUEUE, addr@input_buffer_queue )
          val () 
            = assert_errmsg( slres = SL_RESULT_SUCCESS
                , "[atsaudio] Could not get OpenSLES input buffer queue interface" )
          val _ = cptrW{SLAndroidSimpleBufferQueueItf}( input_buffer_queue )
          
          val slres = (!input_object).GetInterface( input_object, SL_IID_RECORD, addr@recorder_record )
          val () 
            = assert_errmsg( slres = SL_RESULT_SUCCESS
                , "[atsaudio] Could not get OpenSLES recorder record interface" )
          val _ = cptrW{SLRecordItf}( recorder_record )
        }
        else {
          val _ =  cptrW{SLObjectItf}(input_object)
          val _ = cptrW{SLAndroidSimpleBufferQueueItf}( input_buffer_queue )
          val _ = cptrW{SLRecordItf}( recorder_record )
        }
    )

    val () = (
      if sout > 0
      then {
        val slres 
          = (!engine_engine).CreateAudioPlayer( 
                engine_engine
              , cptrW{SLObjectItf}(player_object)
              , cptrR(output_source)
              , cptrR(output_sink)
              , 1U
              , cptr_rarr(output_ids)
              , cptr_rarr(output_req) 
            )
        val () 
          = assert_errmsg( slres = SL_RESULT_SUCCESS
              , "[atsaudio] Could not create OpenSLES audio player" )

        val slres = (!player_object).Realize( player_object, SL_BOOLEAN_FALSE )
        val () 
          = assert_errmsg( slres = SL_RESULT_SUCCESS
              , "[atsaudio] Could not realize OpenSLES audio player" )
     
        val slres = (!player_object).GetInterface( player_object, SL_IID_ANDROIDSIMPLEBUFFERQUEUE, addr@output_buffer_queue )
        val () 
          = assert_errmsg( slres = SL_RESULT_SUCCESS
              , "[atsaudio] Could not get OpenSLES player buffer queue interface" )
        val _ = cptrW{SLAndroidSimpleBufferQueueItf}( output_buffer_queue )
        
        val slres = (!player_object).GetInterface( player_object, SL_IID_PLAY, addr@player_play )
        val () 
          = assert_errmsg( slres = SL_RESULT_SUCCESS
              , "[atsaudio] Could not get OpenSLES player play interface" )
        val _ = cptrW{SLPlayItf}( player_play )
      }
      else {
        val _ =  cptrW{SLObjectItf}(player_object)
        val _ = cptrW{SLAndroidSimpleBufferQueueItf}( output_buffer_queue )
        val _ = cptrW{SLPlayItf}( player_play )
      }
    )
    val [bsz:int] bsz = audio_io_desired_blocksize<>()
    (** FIXME **)
    val nbufs = i2sz(NBUFS)
    val () = assertloc( nbufs*bsz*sin >= 0 )  
    val () = assertloc( nbufs*bsz*sout >= 0 )  
  
    val impl : audio_io_sles_impl(cin,cout,NBUFS,bsz) = @{
        engine_object = engine_object
      , engine_engine = engine_engine
      , input_object = input_object
      , output_mix = output_mix
      , player_object = player_object
      , player_play   = player_play
      , recorder_record   = recorder_record
      , input_buffer_queue = input_buffer_queue
      , output_buffer_queue = output_buffer_queue

      , inbuf = audio_io_sles_allocate_buffer<>( nbufs*bsz*sin )
      , outbuf = audio_io_sles_allocate_buffer<>( nbufs*bsz*sout )
      , nbufs = nbufs
      , t = i2sz(0)
      , buf_index_in = i2sz(0)
      , buf_index_out = i2sz(0)
      , blocksize = bsz
      , sin = sin
      , sout = sout
      , sem = i2sz(0)
      , processing = i2sz(0)
      , sample_format = audio_io_sles_sampleformat<>()
      } 

  in AIO_SLES( impl )
 end 

implement {}
audio_io_free(aio) = 
  case+ aio of
  | @AIO_SLES(impl) => {
        val output_mix = impl.output_mix
        val player_play = impl.player_play
        val recorder_record = impl.recorder_record
        val input_object = impl.input_object
        val player_object = impl.player_object
        val engine_object = impl.engine_object
        val sin = impl.sin
        val sout = impl.sout

        (** Stop processing, and wait for the message to be recieved **)
        val () = atomic_write( impl.processing, i2sz(2) )
        val () = while( atomic_read(impl.processing) != i2sz(0) ) ()

        val () = (
          if sin > i2sz(0)
          then {
            val slres = (!recorder_record).SetRecordState( recorder_record, SL_RECORDSTATE_STOPPED )
            val () 
              = assert_errmsg( slres = SL_RESULT_SUCCESS
                  , "[atsaudio] Could not set OpenSLES record state to `stopped`" )
            val () = (!input_object).Destroy( input_object )
          }
          else ()
        )

        val () = (
          if sout > i2sz(0)
          then {
            val slres = (!player_play).SetPlayState( player_play, SL_PLAYSTATE_STOPPED )
            val () 
              = assert_errmsg( slres = SL_RESULT_SUCCESS
                  , "[atsaudio] Could not set OpenSLES play state to `stopped`" )
            val () = (!player_object).Destroy( player_object )
          }
          else ()
        )

        val () = (!output_mix).Destroy( output_mix )
        val () = (!engine_object).Destroy( engine_object )
        prval () = fold@aio
        val ~AIO_SLES(impl) = aio    
        val () = free( impl.inbuf )
        val () = free( impl.outbuf )
    }

implement {}
audio_io_process_beg(aio,t) =
  case+ aio of 
  | @AIO_SLES(impl) => {
      val () = impl.t := i2sz(0)
      prval () = fold@aio
  }
 
implement {}
audio_io_process_end(aio) = ()
implement {}
audio_io_blocksize(aio) = audio_io_desired_blocksize<>()
implement {}
audio_io_sample_rate(aio) = audio_io_desired_sample_rate<>()
implement {}
audio_io_sample_in{sin,sout}(aio, buf) = 
  case+ aio of 
  | @AIO_SLES(impl) => (
    (** Make sure we are still processing, and that there is data on the input buffer **)
    if atomic_read(impl.processing) = 1 && atomic_read( impl.sem ) = 1
    then {
        val bsz = impl.blocksize
        val sin = impl.sin
        val t   = impl.t
        val (pfarr | p0) = arrayptr_takeout_viewptr( impl.inbuf ) 

        val ssz = audio_io_sles_sample_size( impl.sample_format )

        (** Note; we're reading buf_index_out here intentionally. **)
        val (pfx, pff | p1)  = $UNSAFE.ptr_vtake{array(audio_io_sample,sin)}( 
          add_ptr_bsz( p0, atomic_read(impl.buf_index_out)*sin*ssz*bsz + t*sin*ssz ) 
        )
        
        val () = audio_io_sample_to_float( !p1, buf, sin, impl.sample_format )

        prval () = pff( pfx )

        prval () = arrayptr_addback( pfarr | impl.inbuf )
        prval () = fold@aio
    }
    else {
        (** If there is no data on the input buffer, fill input with zeros **)
        val sin = impl.sin
        val () = array_initize<float>( buf, sin ) where {
          implement 
          array_initize$init<float>(ind,x) = x := 0.0f
        }
        prval () = fold@aio
    }
  )

implement {}
audio_io_sample_out{sin,sout}(aio, buf) = 
  case+ aio of 
  | @AIO_SLES(impl) => (
    (** Make sure we are still processing **)
    if atomic_read( impl.processing ) = i2sz(1)
    then {
        val bsz = impl.blocksize
        val sout = impl.sout
        val t   = impl.t
        val (pfarr | p0) = arrayptr_takeout_viewptr( impl.outbuf ) 

        val ssz = audio_io_sles_sample_size( impl.sample_format )

        val (pfx, pff | p1)  = $UNSAFE.ptr_vtake{array(audio_io_sample?,sout)}(
           add_ptr_bsz( p0, atomic_read(impl.buf_index_out)*sout*ssz*bsz + t*sout*ssz ) 
        )
        
        val () = audio_io_sample_from_float( !p1, buf, sout, impl.sample_format )

        prval () = pff( pfx )

        prval () = arrayptr_addback( pfarr | impl.outbuf ) 

        val () = impl.t := (t + 1) mod bsz
        prval () = fold@aio
    }
   else {
        val sout = impl.sout
        val () = array_initize<float>( buf, sout ) where {
          implement 
          array_initize$init<float>(ind,x) = x := 0.0f
        }
        (** Tell the main thread we received the message to stop processing **)
        val () =  atomic_write( impl.processing, i2sz(0) )
        prval () = fold@aio
    }
  )

implement {proc}{cin,cout} 
audio_run(  audio ) = (
  case+ aio of
   | @AIO_SLES(impl) => {
        val player_play = impl.player_play
        val recorder_record = impl.recorder_record
        val input_buffer_queue = impl.input_buffer_queue
        val output_buffer_queue = impl.output_buffer_queue
        val ssz = audio_io_sles_sample_size( impl.sample_format )
        val sin = impl.sin
        val sout = impl.sout
        val () = impl.processing := i2sz(1)
        val () = (
          if sin > 0
          then {
              val slres 
                = (!input_buffer_queue).RegisterCallback( 
                        input_buffer_queue
                      , lam(bq,state) => {
                          val audio = $UNSAFE.castvwtp1{audio(cin,cout,proc)}(state)
                          
                          val aio = UN_audio_get_io( audio )
                          val @AIO_SLES(impl) = aio
                          val input_buffer_queue = impl.input_buffer_queue


                          val ssz = audio_io_sles_sample_size( impl.sample_format )
                          val bsz = impl.blocksize
                          val sin = impl.sin
                          val offs = bsz*sin*ssz 
                          val slres 
                            = (!input_buffer_queue).Enqueue( 
                                input_buffer_queue, add_ptr_bsz( ptrcast(impl.inbuf), offs*impl.buf_index_in), SLu32(offs) )
                           
                          val () = atomic_write( impl.sem, i2sz(1) )

                          val () = atomic_write(impl.buf_index_in, (impl.buf_index_in + 1) mod impl.nbufs)

                          (** If there is no output, we need to do processing here **)

                          val () = 
                            if impl.sout = 0 then
                            audio_process<proc><cin,cout>( audio, impl.blocksize )

                          prval () = fold@aio
                          prval () = $UNSAFE.cast2void( aio )
                          prval () = $UNSAFE.cast2void( audio )
                        }
                      , $UNSAFE.castvwtp1{ptr}( audio ) 
                    ) 
              val () 
                = assert_errmsg( slres = SL_RESULT_SUCCESS
                    , "[atsaudio] Could not set OpenSLES input player buffer queue callback" )
              val slres = (!recorder_record).SetRecordState( recorder_record, SL_RECORDSTATE_RECORDING )
              val () 
                = assert_errmsg( slres = SL_RESULT_SUCCESS
                    , "[atsaudio] Could not set OpenSLES record state to `recording`" )
              (** This should initiate processing **)
              val slres 
                = (!input_buffer_queue).Enqueue( input_buffer_queue, ptrcast(impl.inbuf), SLu32(impl.blocksize*impl.sin*ssz) ) 
              val () 
                = assert_errmsg( slres = SL_RESULT_SUCCESS
                    , "[atsaudio] Could not enqueue OpenSLES buffer" )
          }
          else ()
        )
        val () = (
          if sout > 0
          then { 
            val slres 
              = (!output_buffer_queue).RegisterCallback( 
                      output_buffer_queue
                    , lam(bq,state) => {
                        val audio = $UNSAFE.castvwtp1{audio(cin,cout,proc)}(state)
                        
                        val aio = UN_audio_get_io( audio )
                        val @AIO_SLES(impl) = aio
                        val output_buffer_queue = impl.output_buffer_queue
                        val () =  audio_process<proc><cin,cout>( audio, impl.blocksize )
                        val ssz = audio_io_sles_sample_size( impl.sample_format )
                        val bsz = impl.blocksize
                        val sout = impl.sout
                        val offs = bsz*sout*ssz 
                        val slres 
                          = (!output_buffer_queue).Enqueue( 
                              output_buffer_queue, add_ptr_bsz( ptrcast(impl.outbuf), offs*impl.buf_index_out), SLu32(offs) )
                        
                        val () = atomic_write(impl.buf_index_out, (impl.buf_index_out + 1) mod impl.nbufs)

                        prval () = fold@aio
                        prval () = $UNSAFE.cast2void( aio )
                        prval () = $UNSAFE.cast2void( audio )
                      }
                    , $UNSAFE.castvwtp1{ptr}( audio ) 
                  ) 
            val () 
              = assert_errmsg( slres = SL_RESULT_SUCCESS
                  , "[atsaudio] Could not set OpenSLES output player buffer queue callback" )

            val slres = (!player_play).SetPlayState( player_play, SL_PLAYSTATE_PLAYING )
            val () 
              = assert_errmsg( slres = SL_RESULT_SUCCESS
                  , "[atsaudio] Could not set OpenSLES play state to `playing`" )

            (** This should initiate processing **)
            val slres 
              = (!output_buffer_queue).Enqueue( output_buffer_queue, ptrcast(impl.outbuf), SLu32(impl.blocksize*impl.sout*ssz) )
            val () 
              = assert_errmsg( slres = SL_RESULT_SUCCESS
                  , "[atsaudio] Could not enqueue OpenSLES buffer" )
          }
          else ()
        )
        prval () = fold@aio
        prval () = $UNSAFE.cast2void( aio )
    }
  ) where {
    val aio = UN_audio_get_io( audio )
  }

end
