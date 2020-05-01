(**
 [OpenSLES]
 Raw bindings to OpenSLES

 project: opensles-raw 
 author : M. Bellaire
 year   : 2020
 license: MIT
*) 

%{#
#ifndef _SLES_ATS2_SLES_SATS
#define _SLES_ATS2_SLES_SATS

#include <SLES/OpenSLES.h>

#define _sles_ats2_lor(x,y) ((x) | (y))
#define _sles_ats2_lhas(x,y) (((x) & (y)) != 0)
#define _sles_ats2_eq(x,y) ((x) == (y))
#define _sles_ats2_neq(x,y) ((x) != (y))

#define _sles_object_deref(x) (*(*(x)))

#endif

%}
(**  **)


macdef SL_PROFILES_GAME = $extval(int,"SL_PROFILES_GAME")
macdef SL_AUDIOCODEC_REAL = $extval(int,"SL_AUDIOCODEC_REAL")
macdef SL_AUDIOSTREAMFORMAT_ADIF = $extval(int,"SL_AUDIOSTREAMFORMAT_ADIF")
macdef SL_CONTAINERTYPE_WAV = $extval(int,"SL_CONTAINERTYPE_WAV")
macdef SL_RATEPROP_SILENTAUDIO = $extval(int,"SL_RATEPROP_SILENTAUDIO")
macdef SL_NODE_PARENT = $extval(int,"SL_NODE_PARENT")
macdef SL_CHARACTERENCODING_ASCII = $extval(int,"SL_CHARACTERENCODING_ASCII")
macdef SL_CHARACTERENCODING_ISO88596 = $extval(int,"SL_CHARACTERENCODING_ISO88596")
macdef SL_AUDIOCODEC_PCM = $extval(int,"SL_AUDIOCODEC_PCM")
macdef SL_RATEPROP_PITCHCORAUDIO = $extval(int,"SL_RATEPROP_PITCHCORAUDIO")
macdef SL_METADATA_FILTER_ENCODING = $extval(int,"SL_METADATA_FILTER_ENCODING")
macdef SL_CONTAINERTYPE_AMR = $extval(int,"SL_CONTAINERTYPE_AMR")
macdef SL_REVERBPRESET_MEDIUMHALL = $extval(int,"SL_REVERBPRESET_MEDIUMHALL")
macdef SL_AUDIOPROFILE_AMRWBPLUS = $extval(int,"SL_AUDIOPROFILE_AMRWBPLUS")
macdef SL_I3DL2_ENVIRONMENT_PRESET_CAVE = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_CAVE")
macdef SL_AUDIOPROFILE_PCM = $extval(int,"SL_AUDIOPROFILE_PCM")
macdef SL_CONTAINERTYPE_ASF = $extval(int,"SL_CONTAINERTYPE_ASF")
macdef SL_CONTAINERTYPE_AVI = $extval(int,"SL_CONTAINERTYPE_AVI")
macdef SL_TIME_UNKNOWN = $extval(int,"SL_TIME_UNKNOWN")
macdef SL_EQUALIZER_UNDEFINED = $extval(int,"SL_EQUALIZER_UNDEFINED")
macdef SL_API = $extval(int,"SL_API")
macdef SL_CONTAINERTYPE_JPG2000 = $extval(int,"SL_CONTAINERTYPE_JPG2000")
macdef SL_METADATATRAVERSALMODE_NODE = $extval(int,"SL_METADATATRAVERSALMODE_NODE")
macdef SL_AUDIOMODE_REALAUDIO_8 = $extval(int,"SL_AUDIOMODE_REALAUDIO_8")
macdef SL_NODETYPE_IMAGE = $extval(int,"SL_NODETYPE_IMAGE")
macdef SL_MILLIHERTZ_MAX = $extval(int,"SL_MILLIHERTZ_MAX")
macdef SL_I3DL2_ENVIRONMENT_PRESET_HANGAR = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_HANGAR")
macdef SL_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL")
macdef SL_AUDIOMODE_WMAPRO_LEVELM1 = $extval(int,"SL_AUDIOMODE_WMAPRO_LEVELM1")
macdef SL_OBJECTID_3DGROUP = $extval(int,"SL_OBJECTID_3DGROUP")
macdef SL_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM")
macdef SL_DYNAMIC_ITF_EVENT_RESOURCES_LOST_PERMANENTLY = $extval(int,"SL_DYNAMIC_ITF_EVENT_RESOURCES_LOST_PERMANENTLY")
macdef SL_AUDIOMODE_AAC_ERLC = $extval(int,"SL_AUDIOMODE_AAC_ERLC")
macdef SL_PRIORITY_HIGH = $extval(int,"SL_PRIORITY_HIGH")
macdef SL_OBJECTID_LISTENER = $extval(int,"SL_OBJECTID_LISTENER")
macdef SL_OBJECT_EVENT_ITF_CONTROL_RETURNED = $extval(int,"SL_OBJECT_EVENT_ITF_CONTROL_RETURNED")
macdef SL_OBJECTID_MIDIPLAYER = $extval(int,"SL_OBJECTID_MIDIPLAYER")
macdef SL_MIDIMESSAGETYPE_CONTROL_CHANGE = $extval(int,"SL_MIDIMESSAGETYPE_CONTROL_CHANGE")
macdef SL_OBJECTID_VIBRADEVICE = $extval(int,"SL_OBJECTID_VIBRADEVICE")
macdef SL_PREFETCHSTATUS_UNDERFLOW = $extval(int,"SL_PREFETCHSTATUS_UNDERFLOW")
macdef SL_OBJECT_STATE_REALIZED = $extval(int,"SL_OBJECT_STATE_REALIZED")
macdef SL_DEVSCOPE_ENVIRONMENT = $extval(int,"SL_DEVSCOPE_ENVIRONMENT")
macdef SL_DEVLOCATION_HANDSET = $extval(int,"SL_DEVLOCATION_HANDSET")
macdef SL_CHARACTERENCODING_BINARY = $extval(int,"SL_CHARACTERENCODING_BINARY")
macdef SL_CONTAINERTYPE_MPEG_ES = $extval(int,"SL_CONTAINERTYPE_MPEG_ES")
macdef SL_CHARACTERENCODING_JAVACONFORMANTUTF8 = $extval(int,"SL_CHARACTERENCODING_JAVACONFORMANTUTF8")
macdef SL_CONTAINERTYPE_3GA = $extval(int,"SL_CONTAINERTYPE_3GA")
macdef SL_OBJECT_STATE_UNREALIZED = $extval(int,"SL_OBJECT_STATE_UNREALIZED")
macdef SL_AUDIOMODE_AAC_SSR = $extval(int,"SL_AUDIOMODE_AAC_SSR")
macdef SL_CHARACTERENCODING_IMAPUTF7 = $extval(int,"SL_CHARACTERENCODING_IMAPUTF7")
macdef SL_I3DL2_ENVIRONMENT_PRESET_CITY = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_CITY")
macdef SL_CHARACTERENCODING_GB2312 = $extval(int,"SL_CHARACTERENCODING_GB2312")
macdef SL_PLAYEVENT_HEADATEND = $extval(int,"SL_PLAYEVENT_HEADATEND")
macdef SL_CONTAINERTYPE_MPEG_PS = $extval(int,"SL_CONTAINERTYPE_MPEG_PS")
macdef SL_MIDIMESSAGETYPE_PROGRAM_CHANGE = $extval(int,"SL_MIDIMESSAGETYPE_PROGRAM_CHANGE")
macdef SL_METADATA_FILTER_KEY = $extval(int,"SL_METADATA_FILTER_KEY")
macdef SL_METADATATRAVERSALMODE_ALL = $extval(int,"SL_METADATATRAVERSALMODE_ALL")
macdef SL_AUDIOPROFILE_MPEG2_L3 = $extval(int,"SL_AUDIOPROFILE_MPEG2_L3")
macdef SL_CONTAINERTYPE_M4A = $extval(int,"SL_CONTAINERTYPE_M4A")
macdef SL_DEVLOCATION_CARKIT = $extval(int,"SL_DEVLOCATION_CARKIT")
macdef SL_OBJECT_EVENT_ITF_PARAMETERS_CHANGED = $extval(int,"SL_OBJECT_EVENT_ITF_PARAMETERS_CHANGED")
macdef SL_CONTAINERTYPE_MPEG_TS = $extval(int,"SL_CONTAINERTYPE_MPEG_TS")
macdef SL_RATECONTROLMODE_VARIABLEBITRATE = $extval(int,"SL_RATECONTROLMODE_VARIABLEBITRATE")
macdef SL_RECORDEVENT_BUFFER_FULL = $extval(int,"SL_RECORDEVENT_BUFFER_FULL")
macdef SL_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM")
macdef SL_OBJECTID_OUTPUTMIX = $extval(int,"SL_OBJECTID_OUTPUTMIX")
macdef SL_DEVLOCATION_RESLTE = $extval(int,"SL_DEVLOCATION_RESLTE")
macdef SL_SEEKMODE_FAST = $extval(int,"SL_SEEKMODE_FAST")
macdef SL_I3DL2_ENVIRONMENT_PRESET_GENERIC = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_GENERIC")
macdef SL_AUDIOCODEC_MP3 = $extval(int,"SL_AUDIOCODEC_MP3")
macdef SL_AUDIOPROFILE_AAC_AAC = $extval(int,"SL_AUDIOPROFILE_AAC_AAC")
macdef SL_CHARACTERENCODING_UNKNOWN = $extval(int,"SL_CHARACTERENCODING_UNKNOWN")
macdef SL_CONTAINERTYPE_QT = $extval(int,"SL_CONTAINERTYPE_QT")
macdef SL_RECORDEVENT_HEADATMARKER = $extval(int,"SL_RECORDEVENT_HEADATMARKER")
macdef SL_RECORDEVENT_HEADATNEWPOS = $extval(int,"SL_RECORDEVENT_HEADATNEWPOS")
macdef SL_CONTAINERTYPE_RM = $extval(int,"SL_CONTAINERTYPE_RM")
macdef SL_AUDIOMODE_AAC_LTP = $extval(int,"SL_AUDIOMODE_AAC_LTP")
macdef SL_CHARACTERENCODING_ISO885910 = $extval(int,"SL_CHARACTERENCODING_ISO885910")
macdef SL_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE")
macdef SL_OBJECT_EVENT_RUNTIME_ERROR = $extval(int,"SL_OBJECT_EVENT_RUNTIME_ERROR")
macdef SL_CHARACTERENCODING_ISO885913 = $extval(int,"SL_CHARACTERENCODING_ISO885913")
macdef SL_CHARACTERENCODING_ISO885914 = $extval(int,"SL_CHARACTERENCODING_ISO885914")
macdef SL_CHARACTERENCODING_ISO885915 = $extval(int,"SL_CHARACTERENCODING_ISO885915")
macdef SL_DEVCONNECTION_ATTACHED_WIRED = $extval(int,"SL_DEVCONNECTION_ATTACHED_WIRED")
macdef SL_CONTAINERTYPE_XMF_0 = $extval(int,"SL_CONTAINERTYPE_XMF_0")
macdef SL_CONTAINERTYPE_XMF_1 = $extval(int,"SL_CONTAINERTYPE_XMF_1")
macdef SL_CONTAINERTYPE_XMF_2 = $extval(int,"SL_CONTAINERTYPE_XMF_2")
macdef SL_CONTAINERTYPE_XMF_3 = $extval(int,"SL_CONTAINERTYPE_XMF_3")
macdef SL_AUDIOMODE_AAC_MAIN = $extval(int,"SL_AUDIOMODE_AAC_MAIN")
macdef SL_CONTAINERTYPE_BMP = $extval(int,"SL_CONTAINERTYPE_BMP")
macdef SL_PREFETCHSTATUS_SUFFICIENTDATA = $extval(int,"SL_PREFETCHSTATUS_SUFFICIENTDATA")
macdef SL_VOICETYPE_3D_AUDIO = $extval(int,"SL_VOICETYPE_3D_AUDIO")
macdef SL_REVERBPRESET_LARGEROOM = $extval(int,"SL_REVERBPRESET_LARGEROOM")
macdef SL_RECORDEVENT_HEADSTALLED = $extval(int,"SL_RECORDEVENT_HEADSTALLED")
macdef SL_REVERBPRESET_MEDIUMROOM = $extval(int,"SL_REVERBPRESET_MEDIUMROOM")
macdef SL_AUDIOMODE_AAC_SCALABLE = $extval(int,"SL_AUDIOMODE_AAC_SCALABLE")
macdef SL_CHARACTERENCODING_GB12345 = $extval(int,"SL_CHARACTERENCODING_GB12345")
macdef SL_PRIORITY_VERYLOW = $extval(int,"SL_PRIORITY_VERYLOW")
macdef SL_I3DL2_ENVIRONMENT_PRESET_PLAIN = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_PLAIN")
macdef SL_CHARACTERENCODING_SHIFTJIS = $extval(int,"SL_CHARACTERENCODING_SHIFTJIS")
macdef SL_CHARACTERENCODING_ISO88591 = $extval(int,"SL_CHARACTERENCODING_ISO88591")
macdef SL_CHARACTERENCODING_ISO88592 = $extval(int,"SL_CHARACTERENCODING_ISO88592")
macdef SL_CHARACTERENCODING_ISO88593 = $extval(int,"SL_CHARACTERENCODING_ISO88593")
macdef SL_CHARACTERENCODING_ISO88594 = $extval(int,"SL_CHARACTERENCODING_ISO88594")
macdef SL_CHARACTERENCODING_ISO88595 = $extval(int,"SL_CHARACTERENCODING_ISO88595")
macdef SL_CHARACTERENCODING_ISO88597 = $extval(int,"SL_CHARACTERENCODING_ISO88597")
macdef SL_CHARACTERENCODING_ISO88598 = $extval(int,"SL_CHARACTERENCODING_ISO88598")
macdef SL_CHARACTERENCODING_ISO88599 = $extval(int,"SL_CHARACTERENCODING_ISO88599")
macdef SL_PRIORITY_ABOVENORMAL = $extval(int,"SL_PRIORITY_ABOVENORMAL")
macdef SL_DEVCONNECTION_ATTACHED_WIRELESS = $extval(int,"SL_DEVCONNECTION_ATTACHED_WIRELESS")
macdef SL_CONTAINERTYPE_MP3 = $extval(int,"SL_CONTAINERTYPE_MP3")
macdef SL_CONTAINERTYPE_MP4 = $extval(int,"SL_CONTAINERTYPE_MP4")
macdef SL_I3DL2_ENVIRONMENT_PRESET_HALLWAY = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_HALLWAY")
macdef SL_MIDIMESSAGETYPE_POLY_PRESSURE = $extval(int,"SL_MIDIMESSAGETYPE_POLY_PRESSURE")
macdef SL_DEVSCOPE_UNKNOWN = $extval(int,"SL_DEVSCOPE_UNKNOWN")
macdef SL_MILLIBEL_MAX = $extval(int,"SL_MILLIBEL_MAX")
macdef SL_AUDIOSTREAMFORMAT_IF1 = $extval(int,"SL_AUDIOSTREAMFORMAT_IF1")
macdef SL_AUDIOSTREAMFORMAT_IF2 = $extval(int,"SL_AUDIOSTREAMFORMAT_IF2")
macdef SL_MIDIMESSAGETYPE_NOTE_ON_OFF = $extval(int,"SL_MIDIMESSAGETYPE_NOTE_ON_OFF")
macdef SL_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS")
macdef SL_NODETYPE_AUDIO = $extval(int,"SL_NODETYPE_AUDIO")
macdef SL_I3DL2_ENVIRONMENT_PRESET_PLATE = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_PLATE")
macdef SL_AUDIOPROFILE_AMRWB = $extval(int,"SL_AUDIOPROFILE_AMRWB")
macdef SL_AUDIOPROFILE_REALAUDIO = $extval(int,"SL_AUDIOPROFILE_REALAUDIO")
macdef SL_ROLLOFFMODEL_LINEAR = $extval(int,"SL_ROLLOFFMODEL_LINEAR")
macdef SL_AUDIOMODE_REALAUDIO_G2 = $extval(int,"SL_AUDIOMODE_REALAUDIO_G2")
macdef SL_MILLIBEL_MIN = $extval(int,"SL_MILLIBEL_MIN")
macdef SL_OBJECT_STATE_SUSPENDED = $extval(int,"SL_OBJECT_STATE_SUSPENDED")
macdef SL_AUDIOCHANMODE_MP3_STEREO = $extval(int,"SL_AUDIOCHANMODE_MP3_STEREO")
macdef SL_I3DL2_ENVIRONMENT_PRESET_UNDERWATER = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_UNDERWATER")
macdef SL_CHARACTERENCODING_CODEPAGE1252 = $extval(int,"SL_CHARACTERENCODING_CODEPAGE1252")
macdef SL_CHARACTERENCODING_ISO2022JP = $extval(int,"SL_CHARACTERENCODING_ISO2022JP")
macdef SL_AUDIOSTREAMFORMAT_ITU = $extval(int,"SL_AUDIOSTREAMFORMAT_ITU")
macdef SL_I3DL2_ENVIRONMENT_PRESET_ALLEY = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_ALLEY")
macdef SL_AUDIOMODE_AAC_HE = $extval(int,"SL_AUDIOMODE_AAC_HE")
macdef SL_I3DL2_ENVIRONMENT_PRESET_LARGEHALL = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_LARGEHALL")
macdef SL_AUDIOSTREAMFORMAT_CONFORMANCE = $extval(int,"SL_AUDIOSTREAMFORMAT_CONFORMANCE")
macdef SL_AUDIOCHANMODE_MP3_JOINTSTEREO = $extval(int,"SL_AUDIOCHANMODE_MP3_JOINTSTEREO")
macdef SL_PRIORITY_LOWEST = $extval(int,"SL_PRIORITY_LOWEST")
macdef SL_AUDIOMODE_AAC_LC = $extval(int,"SL_AUDIOMODE_AAC_LC")
macdef SL_AUDIOMODE_AAC_LD = $extval(int,"SL_AUDIOMODE_AAC_LD")
macdef SL_AUDIOMODE_REALAUDIO_10 = $extval(int,"SL_AUDIOMODE_REALAUDIO_10")
macdef SL_PREFETCHSTATUS_OVERFLOW = $extval(int,"SL_PREFETCHSTATUS_OVERFLOW")
macdef SL_AUDIOCODEC_AMRWB = $extval(int,"SL_AUDIOCODEC_AMRWB")
macdef SL_CHARACTERENCODING_ISO2022JP1 = $extval(int,"SL_CHARACTERENCODING_ISO2022JP1")
macdef SL_VOICETYPE_2D_AUDIO = $extval(int,"SL_VOICETYPE_2D_AUDIO")
macdef SL_NODETYPE_UNSPECIFIED = $extval(int,"SL_NODETYPE_UNSPECIFIED")
macdef SL_DEVLOCATION_HEADSET = $extval(int,"SL_DEVLOCATION_HEADSET")
macdef SL_PRIORITY_BELOWNORMAL = $extval(int,"SL_PRIORITY_BELOWNORMAL")
macdef SL_PLAYEVENT_HEADSTALLED = $extval(int,"SL_PLAYEVENT_HEADSTALLED")
macdef SL_ENGINEOPTION_LOSSOFCONTROL = $extval(int,"SL_ENGINEOPTION_LOSSOFCONTROL")
macdef SL_I3DL2_ENVIRONMENT_PRESET_SMALLROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_SMALLROOM")
macdef SL_CONTAINERTYPE_JPG = $extval(int,"SL_CONTAINERTYPE_JPG")
macdef SL_DYNAMIC_ITF_EVENT_ASYNC_TERMINATION = $extval(int,"SL_DYNAMIC_ITF_EVENT_ASYNC_TERMINATION")
macdef SL_AUDIOMODE_AAC_HE_MPS = $extval(int,"SL_AUDIOMODE_AAC_HE_MPS")
macdef SL_NODETYPE_VIDEO = $extval(int,"SL_NODETYPE_VIDEO")
macdef SL_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM")
macdef SL_DEVSCOPE_USER = $extval(int,"SL_DEVSCOPE_USER")
macdef SL_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL")
macdef SL_ROLLOFFMODEL_EXPONENTIAL = $extval(int,"SL_ROLLOFFMODEL_EXPONENTIAL")
macdef SL_PRIORITY_LOW = $extval(int,"SL_PRIORITY_LOW")
macdef SL_AUDIOSTREAMFORMAT_RTPPAYLOAD = $extval(int,"SL_AUDIOSTREAMFORMAT_RTPPAYLOAD")
macdef SL_AUDIOMODE_REALAUDIO_SURROUND = $extval(int,"SL_AUDIOMODE_REALAUDIO_SURROUND")
macdef SL_AUDIOCHANMODE_MP3_MONO = $extval(int,"SL_AUDIOCHANMODE_MP3_MONO")
macdef SL_PREFETCHEVENT_STATUSCHANGE = $extval(int,"SL_PREFETCHEVENT_STATUSCHANGE")
macdef SL_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT")
macdef SL_OBJECT_EVENT_ASYNC_TERMINATION = $extval(int,"SL_OBJECT_EVENT_ASYNC_TERMINATION")
macdef SL_DYNAMIC_ITF_EVENT_RESOURCES_AVAILABLE = $extval(int,"SL_DYNAMIC_ITF_EVENT_RESOURCES_AVAILABLE")
macdef SL_CHARACTERENCODING_GB18030 = $extval(int,"SL_CHARACTERENCODING_GB18030")
macdef SL_CONTAINERTYPE_XMF_GENERIC = $extval(int,"SL_CONTAINERTYPE_XMF_GENERIC")
macdef SL_AUDIOSTREAMFORMAT_FSF = $extval(int,"SL_AUDIOSTREAMFORMAT_FSF")
macdef SL_AUDIOSTREAMFORMAT_MP4FF = $extval(int,"SL_AUDIOSTREAMFORMAT_MP4FF")
macdef SL_AUDIOMODE_AAC_HE_PS = $extval(int,"SL_AUDIOMODE_AAC_HE_PS")
macdef SL_CHARACTERENCODING_GBK = $extval(int,"SL_CHARACTERENCODING_GBK")
macdef SL_DYNAMIC_ITF_EVENT_RESOURCES_LOST = $extval(int,"SL_DYNAMIC_ITF_EVENT_RESOURCES_LOST")
macdef SL_RECORDEVENT_HEADMOVING = $extval(int,"SL_RECORDEVENT_HEADMOVING")
macdef SL_ENGINEOPTION_THREADSAFE = $extval(int,"SL_ENGINEOPTION_THREADSAFE")
macdef SL_OBJECTID_AUDIORECORDER = $extval(int,"SL_OBJECTID_AUDIORECORDER")
macdef SL_CHARACTERENCODING_ISOEUCJP = $extval(int,"SL_CHARACTERENCODING_ISOEUCJP")
macdef SL_CONTAINERTYPE_RAW = $extval(int,"SL_CONTAINERTYPE_RAW")
macdef SL_SEEKMODE_ACCURATE = $extval(int,"SL_SEEKMODE_ACCURATE")
macdef SL_AUDIOMODE_WMAPRO_LEVELM0 = $extval(int,"SL_AUDIOMODE_WMAPRO_LEVELM0")
macdef SL_AUDIOMODE_WMAPRO_LEVELM2 = $extval(int,"SL_AUDIOMODE_WMAPRO_LEVELM2")
macdef SL_AUDIOMODE_WMAPRO_LEVELM3 = $extval(int,"SL_AUDIOMODE_WMAPRO_LEVELM3")
macdef SL_AUDIOPROFILE_MPEG25_L3 = $extval(int,"SL_AUDIOPROFILE_MPEG25_L3")
macdef SL_MIDIMESSAGETYPE_PITCH_BEND = $extval(int,"SL_MIDIMESSAGETYPE_PITCH_BEND")
macdef SL_I3DL2_ENVIRONMENT_PRESET_ARENA = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_ARENA")
macdef SL_RATEPROP_STAGGEREDAUDIO = $extval(int,"SL_RATEPROP_STAGGEREDAUDIO")
macdef SL_DEVCONNECTION_NETWORK = $extval(int,"SL_DEVCONNECTION_NETWORK")
macdef SL_PRIORITY_HIGHEST = $extval(int,"SL_PRIORITY_HIGHEST")
macdef SL_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL")
macdef SL_CHARACTERENCODING_UTF7 = $extval(int,"SL_CHARACTERENCODING_UTF7")
macdef SL_CHARACTERENCODING_UTF8 = $extval(int,"SL_CHARACTERENCODING_UTF8")
macdef SL_OBJECTID_LEDDEVICE = $extval(int,"SL_OBJECTID_LEDDEVICE")
macdef SL_AUDIOSTREAMFORMAT_MP4LOAS = $extval(int,"SL_AUDIOSTREAMFORMAT_MP4LOAS")
macdef SL_RECORDEVENT_BUFFER_INSUFFICIENT = $extval(int,"SL_RECORDEVENT_BUFFER_INSUFFICIENT")
macdef SL_CHARACTERENCODING_HZGB2312 = $extval(int,"SL_CHARACTERENCODING_HZGB2312")
macdef SL_AUDIOPROFILE_WMA7 = $extval(int,"SL_AUDIOPROFILE_WMA7")
macdef SL_AUDIOPROFILE_WMA8 = $extval(int,"SL_AUDIOPROFILE_WMA8")
macdef SL_AUDIOPROFILE_WMA9 = $extval(int,"SL_AUDIOPROFILE_WMA9")
macdef SL_AUDIOPROFILE_AMR = $extval(int,"SL_AUDIOPROFILE_AMR")
macdef SL_AUDIOMODE_WMA_LEVEL1 = $extval(int,"SL_AUDIOMODE_WMA_LEVEL1")
macdef SL_AUDIOMODE_WMA_LEVEL2 = $extval(int,"SL_AUDIOMODE_WMA_LEVEL2")
macdef SL_AUDIOMODE_WMA_LEVEL3 = $extval(int,"SL_AUDIOMODE_WMA_LEVEL3")
macdef SL_AUDIOMODE_WMA_LEVEL4 = $extval(int,"SL_AUDIOMODE_WMA_LEVEL4")
macdef SL_DEVLOCATION_REMOTE = $extval(int,"SL_DEVLOCATION_REMOTE")
macdef SL_OBJECTID_METADATAEXTRACTOR = $extval(int,"SL_OBJECTID_METADATAEXTRACTOR")
macdef SL_RATEPROP_NOPITCHCORAUDIO = $extval(int,"SL_RATEPROP_NOPITCHCORAUDIO")
macdef SL_RATECONTROLMODE_CONSTANTBITRATE = $extval(int,"SL_RATECONTROLMODE_CONSTANTBITRATE")
macdef SL_I3DL2_ENVIRONMENT_PRESET_DEFAULT = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_DEFAULT")
macdef SL_CONTAINERTYPE_UNSPECIFIED = $extval(int,"SL_CONTAINERTYPE_UNSPECIFIED")
macdef SL_OBJECT_EVENT_ITF_CONTROL_TAKEN = $extval(int,"SL_OBJECT_EVENT_ITF_CONTROL_TAKEN")
macdef SL_CHARACTERENCODING_SMS7BIT = $extval(int,"SL_CHARACTERENCODING_SMS7BIT")
macdef SL_PREFETCHEVENT_FILLLEVELCHANGE = $extval(int,"SL_PREFETCHEVENT_FILLLEVELCHANGE")
macdef SL_I3DL2_ENVIRONMENT_PRESET_STONEROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_STONEROOM")
macdef SL_DEVCONNECTION_INTEGRATED = $extval(int,"SL_DEVCONNECTION_INTEGRATED")
macdef SL_PROFILES_MUSIC = $extval(int,"SL_PROFILES_MUSIC")
macdef SL_VOICETYPE_MIDI = $extval(int,"SL_VOICETYPE_MIDI")
macdef SL_AUDIOSTREAMFORMAT_RAW = $extval(int,"SL_AUDIOSTREAMFORMAT_RAW")
macdef SL_REVERBPRESET_PLATE = $extval(int,"SL_REVERBPRESET_PLATE")
macdef SL_CONTAINERTYPE_MOBILE_DLS = $extval(int,"SL_CONTAINERTYPE_MOBILE_DLS")
macdef SL_I3DL2_ENVIRONMENT_PRESET_ROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_ROOM")
macdef SL_MIDIMESSAGETYPE_SYSTEM_MESSAGE = $extval(int,"SL_MIDIMESSAGETYPE_SYSTEM_MESSAGE")
macdef SL_RATEPROP_RESERVED1 = $extval(int,"SL_RATEPROP_RESERVED1")
macdef SL_RATEPROP_RESERVED2 = $extval(int,"SL_RATEPROP_RESERVED2")
macdef SL_REVERBPRESET_NONE = $extval(int,"SL_REVERBPRESET_NONE")
macdef SL_MIDIMESSAGETYPE_CHANNEL_PRESSURE = $extval(int,"SL_MIDIMESSAGETYPE_CHANNEL_PRESSURE")
macdef SL_AUDIOSTREAMFORMAT_MP4ADTS = $extval(int,"SL_AUDIOSTREAMFORMAT_MP4ADTS")
macdef SL_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY")
macdef SL_I3DL2_ENVIRONMENT_PRESET_FOREST = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_FOREST")
macdef SL_CONTAINERTYPE_OGG = $extval(int,"SL_CONTAINERTYPE_OGG")
macdef SL_I3DL2_ENVIRONMENT_PRESET_LARGEROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_LARGEROOM")
macdef SL_AUDIOCODEC_AMRWBPLUS = $extval(int,"SL_AUDIOCODEC_AMRWBPLUS")
macdef SL_CONTAINERTYPE_DMF = $extval(int,"SL_CONTAINERTYPE_DMF")
macdef SL_AUDIOPROFILE_MPEG1_L3 = $extval(int,"SL_AUDIOPROFILE_MPEG1_L3")
macdef SL_PROFILES_PHONE = $extval(int,"SL_PROFILES_PHONE")
macdef SL_OBJECTID_AUDIOPLAYER = $extval(int,"SL_OBJECTID_AUDIOPLAYER")
macdef SL_DEVLOCATION_DOCK = $extval(int,"SL_DEVLOCATION_DOCK")
macdef SL_METADATA_FILTER_LANG = $extval(int,"SL_METADATA_FILTER_LANG")
macdef SL_PLAYEVENT_HEADMOVING = $extval(int,"SL_PLAYEVENT_HEADMOVING")
macdef SL_OBJECT_EVENT_RESOURCES_AVAILABLE = $extval(int,"SL_OBJECT_EVENT_RESOURCES_AVAILABLE")
macdef SL_REVERBPRESET_LARGEHALL = $extval(int,"SL_REVERBPRESET_LARGEHALL")
macdef SL_CHARACTERENCODING_BIG5 = $extval(int,"SL_CHARACTERENCODING_BIG5")
macdef SL_AUDIOCODEC_AAC = $extval(int,"SL_AUDIOCODEC_AAC")
macdef SL_CHARACTERENCODING_UTF16BE = $extval(int,"SL_CHARACTERENCODING_UTF16BE")
macdef SL_RECORDEVENT_HEADATLIMIT = $extval(int,"SL_RECORDEVENT_HEADATLIMIT")
macdef SL_I3DL2_ENVIRONMENT_PRESET_BATHROOM = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_BATHROOM")
macdef SL_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR")
macdef SL_AUDIOCHANMODE_MP3_DUAL = $extval(int,"SL_AUDIOCHANMODE_MP3_DUAL")
macdef SL_AUDIOSTREAMFORMAT_MP4LATM = $extval(int,"SL_AUDIOSTREAMFORMAT_MP4LATM")
macdef SL_PRIORITY_VERYHIGH = $extval(int,"SL_PRIORITY_VERYHIGH")
macdef SL_MILLIMETER_MAX = $extval(int,"SL_MILLIMETER_MAX")
macdef SL_CHARACTERENCODING_UTF16LE = $extval(int,"SL_CHARACTERENCODING_UTF16LE")
macdef SL_AUDIOPROFILE_WMA10 = $extval(int,"SL_AUDIOPROFILE_WMA10")
macdef SL_AUDIOCODEC_AMR = $extval(int,"SL_AUDIOCODEC_AMR")
macdef SL_I3DL2_ENVIRONMENT_PRESET_QUARRY = $extval(int,"SL_I3DL2_ENVIRONMENT_PRESET_QUARRY")
macdef SL_CONTAINERTYPE_3GPP = $extval(int,"SL_CONTAINERTYPE_3GPP")
macdef SL_DYNAMIC_ITF_EVENT_RUNTIME_ERROR = $extval(int,"SL_DYNAMIC_ITF_EVENT_RUNTIME_ERROR")
macdef SL_CONTAINERTYPE_SMF = $extval(int,"SL_CONTAINERTYPE_SMF")
macdef SL_PRIORITY_NORMAL = $extval(int,"SL_PRIORITY_NORMAL")
macdef SL_OBJECT_EVENT_RESOURCES_LOST = $extval(int,"SL_OBJECT_EVENT_RESOURCES_LOST")
macdef SL_PLAYEVENT_HEADATMARKER = $extval(int,"SL_PLAYEVENT_HEADATMARKER")
macdef SL_REVERBPRESET_SMALLROOM = $extval(int,"SL_REVERBPRESET_SMALLROOM")
macdef SL_PLAYEVENT_HEADATNEWPOS = $extval(int,"SL_PLAYEVENT_HEADATNEWPOS")
macdef SL_VOICETYPE_3D_MIDIOUTPUT = $extval(int,"SL_VOICETYPE_3D_MIDIOUTPUT")
macdef SL_AUDIOSTREAMFORMAT_MP2ADTS = $extval(int,"SL_AUDIOSTREAMFORMAT_MP2ADTS")
macdef SL_AUDIOCODEC_WMA = $extval(int,"SL_AUDIOCODEC_WMA")
macdef SL_CONTAINERTYPE_AAC = $extval(int,"SL_CONTAINERTYPE_AAC")
macdef SL_IODEVICE_VIBRA = $extval(int,"SL_IODEVICE_VIBRA")
macdef SL_OBJECTID_ENGINE = $extval(int,"SL_OBJECTID_ENGINE")


typedef sl_uint8_t = $extype"sl_uint8_t"

typedef sl_int8_t = $extype"sl_int8_t"

typedef sl_uint16_t = $extype"sl_uint16_t"

typedef sl_int16_t = $extype"sl_int16_t"

typedef sl_uint32_t = $extype"sl_uint32_t"

typedef sl_int32_t = $extype"sl_int32_t"

typedef sl_int64_t = $extype"sl_int64_t"

typedef sl_uint64_t = $extype"sl_uint64_t"

abst@ype SLint8 = $extype"SLint8"

abst@ype SLuint8 = $extype"SLuint8"

abst@ype SLint16 = $extype"SLint16"

abst@ype SLuint16 = $extype"SLuint16"

abst@ype SLint32 = $extype"SLint32"

abst@ype SLuint32 = $extype"SLuint32"

abst@ype SLboolean = $extype"SLboolean"

macdef SL_BOOLEAN_TRUE = $extval(SLboolean,"SL_BOOLEAN_TRUE")
macdef SL_BOOLEAN_FALSE = $extval(SLboolean,"SL_BOOLEAN_FALSE")

abst@ype SLchar = $extype"SLchar"

typedef SLmillibel = $extype"SLmillibel"

typedef SLmillisecond = $extype"SLmillisecond"

typedef SLmilliHertz = $extype"SLmilliHertz"

typedef SLmillimeter = $extype"SLmillimeter"

typedef SLmillidegree = $extype"SLmillidegree"

typedef SLpermille = $extype"SLpermille"

typedef SLmicrosecond = $extype"SLmicrosecond"

abst@ype SLresult = $extype"SLresult"

macdef SL_RESULT_SUCCESS = $extval(SLresult,"SL_RESULT_SUCCESS")
macdef SL_RESULT_PRECONDITIONS_VIOLATED = $extval(SLresult,"SL_RESULT_PRECONDITIONS_VIOLATED")
macdef SL_RESULT_PARAMETER_INVALID = $extval(SLresult,"SL_RESULT_PARAMETER_INVALID")
macdef SL_RESULT_CONTENT_CORRUPTED = $extval(SLresult,"SL_RESULT_CONTENT_CORRUPTED")
macdef SL_RESULT_MEMORY_FAILURE = $extval(SLresult,"SL_RESULT_MEMORY_FAILURE")
macdef SL_RESULT_FEATURE_UNSUPPORTED = $extval(SLresult,"SL_RESULT_FEATURE_UNSUPPORTED")
macdef SL_RESULT_OPERATION_ABORTED = $extval(SLresult,"SL_RESULT_OPERATION_ABORTED")
macdef SL_RESULT_PERMISSION_DENIED = $extval(SLresult,"SL_RESULT_PERMISSION_DENIED")
macdef SL_RESULT_CONTROL_LOST = $extval(SLresult,"SL_RESULT_CONTROL_LOST")
macdef SL_RESULT_INTERNAL_ERROR = $extval(SLresult,"SL_RESULT_INTERNAL_ERROR")
macdef SL_RESULT_CONTENT_UNSUPPORTED = $extval(SLresult,"SL_RESULT_CONTENT_UNSUPPORTED")
macdef SL_RESULT_BUFFER_INSUFFICIENT = $extval(SLresult,"SL_RESULT_BUFFER_INSUFFICIENT")
macdef SL_RESULT_RESOURCE_ERROR = $extval(SLresult,"SL_RESULT_RESOURCE_ERROR")
macdef SL_RESULT_IO_ERROR = $extval(SLresult,"SL_RESULT_IO_ERROR")
macdef SL_RESULT_CONTENT_NOT_FOUND = $extval(SLresult,"SL_RESULT_CONTENT_NOT_FOUND")
macdef SL_RESULT_RESOURCE_LOST = $extval(SLresult,"SL_RESULT_RESOURCE_LOST")
macdef SL_RESULT_UNKNOWN_ERROR = $extval(SLresult,"SL_RESULT_UNKNOWN_ERROR")

fn eq_SLresult_SLresult( SLresult, SLresult ) :<> bool = "mac#_sles_ats2_eq"
fn neq_SLresult_SLresult( SLresult, SLresult ) :<> bool = "mac#_sles_ats2_neq"

overload = with eq_SLresult_SLresult
overload != with neq_SLresult_SLresult

abst@ype SLInterfaceID = $extype"SLInterfaceID"
macdef SL_IID_NULL = $extval(SLInterfaceID, "SL_IID_NULL")
macdef SL_IID_OBJECT = $extval(SLInterfaceID, "SL_IID_OBJECT")
macdef SL_IID_AUDIODEVICECAPABILITIES = $extval(SLInterfaceID, "SL_IID_AUDIODEVICECAPABILITIES")
macdef SL_IID_LED = $extval(SLInterfaceID, "SL_IID_LED")
macdef SL_IID_VIBRA = $extval(SLInterfaceID, "SL_IID_VIBRA")
macdef SL_IID_METADATAEXTRACTION = $extval(SLInterfaceID, "SL_IID_METADATAEXTRACTION")
macdef SL_IID_METADATATRAVERSAL = $extval(SLInterfaceID, "SL_IID_METADATATRAVERSAL")
macdef SL_IID_DYNAMICSOURCE = $extval(SLInterfaceID, "SL_IID_DYNAMICSOURCE")
macdef SL_IID_OUTPUTMIX = $extval(SLInterfaceID, "SL_IID_OUTPUTMIX")
macdef SL_IID_PLAY = $extval(SLInterfaceID, "SL_IID_PLAY")
macdef SL_IID_PREFETCHSTATUS = $extval(SLInterfaceID, "SL_IID_PREFETCHSTATUS")
macdef SL_IID_PLAYBACKRATE = $extval(SLInterfaceID, "SL_IID_PLAYBACKRATE")
macdef SL_IID_SEEK = $extval(SLInterfaceID, "SL_IID_SEEK")
macdef SL_IID_RECORD = $extval(SLInterfaceID, "SL_IID_RECORD")
macdef SL_IID_EQUALIZER = $extval(SLInterfaceID, "SL_IID_EQUALIZER")
macdef SL_IID_VOLUME = $extval(SLInterfaceID, "SL_IID_VOLUME")
macdef SL_IID_DEVICEVOLUME = $extval(SLInterfaceID, "SL_IID_DEVICEVOLUME")
macdef SL_IID_BUFFERQUEUE = $extval(SLInterfaceID, "SL_IID_BUFFERQUEUE")
macdef SL_IID_PRESETREVERB = $extval(SLInterfaceID, "SL_IID_PRESETREVERB")
macdef SL_IID_ENVIRONMENTALREVERB = $extval(SLInterfaceID, "SL_IID_ENVIRONMENTALREVERB")
macdef SL_IID_EFFECTSEND = $extval(SLInterfaceID, "SL_IID_EFFECTSEND")
macdef SL_IID_3DGROUPING = $extval(SLInterfaceID, "SL_IID_3DGROUPING")
macdef SL_IID_3DCOMMIT = $extval(SLInterfaceID, "SL_IID_3DCOMMIT")
macdef SL_IID_3DLOCATION = $extval(SLInterfaceID, "SL_IID_3DLOCATION")
macdef SL_IID_3DDOPPLER = $extval(SLInterfaceID, "SL_IID_3DDOPPLER")
macdef SL_IID_3DSOURCE = $extval(SLInterfaceID, "SL_IID_3DSOURCE")
macdef SL_IID_3DMACROSCOPIC = $extval(SLInterfaceID, "SL_IID_3DMACROSCOPIC")
macdef SL_IID_MUTESOLO = $extval(SLInterfaceID, "SL_IID_MUTESOLO")
macdef SL_IID_DYNAMICINTERFACEMANAGEMENT = $extval(SLInterfaceID, "SL_IID_DYNAMICINTERFACEMANAGEMENT")
macdef SL_IID_MIDIMESSAGE = $extval(SLInterfaceID, "SL_IID_MIDIMESSAGE")
macdef SL_IID_MIDIMUTESOLO = $extval(SLInterfaceID, "SL_IID_MIDIMUTESOLO")
macdef SL_IID_MIDITEMPO = $extval(SLInterfaceID, "SL_IID_MIDITEMPO")
macdef SL_IID_MIDITIME = $extval(SLInterfaceID, "SL_IID_MIDITIME")
macdef SL_IID_AUDIODECODERCAPABILITIES = $extval(SLInterfaceID, "SL_IID_AUDIODECODERCAPABILITIES")
macdef SL_IID_AUDIOENCODERCAPABILITIES = $extval(SLInterfaceID, "SL_IID_AUDIOENCODERCAPABILITIES")
macdef SL_IID_AUDIOENCODER = $extval(SLInterfaceID, "SL_IID_AUDIOENCODER")
macdef SL_IID_BASSBOOST = $extval(SLInterfaceID, "SL_IID_BASSBOOST")
macdef SL_IID_PITCH = $extval(SLInterfaceID, "SL_IID_PITCH")
macdef SL_IID_RATEPITCH = $extval(SLInterfaceID, "SL_IID_RATEPITCH")
macdef SL_IID_VIRTUALIZER = $extval(SLInterfaceID, "SL_IID_VIRTUALIZER")
macdef SL_IID_VIRTUALIZATION = $extval(SLInterfaceID, "SL_IID_VIRTUALIZATION")
macdef SL_IID_NULL = $extval(SLInterfaceID, "SL_IID_NULL")
macdef SL_IID_ENGINE = $extval(SLInterfaceID, "SL_IID_ENGINE")
macdef SL_IID_ENGINECAPABILITIES = $extval(SLInterfaceID, "SL_IID_ENGINECAPABILITIES")
macdef SL_IID_THREADSYNC = $extval(SLInterfaceID, "SL_IID_THREADSYNC")

abst@ype SLDataLocatorType = SLuint32
macdef SL_DATALOCATOR_IODEVICE = $extval(SLDataLocatorType,"SL_DATALOCATOR_IODEVICE")
macdef SL_DATALOCATOR_OUTPUTMIX = $extval(SLDataLocatorType,"SL_DATALOCATOR_OUTPUTMIX")
macdef SL_DATALOCATOR_MIDIBUFFERQUEUE = $extval(SLDataLocatorType,"SL_DATALOCATOR_MIDIBUFFERQUEUE")
macdef SL_DATALOCATOR_URI = $extval(SLDataLocatorType,"SL_DATALOCATOR_URI")
macdef SL_DATALOCATOR_ADDRESS = $extval(SLDataLocatorType,"SL_DATALOCATOR_ADDRESS")
macdef SL_DATALOCATOR_RESERVED8 = $extval(SLDataLocatorType,"SL_DATALOCATOR_RESERVED8")
macdef SL_DATALOCATOR_RESERVED5 = $extval(SLDataLocatorType,"SL_DATALOCATOR_RESERVED5")
macdef SL_DATALOCATOR_BUFFERQUEUE = $extval(SLDataLocatorType,"SL_DATALOCATOR_BUFFERQUEUE")

abst@ype SLDataFormatType = SLuint32
macdef SL_DATAFORMAT_PCM = $extval(SLDataFormatType,"SL_DATAFORMAT_PCM")
macdef SL_DATAFORMAT_MIME = $extval(SLDataFormatType,"SL_DATAFORMAT_MIME")
macdef SL_DATAFORMAT_RESERVED3 = $extval(SLDataFormatType,"SL_DATAFORMAT_RESERVED3")

abst@ype SLSamplingRate = SLuint32
macdef SL_SAMPLINGRATE_8 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_8")
macdef SL_SAMPLINGRATE_11_025 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_11_025")
macdef SL_SAMPLINGRATE_12 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_12")
macdef SL_SAMPLINGRATE_16 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_16")
macdef SL_SAMPLINGRATE_22_05 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_22_05")
macdef SL_SAMPLINGRATE_24 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_24")
macdef SL_SAMPLINGRATE_32 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_32")
macdef SL_SAMPLINGRATE_44_1 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_44_1")
macdef SL_SAMPLINGRATE_48 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_48")
macdef SL_SAMPLINGRATE_64 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_64")
macdef SL_SAMPLINGRATE_88_2 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_88_2")
macdef SL_SAMPLINGRATE_96 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_96")
macdef SL_SAMPLINGRATE_192 = $extval(SLSamplingRate,"SL_SAMPLINGRATE_192")

abst@ype SLPCMSampleFormat = SLuint32
macdef SL_PCMSAMPLEFORMAT_FIXED_8 = $extval(SLPCMSampleFormat,"SL_PCMSAMPLEFORMAT_FIXED_8")
macdef SL_PCMSAMPLEFORMAT_FIXED_16 = $extval(SLPCMSampleFormat,"SL_PCMSAMPLEFORMAT_FIXED_16")
macdef SL_PCMSAMPLEFORMAT_FIXED_20 = $extval(SLPCMSampleFormat,"SL_PCMSAMPLEFORMAT_FIXED_20")
macdef SL_PCMSAMPLEFORMAT_FIXED_24 = $extval(SLPCMSampleFormat,"SL_PCMSAMPLEFORMAT_FIXED_24")
macdef SL_PCMSAMPLEFORMAT_FIXED_28 = $extval(SLPCMSampleFormat,"SL_PCMSAMPLEFORMAT_FIXED_28")
macdef SL_PCMSAMPLEFORMAT_FIXED_32 = $extval(SLPCMSampleFormat,"SL_PCMSAMPLEFORMAT_FIXED_32")

fn eq_SLPCMSampleFormat_SLPCMSampleFormat( SLPCMSampleFormat, SLPCMSampleFormat ) :<> bool = "mac#_sles_ats2_eq"
fn neq_SLPCMSampleFormat_SLPCMSampleFormat( SLPCMSampleFormat, SLPCMSampleFormat ) :<> bool = "mac#_sles_ats2_neq"

overload = with eq_SLPCMSampleFormat_SLPCMSampleFormat
overload != with neq_SLPCMSampleFormat_SLPCMSampleFormat

abst@ype SLSpeaker = SLuint32
macdef SL_SPEAKER_NONE = $extval(SLSpeaker,"0")
macdef SL_SPEAKER_FRONT_RIGHT = $extval(SLSpeaker,"SL_SPEAKER_FRONT_RIGHT")
macdef SL_SPEAKER_SIDE_RIGHT = $extval(SLSpeaker,"SL_SPEAKER_SIDE_RIGHT")
macdef SL_SPEAKER_TOP_FRONT_CENTER = $extval(SLSpeaker,"SL_SPEAKER_TOP_FRONT_CENTER")
macdef SL_SPEAKER_FRONT_CENTER = $extval(SLSpeaker,"SL_SPEAKER_FRONT_CENTER")
macdef SL_SPEAKER_FRONT_RIGHT_OF_CENTER = $extval(SLSpeaker,"SL_SPEAKER_FRONT_RIGHT_OF_CENTER")
macdef SL_SPEAKER_FRONT_LEFT_OF_CENTER = $extval(SLSpeaker,"SL_SPEAKER_FRONT_LEFT_OF_CENTER")
macdef SL_SPEAKER_TOP_BACK_LEFT = $extval(SLSpeaker,"SL_SPEAKER_TOP_BACK_LEFT")
macdef SL_SPEAKER_SIDE_LEFT = $extval(SLSpeaker,"SL_SPEAKER_SIDE_LEFT")
macdef SL_SPEAKER_BACK_RIGHT = $extval(SLSpeaker,"SL_SPEAKER_BACK_RIGHT")
macdef SL_SPEAKER_BACK_CENTER = $extval(SLSpeaker,"SL_SPEAKER_BACK_CENTER")
macdef SL_SPEAKER_TOP_CENTER = $extval(SLSpeaker,"SL_SPEAKER_TOP_CENTER")
macdef SL_SPEAKER_BACK_LEFT = $extval(SLSpeaker,"SL_SPEAKER_BACK_LEFT")
macdef SL_SPEAKER_FRONT_LEFT = $extval(SLSpeaker,"SL_SPEAKER_FRONT_LEFT")
macdef SL_SPEAKER_TOP_BACK_CENTER = $extval(SLSpeaker,"SL_SPEAKER_TOP_BACK_CENTER")
macdef SL_SPEAKER_TOP_BACK_RIGHT = $extval(SLSpeaker,"SL_SPEAKER_TOP_BACK_RIGHT")
macdef SL_SPEAKER_TOP_FRONT_RIGHT = $extval(SLSpeaker,"SL_SPEAKER_TOP_FRONT_RIGHT")
macdef SL_SPEAKER_TOP_FRONT_LEFT = $extval(SLSpeaker,"SL_SPEAKER_TOP_FRONT_LEFT")
macdef SL_SPEAKER_LOW_FREQUENCY = $extval(SLSpeaker,"SL_SPEAKER_LOW_FREQUENCY")

fn lor_SLSpeaker_SLSpeaker( SLSpeaker, SLSpeaker ) :<> SLSpeaker = "mac#_sles_ats2_lor"
overload lor with lor_SLSpeaker_SLSpeaker

abst@ype SLByteOrder = SLuint32
macdef SL_BYTEORDER_BIGENDIAN = $extval(SLByteOrder,"SL_BYTEORDER_BIGENDIAN")
macdef SL_BYTEORDER_LITTLEENDIAN = $extval(SLByteOrder,"SL_BYTEORDER_LITTLEENDIAN")

abst@ype SLPlayState = SLuint32
macdef SL_PLAYSTATE_PLAYING = $extval(SLPlayState,"SL_PLAYSTATE_PLAYING")
macdef SL_PLAYSTATE_PAUSED = $extval(SLPlayState,"SL_PLAYSTATE_PAUSED")
macdef SL_PLAYSTATE_STOPPED = $extval(SLPlayState,"SL_PLAYSTATE_STOPPED")

abst@ype SLRecordState = SLuint32
macdef SL_RECORDSTATE_RECORDING = $extval(SLRecordState,"SL_RECORDSTATE_RECORDING")
macdef SL_RECORDSTATE_PAUSED = $extval(SLRecordState,"SL_RECORDSTATE_PAUSED")
macdef SL_RECORDSTATE_STOPPED = $extval(SLRecordState,"SL_RECORDSTATE_STOPPED")

abst@ype SLIODeviceType = SLuint32
macdef SL_IODEVICE_LEDARRAY = $extval(SLIODeviceType,"SL_IODEVICE_LEDARRAY")
macdef SL_IODEVICE_AUDIOINPUT = $extval(SLIODeviceType,"SL_IODEVICE_AUDIOINPUT")
macdef SL_IODEVICE_RESERVED4 = $extval(SLIODeviceType,"SL_IODEVICE_RESERVED4")
macdef SL_IODEVICE_RESERVED5 = $extval(SLIODeviceType,"SL_IODEVICE_RESERVED5")


abst@ype SLDeviceID = SLuint32
macdef SL_DEFAULTDEVICEID_AUDIOINPUT = $extval(SLDeviceID,"SL_DEFAULTDEVICEID_AUDIOINPUT")
macdef SL_DEFAULTDEVICEID_LED = $extval(SLDeviceID,"SL_DEFAULTDEVICEID_LED")
macdef SL_DEFAULTDEVICEID_RESERVED1 = $extval(SLDeviceID,"SL_DEFAULTDEVICEID_RESERVED1")
macdef SL_DEFAULTDEVICEID_AUDIOOUTPUT = $extval(SLDeviceID,"SL_DEFAULTDEVICEID_AUDIOOUTPUT")
macdef SL_DEFAULTDEVICEID_VIBRA = $extval(SLDeviceID,"SL_DEFAULTDEVICEID_VIBRA")

abstype SLObjectItf = $extype"SLObjectItf"

typedef slObjectCallback = (SLObjectItf, cPtr0(void), SLuint32, SLresult, SLuint32, ptr) -> void

typedef struct_SLObjectItf_ = $extype_struct"struct SLObjectItf_" of {
   Realize = (SLObjectItf, SLboolean) -> SLresult
 , Resume = (SLObjectItf, SLboolean) -> SLresult
 , GetState = (SLObjectItf, cPtr0(SLuint32)) -> SLresult
 , GetInterface = (SLObjectItf, SLInterfaceID, ptr) -> SLresult
 , RegisterCallback = (SLObjectItf, slObjectCallback, ptr) -> SLresult
 , AbortAsyncOperation = (SLObjectItf) -> void
 , Destroy = (SLObjectItf) -> void
 , SetPriority = (SLObjectItf, SLint32, SLboolean) -> SLresult
 , GetPriority = (SLObjectItf, cPtr0(SLint32), cPtr0(SLboolean)) -> SLresult
 , SetLossOfControlInterfaces = (SLObjectItf, SLint16, cPtr0(SLInterfaceID), SLboolean) -> SLresult
}

fn SLObjectItf_deref( !SLObjectItf ) : struct_SLObjectItf_ = "mac#_sles_object_deref"
overload ! with SLObjectItf_deref 

typedef SLDataLocator_URI = $extype_struct"SLDataLocator_URI" of {
   locatorType = SLDataLocatorType
 , URI = cPtr0(SLchar)
}

typedef SLDataLocator_Address = $extype_struct"SLDataLocator_Address" of {
   locatorType = SLDataLocatorType
 , pAddress = ptr
 , length = SLuint32
}

typedef SLDataLocator_IODevice = $extype_struct"SLDataLocator_IODevice" of {
   locatorType = SLDataLocatorType
 , deviceType = SLIODeviceType
 , deviceID = SLDeviceID
 , device = SLObjectItf
}

typedef SLDataLocator_OutputMix = $extype_struct"SLDataLocator_OutputMix" of {
   locatorType = SLDataLocatorType
 , outputMix = SLObjectItf
}

typedef SLDataLocator_BufferQueue = $extype_struct"SLDataLocator_BufferQueue" of {
   locatorType = SLDataLocatorType
 , numBuffers = SLuint32
}

typedef SLDataLocator_MIDIBufferQueue = $extype_struct"SLDataLocator_MIDIBufferQueue" of {
   locatorType = SLDataLocatorType
 , tpqn = SLuint32
 , numBuffers = SLuint32
}

typedef SLDataFormat_MIME = $extype_struct"SLDataFormat_MIME" of {
   formatType = SLDataFormatType
 , mimeType = cPtr0(SLchar)
 , containerType = SLuint32
}

typedef SLDataFormat_PCM = $extype_struct"SLDataFormat_PCM" of {
   formatType = SLDataFormatType
 , numChannels = SLuint32
 , samplesPerSec = SLSamplingRate
 , bitsPerSample = SLPCMSampleFormat
 , containerSize = SLPCMSampleFormat
 , channelMask = SLSpeaker
 , endianness = SLByteOrder
}

typedef SLDataSource = $extype_struct"SLDataSource" of {
   pLocator = ptr
 , pFormat = ptr
}

typedef SLDataSink = $extype_struct"SLDataSink" of {
   pLocator = ptr
 , pFormat = ptr
}


typedef SLAudioInputDescriptor = $extype_struct"SLAudioInputDescriptor" of {
   deviceName = cPtr0(SLchar)
 , deviceConnection = SLint16
 , deviceScope = SLint16
 , deviceLocation = SLint16
 , isForTelephony = SLboolean
 , minSampleRate = SLmilliHertz
 , maxSampleRate = SLmilliHertz
 , isFreqRangeContinuous = SLboolean
 , samplingRatesSupported = cPtr0(SLmilliHertz)
 , numOfSamplingRatesSupported = SLint16
 , maxChannels = SLint16
}

typedef SLAudioOutputDescriptor = $extype_struct"SLAudioOutputDescriptor" of {
   pDeviceName = cPtr0(SLchar)
 , deviceConnection = SLint16
 , deviceScope = SLint16
 , deviceLocation = SLint16
 , isForTelephony = SLboolean
 , minSampleRate = SLmilliHertz
 , maxSampleRate = SLmilliHertz
 , isFreqRangeContinuous = SLboolean
 , samplingRatesSupported = cPtr0(SLmilliHertz)
 , numOfSamplingRatesSupported = SLint16
 , maxChannels = SLint16
}

typedef struct_SLAudioIODeviceCapabilitiesItf_ = $extype"struct SLAudioIODeviceCapabilitiesItf_"

typedef SLAudioIODeviceCapabilitiesItf = $extype"SLAudioIODeviceCapabilitiesItf"

typedef slAvailableAudioInputsChangedCallback = (SLAudioIODeviceCapabilitiesItf, ptr, SLuint32, SLint32, SLboolean) -> void

typedef slAvailableAudioOutputsChangedCallback = (SLAudioIODeviceCapabilitiesItf, ptr, SLuint32, SLint32, SLboolean) -> void

typedef slDefaultDeviceIDMapChangedCallback = (SLAudioIODeviceCapabilitiesItf, ptr, SLboolean, SLint32) -> void

typedef struct_SLAudioIODeviceCapabilitiesItf_ = $extype_struct"struct SLAudioIODeviceCapabilitiesItf_" of {
   GetAvailableAudioInputs = (SLAudioIODeviceCapabilitiesItf, cPtr0(SLint32), cPtr0(SLuint32)) -> SLresult
 , QueryAudioInputCapabilities = (SLAudioIODeviceCapabilitiesItf, SLuint32, cPtr0(SLAudioInputDescriptor)) -> SLresult
 , RegisterAvailableAudioInputsChangedCallback = (SLAudioIODeviceCapabilitiesItf, slAvailableAudioInputsChangedCallback, ptr) -> SLresult
 , GetAvailableAudioOutputs = (SLAudioIODeviceCapabilitiesItf, cPtr0(SLint32), cPtr0(SLuint32)) -> SLresult
 , QueryAudioOutputCapabilities = (SLAudioIODeviceCapabilitiesItf, SLuint32, cPtr0(SLAudioOutputDescriptor)) -> SLresult
 , RegisterAvailableAudioOutputsChangedCallback = (SLAudioIODeviceCapabilitiesItf, slAvailableAudioOutputsChangedCallback, ptr) -> SLresult
 , RegisterDefaultDeviceIDMapChangedCallback = (SLAudioIODeviceCapabilitiesItf, slDefaultDeviceIDMapChangedCallback, ptr) -> SLresult
 , GetAssociatedAudioInputs = (SLAudioIODeviceCapabilitiesItf, SLuint32, cPtr0(SLint32), cPtr0(SLuint32)) -> SLresult
 , GetAssociatedAudioOutputs = (SLAudioIODeviceCapabilitiesItf, SLuint32, cPtr0(SLint32), cPtr0(SLuint32)) -> SLresult
 , GetDefaultAudioDevices = (SLAudioIODeviceCapabilitiesItf, SLuint32, cPtr0(SLint32), cPtr0(SLuint32)) -> SLresult
 , QuerySampleFormatsSupported = (SLAudioIODeviceCapabilitiesItf, SLuint32, SLmilliHertz, cPtr0(SLint32), cPtr0(SLint32)) -> SLresult
}

typedef SLLEDDescriptor = $extype_struct"SLLEDDescriptor" of {
   ledCount = SLuint8
 , primaryLED = SLuint8
 , colorMask = SLuint32
}

typedef SLHSL = $extype_struct"SLHSL" of {
   hue = SLmillidegree
 , saturation = SLpermille
 , lightness = SLpermille
}

typedef struct_SLLEDArrayItf_ = $extype"struct SLLEDArrayItf_"

typedef SLLEDArrayItf = $extype"SLLEDArrayItf"

typedef struct_SLLEDArrayItf_ = $extype_struct"struct SLLEDArrayItf_" of {
   ActivateLEDArray = (SLLEDArrayItf, SLuint32) -> SLresult
 , IsLEDArrayActivated = (SLLEDArrayItf, cPtr0(SLuint32)) -> SLresult
 , SetColor = (SLLEDArrayItf, SLuint8, cPtr0(SLHSL)) -> SLresult
 , GetColor = (SLLEDArrayItf, SLuint8, cPtr0(SLHSL)) -> SLresult
}

typedef SLVibraDescriptor = $extype_struct"SLVibraDescriptor" of {
   supportsFrequency = SLboolean
 , supportsIntensity = SLboolean
 , minFrequency = SLmilliHertz
 , maxFrequency = SLmilliHertz
}

typedef struct_SLVibraItf_ = $extype"struct SLVibraItf_"

typedef SLVibraItf = $extype"SLVibraItf"

typedef struct_SLVibraItf_ = $extype_struct"struct SLVibraItf_" of {
   Vibrate = (SLVibraItf, SLboolean) -> SLresult
 , IsVibrating = (SLVibraItf, cPtr0(SLboolean)) -> SLresult
 , SetFrequency = (SLVibraItf, SLmilliHertz) -> SLresult
 , GetFrequency = (SLVibraItf, cPtr0(SLmilliHertz)) -> SLresult
 , SetIntensity = (SLVibraItf, SLpermille) -> SLresult
 , GetIntensity = (SLVibraItf, cPtr0(SLpermille)) -> SLresult
}

typedef SLMetadataInfo = $extype_struct"SLMetadataInfo" of {
   size = SLuint32
 , encoding = SLuint32
 , langCountry = SLchar
 , data = SLuint8
}

typedef struct_SLMetadataExtractionItf_ = $extype"struct SLMetadataExtractionItf_"

typedef SLMetadataExtractionItf = $extype"SLMetadataExtractionItf"

typedef struct_SLMetadataExtractionItf_ = $extype_struct"struct SLMetadataExtractionItf_" of {
   GetItemCount = (SLMetadataExtractionItf, cPtr0(SLuint32)) -> SLresult
 , GetKeySize = (SLMetadataExtractionItf, SLuint32, cPtr0(SLuint32)) -> SLresult
 , GetKey = (SLMetadataExtractionItf, SLuint32, SLuint32, cPtr0(SLMetadataInfo)) -> SLresult
 , GetValueSize = (SLMetadataExtractionItf, SLuint32, cPtr0(SLuint32)) -> SLresult
 , GetValue = (SLMetadataExtractionItf, SLuint32, SLuint32, cPtr0(SLMetadataInfo)) -> SLresult
 , AddKeyFilter = (SLMetadataExtractionItf, SLuint32, cPtr0(void), SLuint32, cPtr0(SLchar), SLuint32, SLuint8) -> SLresult
 , ClearKeyFilter = (SLMetadataExtractionItf) -> SLresult
}

typedef struct_SLMetadataTraversalItf_ = $extype"struct SLMetadataTraversalItf_"

typedef SLMetadataTraversalItf = $extype"SLMetadataTraversalItf"

typedef struct_SLMetadataTraversalItf_ = $extype_struct"struct SLMetadataTraversalItf_" of {
   SetMode = (SLMetadataTraversalItf, SLuint32) -> SLresult
 , GetChildCount = (SLMetadataTraversalItf, cPtr0(SLuint32)) -> SLresult
 , GetChildMIMETypeSize = (SLMetadataTraversalItf, SLuint32, cPtr0(SLuint32)) -> SLresult
 , GetChildInfo = (SLMetadataTraversalItf, SLuint32, cPtr0(SLint32), cPtr0(SLuint32), SLuint32, cPtr0(SLchar)) -> SLresult
 , SetActiveNode = (SLMetadataTraversalItf, SLuint32) -> SLresult
}

typedef struct_SLDynamicSourceItf_ = $extype"struct SLDynamicSourceItf_"

typedef SLDynamicSourceItf = $extype"SLDynamicSourceItf"

typedef struct_SLDynamicSourceItf_ = $extype_struct"struct SLDynamicSourceItf_" of {
   SetSource = (SLDynamicSourceItf, cPtr0(SLDataSource)) -> SLresult
}

typedef struct_SLOutputMixItf_ = $extype"struct SLOutputMixItf_"

typedef SLOutputMixItf = $extype"SLOutputMixItf"

typedef slMixDeviceChangeCallback = (SLOutputMixItf, ptr) -> void

typedef struct_SLOutputMixItf_ = $extype_struct"struct SLOutputMixItf_" of {
   GetDestinationOutputDeviceIDs = (SLOutputMixItf, cPtr0(SLint32), cPtr0(SLuint32)) -> SLresult
 , RegisterDeviceChangeCallback = (SLOutputMixItf, slMixDeviceChangeCallback, ptr) -> SLresult
 , ReRoute = (SLOutputMixItf, SLint32, cPtr0(SLuint32)) -> SLresult
}


typedef SLPlayItf = $extype"SLPlayItf"

typedef slPlayCallback = (SLPlayItf, ptr, SLuint32) -> void

typedef struct_SLPlayItf_ = $extype_struct"struct SLPlayItf_" of {
   SetPlayState = (SLPlayItf, SLPlayState) -> SLresult
 , GetPlayState = (SLPlayItf, cPtr0(SLPlayState)) -> SLresult
 , GetDuration = (SLPlayItf, cPtr0(SLmillisecond)) -> SLresult
 , GetPosition = (SLPlayItf, cPtr0(SLmillisecond)) -> SLresult
 , RegisterCallback = (SLPlayItf, slPlayCallback, ptr) -> SLresult
 , SetCallbackEventsMask = (SLPlayItf, SLuint32) -> SLresult
 , GetCallbackEventsMask = (SLPlayItf, cPtr0(SLuint32)) -> SLresult
 , SetMarkerPosition = (SLPlayItf, SLmillisecond) -> SLresult
 , ClearMarkerPosition = (SLPlayItf) -> SLresult
 , GetMarkerPosition = (SLPlayItf, cPtr0(SLmillisecond)) -> SLresult
 , SetPositionUpdatePeriod = (SLPlayItf, SLmillisecond) -> SLresult
 , GetPositionUpdatePeriod = (SLPlayItf, cPtr0(SLmillisecond)) -> SLresult
}
fn SLPlayItf_deref( SLPlayItf ) : struct_SLPlayItf_ = "mac#_sles_object_deref"
overload ! with SLPlayItf_deref 


typedef struct_SLPrefetchStatusItf_ = $extype"struct SLPrefetchStatusItf_"

typedef SLPrefetchStatusItf = $extype"SLPrefetchStatusItf"

typedef slPrefetchCallback = (SLPrefetchStatusItf, ptr, SLuint32) -> void

typedef struct_SLPrefetchStatusItf_ = $extype_struct"struct SLPrefetchStatusItf_" of {
   GetPrefetchStatus = (SLPrefetchStatusItf, cPtr0(SLuint32)) -> SLresult
 , GetFillLevel = (SLPrefetchStatusItf, cPtr0(SLpermille)) -> SLresult
 , RegisterCallback = (SLPrefetchStatusItf, slPrefetchCallback, ptr) -> SLresult
 , SetCallbackEventsMask = (SLPrefetchStatusItf, SLuint32) -> SLresult
 , GetCallbackEventsMask = (SLPrefetchStatusItf, cPtr0(SLuint32)) -> SLresult
 , SetFillUpdatePeriod = (SLPrefetchStatusItf, SLpermille) -> SLresult
 , GetFillUpdatePeriod = (SLPrefetchStatusItf, cPtr0(SLpermille)) -> SLresult
}

typedef struct_SLPlaybackRateItf_ = $extype"struct SLPlaybackRateItf_"

typedef SLPlaybackRateItf = $extype"SLPlaybackRateItf"

typedef struct_SLPlaybackRateItf_ = $extype_struct"struct SLPlaybackRateItf_" of {
   SetRate = (SLPlaybackRateItf, SLpermille) -> SLresult
 , GetRate = (SLPlaybackRateItf, cPtr0(SLpermille)) -> SLresult
 , SetPropertyConstraints = (SLPlaybackRateItf, SLuint32) -> SLresult
 , GetProperties = (SLPlaybackRateItf, cPtr0(SLuint32)) -> SLresult
 , GetCapabilitiesOfRate = (SLPlaybackRateItf, SLpermille, cPtr0(SLuint32)) -> SLresult
 , GetRateRange = (SLPlaybackRateItf, SLuint8, cPtr0(SLpermille), cPtr0(SLpermille), cPtr0(SLpermille), cPtr0(SLuint32)) -> SLresult
}

typedef struct_SLSeekItf_ = $extype"struct SLSeekItf_"

typedef SLSeekItf = $extype"SLSeekItf"

typedef struct_SLSeekItf_ = $extype_struct"struct SLSeekItf_" of {
   SetPosition = (SLSeekItf, SLmillisecond, SLuint32) -> SLresult
 , SetLoop = (SLSeekItf, SLboolean, SLmillisecond, SLmillisecond) -> SLresult
 , GetLoop = (SLSeekItf, cPtr0(SLboolean), cPtr0(SLmillisecond), cPtr0(SLmillisecond)) -> SLresult
}

typedef struct_SLRecordItf_ = $extype"struct SLRecordItf_"

typedef SLRecordItf = $extype"SLRecordItf"

typedef slRecordCallback = (SLRecordItf, ptr, SLuint32) -> void

typedef struct_SLRecordItf_ = $extype_struct"struct SLRecordItf_" of {
   SetRecordState = (SLRecordItf, SLRecordState) -> SLresult
 , GetRecordState = (SLRecordItf, cPtr0(SLRecordState)) -> SLresult
 , SetDurationLimit = (SLRecordItf, SLmillisecond) -> SLresult
 , GetPosition = (SLRecordItf, cPtr0(SLmillisecond)) -> SLresult
 , RegisterCallback = (SLRecordItf, slRecordCallback, ptr) -> SLresult
 , SetCallbackEventsMask = (SLRecordItf, SLuint32) -> SLresult
 , GetCallbackEventsMask = (SLRecordItf, cPtr0(SLuint32)) -> SLresult
 , SetMarkerPosition = (SLRecordItf, SLmillisecond) -> SLresult
 , ClearMarkerPosition = (SLRecordItf) -> SLresult
 , GetMarkerPosition = (SLRecordItf, cPtr0(SLmillisecond)) -> SLresult
 , SetPositionUpdatePeriod = (SLRecordItf, SLmillisecond) -> SLresult
 , GetPositionUpdatePeriod = (SLRecordItf, cPtr0(SLmillisecond)) -> SLresult
}

fn SLRecordItf_deref( SLRecordItf ) : struct_SLRecordItf_ = "mac#_sles_object_deref"
overload ! with SLRecordItf_deref

typedef struct_SLEqualizerItf_ = $extype"struct SLEqualizerItf_"

typedef SLEqualizerItf = $extype"SLEqualizerItf"

typedef struct_SLEqualizerItf_ = $extype_struct"struct SLEqualizerItf_" of {
   SetEnabled = (SLEqualizerItf, SLboolean) -> SLresult
 , IsEnabled = (SLEqualizerItf, cPtr0(SLboolean)) -> SLresult
 , GetNumberOfBands = (SLEqualizerItf, cPtr0(SLuint16)) -> SLresult
 , GetBandLevelRange = (SLEqualizerItf, cPtr0(SLmillibel), cPtr0(SLmillibel)) -> SLresult
 , SetBandLevel = (SLEqualizerItf, SLuint16, SLmillibel) -> SLresult
 , GetBandLevel = (SLEqualizerItf, SLuint16, cPtr0(SLmillibel)) -> SLresult
 , GetCenterFreq = (SLEqualizerItf, SLuint16, cPtr0(SLmilliHertz)) -> SLresult
 , GetBandFreqRange = (SLEqualizerItf, SLuint16, cPtr0(SLmilliHertz), cPtr0(SLmilliHertz)) -> SLresult
 , GetBand = (SLEqualizerItf, SLmilliHertz, cPtr0(SLuint16)) -> SLresult
 , GetCurrentPreset = (SLEqualizerItf, cPtr0(SLuint16)) -> SLresult
 , UsePreset = (SLEqualizerItf, SLuint16) -> SLresult
 , GetNumberOfPresets = (SLEqualizerItf, cPtr0(SLuint16)) -> SLresult
 , GetPresetName = (SLEqualizerItf, SLuint16, cPtr0(cPtr0(SLchar))) -> SLresult
}

typedef struct_SLVolumeItf_ = $extype"struct SLVolumeItf_"

typedef SLVolumeItf = $extype"SLVolumeItf"

typedef struct_SLVolumeItf_ = $extype_struct"struct SLVolumeItf_" of {
   SetVolumeLevel = (SLVolumeItf, SLmillibel) -> SLresult
 , GetVolumeLevel = (SLVolumeItf, cPtr0(SLmillibel)) -> SLresult
 , GetMaxVolumeLevel = (SLVolumeItf, cPtr0(SLmillibel)) -> SLresult
 , SetMute = (SLVolumeItf, SLboolean) -> SLresult
 , GetMute = (SLVolumeItf, cPtr0(SLboolean)) -> SLresult
 , EnableStereoPosition = (SLVolumeItf, SLboolean) -> SLresult
 , IsEnabledStereoPosition = (SLVolumeItf, cPtr0(SLboolean)) -> SLresult
 , SetStereoPosition = (SLVolumeItf, SLpermille) -> SLresult
 , GetStereoPosition = (SLVolumeItf, cPtr0(SLpermille)) -> SLresult
}

typedef struct_SLDeviceVolumeItf_ = $extype"struct SLDeviceVolumeItf_"

typedef SLDeviceVolumeItf = $extype"SLDeviceVolumeItf"

typedef struct_SLDeviceVolumeItf_ = $extype_struct"struct SLDeviceVolumeItf_" of {
   GetVolumeScale = (SLDeviceVolumeItf, SLuint32, cPtr0(SLint32), cPtr0(SLint32), cPtr0(SLboolean)) -> SLresult
 , SetVolume = (SLDeviceVolumeItf, SLuint32, SLint32) -> SLresult
 , GetVolume = (SLDeviceVolumeItf, SLuint32, cPtr0(SLint32)) -> SLresult
}


typedef SLBufferQueueItf = $extype"SLBufferQueueItf"

typedef slBufferQueueCallback = (SLBufferQueueItf, ptr) -> void

typedef SLBufferQueueState = $extype_struct"SLBufferQueueState" of {
   count = SLuint32
 , playIndex = SLuint32
}

typedef struct_SLBufferQueueItf_ = $extype_struct"struct SLBufferQueueItf_" of {
   Enqueue = (SLBufferQueueItf, ptr, SLuint32) -> SLresult
 , Clear = (SLBufferQueueItf) -> SLresult
 , GetState = (SLBufferQueueItf, cPtr0(SLBufferQueueState)) -> SLresult
 , RegisterCallback = (SLBufferQueueItf, slBufferQueueCallback, ptr) -> SLresult
}

fn SLBufferQueueItf_deref (SLBufferQueueItf) : struct_SLBufferQueueItf_ = "mac#_sles_object_deref"
overload ! with SLBufferQueueItf_deref 


typedef struct_SLPresetReverbItf_ = $extype"struct SLPresetReverbItf_"

typedef SLPresetReverbItf = $extype"SLPresetReverbItf"

typedef struct_SLPresetReverbItf_ = $extype_struct"struct SLPresetReverbItf_" of {
   SetPreset = (SLPresetReverbItf, SLuint16) -> SLresult
 , GetPreset = (SLPresetReverbItf, cPtr0(SLuint16)) -> SLresult
}

typedef SLEnvironmentalReverbSettings = $extype_struct"SLEnvironmentalReverbSettings" of {
   roomLevel = SLmillibel
 , roomHFLevel = SLmillibel
 , decayTime = SLmillisecond
 , decayHFRatio = SLpermille
 , reflectionsLevel = SLmillibel
 , reflectionsDelay = SLmillisecond
 , reverbLevel = SLmillibel
 , reverbDelay = SLmillisecond
 , diffusion = SLpermille
 , density = SLpermille
}

typedef struct_SLEnvironmentalReverbItf_ = $extype"struct SLEnvironmentalReverbItf_"

typedef SLEnvironmentalReverbItf = $extype"SLEnvironmentalReverbItf"

typedef struct_SLEnvironmentalReverbItf_ = $extype_struct"struct SLEnvironmentalReverbItf_" of {
   SetRoomLevel = (SLEnvironmentalReverbItf, SLmillibel) -> SLresult
 , GetRoomLevel = (SLEnvironmentalReverbItf, cPtr0(SLmillibel)) -> SLresult
 , SetRoomHFLevel = (SLEnvironmentalReverbItf, SLmillibel) -> SLresult
 , GetRoomHFLevel = (SLEnvironmentalReverbItf, cPtr0(SLmillibel)) -> SLresult
 , SetDecayTime = (SLEnvironmentalReverbItf, SLmillisecond) -> SLresult
 , GetDecayTime = (SLEnvironmentalReverbItf, cPtr0(SLmillisecond)) -> SLresult
 , SetDecayHFRatio = (SLEnvironmentalReverbItf, SLpermille) -> SLresult
 , GetDecayHFRatio = (SLEnvironmentalReverbItf, cPtr0(SLpermille)) -> SLresult
 , SetReflectionsLevel = (SLEnvironmentalReverbItf, SLmillibel) -> SLresult
 , GetReflectionsLevel = (SLEnvironmentalReverbItf, cPtr0(SLmillibel)) -> SLresult
 , SetReflectionsDelay = (SLEnvironmentalReverbItf, SLmillisecond) -> SLresult
 , GetReflectionsDelay = (SLEnvironmentalReverbItf, cPtr0(SLmillisecond)) -> SLresult
 , SetReverbLevel = (SLEnvironmentalReverbItf, SLmillibel) -> SLresult
 , GetReverbLevel = (SLEnvironmentalReverbItf, cPtr0(SLmillibel)) -> SLresult
 , SetReverbDelay = (SLEnvironmentalReverbItf, SLmillisecond) -> SLresult
 , GetReverbDelay = (SLEnvironmentalReverbItf, cPtr0(SLmillisecond)) -> SLresult
 , SetDiffusion = (SLEnvironmentalReverbItf, SLpermille) -> SLresult
 , GetDiffusion = (SLEnvironmentalReverbItf, cPtr0(SLpermille)) -> SLresult
 , SetDensity = (SLEnvironmentalReverbItf, SLpermille) -> SLresult
 , GetDensity = (SLEnvironmentalReverbItf, cPtr0(SLpermille)) -> SLresult
 , SetEnvironmentalReverbProperties = (SLEnvironmentalReverbItf, cPtr0(SLEnvironmentalReverbSettings)) -> SLresult
 , GetEnvironmentalReverbProperties = (SLEnvironmentalReverbItf, cPtr0(SLEnvironmentalReverbSettings)) -> SLresult
}

typedef struct_SLEffectSendItf_ = $extype"struct SLEffectSendItf_"

typedef SLEffectSendItf = $extype"SLEffectSendItf"

typedef struct_SLEffectSendItf_ = $extype_struct"struct SLEffectSendItf_" of {
   EnableEffectSend = (SLEffectSendItf, cPtr0(void), SLboolean, SLmillibel) -> SLresult
 , IsEnabled = (SLEffectSendItf, cPtr0(void), cPtr0(SLboolean)) -> SLresult
 , SetDirectLevel = (SLEffectSendItf, SLmillibel) -> SLresult
 , GetDirectLevel = (SLEffectSendItf, cPtr0(SLmillibel)) -> SLresult
 , SetSendLevel = (SLEffectSendItf, cPtr0(void), SLmillibel) -> SLresult
 , GetSendLevel = (SLEffectSendItf, cPtr0(void), cPtr0(SLmillibel)) -> SLresult
}

typedef struct_SL3DGroupingItf_ = $extype"struct SL3DGroupingItf_"

typedef SL3DGroupingItf = $extype"SL3DGroupingItf"

typedef struct_SL3DGroupingItf_ = $extype_struct"struct SL3DGroupingItf_" of {
   Set3DGroup = (SL3DGroupingItf, SLObjectItf) -> SLresult
 , Get3DGroup = (SL3DGroupingItf, cPtr0(SLObjectItf)) -> SLresult
}

typedef struct_SL3DCommitItf_ = $extype"struct SL3DCommitItf_"

typedef SL3DCommitItf = $extype"SL3DCommitItf"

typedef struct_SL3DCommitItf_ = $extype_struct"struct SL3DCommitItf_" of {
   Commit = (SL3DCommitItf) -> SLresult
 , SetDeferred = (SL3DCommitItf, SLboolean) -> SLresult
}

typedef SLVec3D = $extype_struct"SLVec3D" of {
   x = SLint32
 , y = SLint32
 , z = SLint32
}

typedef struct_SL3DLocationItf_ = $extype"struct SL3DLocationItf_"

typedef SL3DLocationItf = $extype"SL3DLocationItf"

typedef struct_SL3DLocationItf_ = $extype_struct"struct SL3DLocationItf_" of {
   SetLocationCartesian = (SL3DLocationItf, cPtr0(SLVec3D)) -> SLresult
 , SetLocationSpherical = (SL3DLocationItf, SLmillidegree, SLmillidegree, SLmillimeter) -> SLresult
 , Move = (SL3DLocationItf, cPtr0(SLVec3D)) -> SLresult
 , GetLocationCartesian = (SL3DLocationItf, cPtr0(SLVec3D)) -> SLresult
 , SetOrientationVectors = (SL3DLocationItf, cPtr0(SLVec3D), cPtr0(SLVec3D)) -> SLresult
 , SetOrientationAngles = (SL3DLocationItf, SLmillidegree, SLmillidegree, SLmillidegree) -> SLresult
 , Rotate = (SL3DLocationItf, SLmillidegree, cPtr0(SLVec3D)) -> SLresult
 , GetOrientationVectors = (SL3DLocationItf, cPtr0(SLVec3D), cPtr0(SLVec3D)) -> SLresult
}

typedef struct_SL3DDopplerItf_ = $extype"struct SL3DDopplerItf_"

typedef SL3DDopplerItf = $extype"SL3DDopplerItf"

typedef struct_SL3DDopplerItf_ = $extype_struct"struct SL3DDopplerItf_" of {
   SetVelocityCartesian = (SL3DDopplerItf, cPtr0(SLVec3D)) -> SLresult
 , SetVelocitySpherical = (SL3DDopplerItf, SLmillidegree, SLmillidegree, SLmillimeter) -> SLresult
 , GetVelocityCartesian = (SL3DDopplerItf, cPtr0(SLVec3D)) -> SLresult
 , SetDopplerFactor = (SL3DDopplerItf, SLpermille) -> SLresult
 , GetDopplerFactor = (SL3DDopplerItf, cPtr0(SLpermille)) -> SLresult
}

typedef struct_SL3DSourceItf_ = $extype"struct SL3DSourceItf_"

typedef SL3DSourceItf = $extype"SL3DSourceItf"

typedef struct_SL3DSourceItf_ = $extype_struct"struct SL3DSourceItf_" of {
   SetHeadRelative = (SL3DSourceItf, SLboolean) -> SLresult
 , GetHeadRelative = (SL3DSourceItf, cPtr0(SLboolean)) -> SLresult
 , SetRolloffDistances = (SL3DSourceItf, SLmillimeter, SLmillimeter) -> SLresult
 , GetRolloffDistances = (SL3DSourceItf, cPtr0(SLmillimeter), cPtr0(SLmillimeter)) -> SLresult
 , SetRolloffMaxDistanceMute = (SL3DSourceItf, SLboolean) -> SLresult
 , GetRolloffMaxDistanceMute = (SL3DSourceItf, cPtr0(SLboolean)) -> SLresult
 , SetRolloffFactor = (SL3DSourceItf, SLpermille) -> SLresult
 , GetRolloffFactor = (SL3DSourceItf, cPtr0(SLpermille)) -> SLresult
 , SetRoomRolloffFactor = (SL3DSourceItf, SLpermille) -> SLresult
 , GetRoomRolloffFactor = (SL3DSourceItf, cPtr0(SLpermille)) -> SLresult
 , SetRolloffModel = (SL3DSourceItf, SLuint8) -> SLresult
 , GetRolloffModel = (SL3DSourceItf, cPtr0(SLuint8)) -> SLresult
 , SetCone = (SL3DSourceItf, SLmillidegree, SLmillidegree, SLmillibel) -> SLresult
 , GetCone = (SL3DSourceItf, cPtr0(SLmillidegree), cPtr0(SLmillidegree), cPtr0(SLmillibel)) -> SLresult
}

typedef struct_SL3DMacroscopicItf_ = $extype"struct SL3DMacroscopicItf_"

typedef SL3DMacroscopicItf = $extype"SL3DMacroscopicItf"

typedef struct_SL3DMacroscopicItf_ = $extype_struct"struct SL3DMacroscopicItf_" of {
   SetSize = (SL3DMacroscopicItf, SLmillimeter, SLmillimeter, SLmillimeter) -> SLresult
 , GetSize = (SL3DMacroscopicItf, cPtr0(SLmillimeter), cPtr0(SLmillimeter), cPtr0(SLmillimeter)) -> SLresult
 , SetOrientationAngles = (SL3DMacroscopicItf, SLmillidegree, SLmillidegree, SLmillidegree) -> SLresult
 , SetOrientationVectors = (SL3DMacroscopicItf, cPtr0(SLVec3D), cPtr0(SLVec3D)) -> SLresult
 , Rotate = (SL3DMacroscopicItf, SLmillidegree, cPtr0(SLVec3D)) -> SLresult
 , GetOrientationVectors = (SL3DMacroscopicItf, cPtr0(SLVec3D), cPtr0(SLVec3D)) -> SLresult
}

typedef struct_SLMuteSoloItf_ = $extype"struct SLMuteSoloItf_"

typedef SLMuteSoloItf = $extype"SLMuteSoloItf"

typedef struct_SLMuteSoloItf_ = $extype_struct"struct SLMuteSoloItf_" of {
   SetChannelMute = (SLMuteSoloItf, SLuint8, SLboolean) -> SLresult
 , GetChannelMute = (SLMuteSoloItf, SLuint8, cPtr0(SLboolean)) -> SLresult
 , SetChannelSolo = (SLMuteSoloItf, SLuint8, SLboolean) -> SLresult
 , GetChannelSolo = (SLMuteSoloItf, SLuint8, cPtr0(SLboolean)) -> SLresult
 , GetNumChannels = (SLMuteSoloItf, cPtr0(SLuint8)) -> SLresult
}

typedef struct_SLDynamicInterfaceManagementItf_ = $extype"struct SLDynamicInterfaceManagementItf_"

typedef SLDynamicInterfaceManagementItf = $extype"SLDynamicInterfaceManagementItf"

typedef slDynamicInterfaceManagementCallback = (SLDynamicInterfaceManagementItf, ptr, SLuint32, SLresult, SLInterfaceID) -> void

typedef struct_SLDynamicInterfaceManagementItf_ = $extype_struct"struct SLDynamicInterfaceManagementItf_" of {
   AddInterface = (SLDynamicInterfaceManagementItf, SLInterfaceID, SLboolean) -> SLresult
 , RemoveInterface = (SLDynamicInterfaceManagementItf, SLInterfaceID) -> SLresult
 , ResumeInterface = (SLDynamicInterfaceManagementItf, SLInterfaceID, SLboolean) -> SLresult
 , RegisterCallback = (SLDynamicInterfaceManagementItf, slDynamicInterfaceManagementCallback, ptr) -> SLresult
}

typedef struct_SLMIDIMessageItf_ = $extype"struct SLMIDIMessageItf_"

typedef SLMIDIMessageItf = $extype"SLMIDIMessageItf"

typedef slMetaEventCallback = (SLMIDIMessageItf, ptr, SLuint8, SLuint32, cPtr0(SLuint8), SLuint32, SLuint16) -> void

typedef slMIDIMessageCallback = (SLMIDIMessageItf, ptr, SLuint8, SLuint32, cPtr0(SLuint8), SLuint32, SLuint16) -> void

typedef struct_SLMIDIMessageItf_ = $extype_struct"struct SLMIDIMessageItf_" of {
   SendMessage = (SLMIDIMessageItf, cPtr0(SLuint8), SLuint32) -> SLresult
 , RegisterMetaEventCallback = (SLMIDIMessageItf, slMetaEventCallback, ptr) -> SLresult
 , RegisterMIDIMessageCallback = (SLMIDIMessageItf, slMIDIMessageCallback, ptr) -> SLresult
 , AddMIDIMessageCallbackFilter = (SLMIDIMessageItf, SLuint32) -> SLresult
 , ClearMIDIMessageCallbackFilter = (SLMIDIMessageItf) -> SLresult
}

typedef struct_SLMIDIMuteSoloItf_ = $extype"struct SLMIDIMuteSoloItf_"

typedef SLMIDIMuteSoloItf = $extype"SLMIDIMuteSoloItf"

typedef struct_SLMIDIMuteSoloItf_ = $extype_struct"struct SLMIDIMuteSoloItf_" of {
   SetChannelMute = (SLMIDIMuteSoloItf, SLuint8, SLboolean) -> SLresult
 , GetChannelMute = (SLMIDIMuteSoloItf, SLuint8, cPtr0(SLboolean)) -> SLresult
 , SetChannelSolo = (SLMIDIMuteSoloItf, SLuint8, SLboolean) -> SLresult
 , GetChannelSolo = (SLMIDIMuteSoloItf, SLuint8, cPtr0(SLboolean)) -> SLresult
 , GetTrackCount = (SLMIDIMuteSoloItf, cPtr0(SLuint16)) -> SLresult
 , SetTrackMute = (SLMIDIMuteSoloItf, SLuint16, SLboolean) -> SLresult
 , GetTrackMute = (SLMIDIMuteSoloItf, SLuint16, cPtr0(SLboolean)) -> SLresult
 , SetTrackSolo = (SLMIDIMuteSoloItf, SLuint16, SLboolean) -> SLresult
 , GetTrackSolo = (SLMIDIMuteSoloItf, SLuint16, cPtr0(SLboolean)) -> SLresult
}

typedef struct_SLMIDITempoItf_ = $extype"struct SLMIDITempoItf_"

typedef SLMIDITempoItf = $extype"SLMIDITempoItf"

typedef struct_SLMIDITempoItf_ = $extype_struct"struct SLMIDITempoItf_" of {
   SetTicksPerQuarterNote = (SLMIDITempoItf, SLuint32) -> SLresult
 , GetTicksPerQuarterNote = (SLMIDITempoItf, cPtr0(SLuint32)) -> SLresult
 , SetMicrosecondsPerQuarterNote = (SLMIDITempoItf, SLmicrosecond) -> SLresult
 , GetMicrosecondsPerQuarterNote = (SLMIDITempoItf, cPtr0(SLmicrosecond)) -> SLresult
}

typedef struct_SLMIDITimeItf_ = $extype"struct SLMIDITimeItf_"

typedef SLMIDITimeItf = $extype"SLMIDITimeItf"

typedef struct_SLMIDITimeItf_ = $extype_struct"struct SLMIDITimeItf_" of {
   GetDuration = (SLMIDITimeItf, cPtr0(SLuint32)) -> SLresult
 , SetPosition = (SLMIDITimeItf, SLuint32) -> SLresult
 , GetPosition = (SLMIDITimeItf, cPtr0(SLuint32)) -> SLresult
 , SetLoopPoints = (SLMIDITimeItf, SLuint32, SLuint32) -> SLresult
 , GetLoopPoints = (SLMIDITimeItf, cPtr0(SLuint32), cPtr0(SLuint32)) -> SLresult
}

typedef SLAudioCodecDescriptor = $extype_struct"SLAudioCodecDescriptor" of {
   maxChannels = SLuint32
 , minBitsPerSample = SLuint32
 , maxBitsPerSample = SLuint32
 , minSampleRate = SLmilliHertz
 , maxSampleRate = SLmilliHertz
 , isFreqRangeContinuous = SLboolean
 , pSampleRatesSupported = cPtr0(SLmilliHertz)
 , numSampleRatesSupported = SLuint32
 , minBitRate = SLuint32
 , maxBitRate = SLuint32
 , isBitrateRangeContinuous = SLboolean
 , pBitratesSupported = cPtr0(SLuint32)
 , numBitratesSupported = SLuint32
 , profileSetting = SLuint32
 , modeSetting = SLuint32
}

typedef SLAudioCodecProfileMode = $extype_struct"SLAudioCodecProfileMode" of {
   profileSetting = SLuint32
 , modeSetting = SLuint32
}

typedef struct_SLAudioDecoderCapabilitiesItf_ = $extype"struct SLAudioDecoderCapabilitiesItf_"

typedef SLAudioDecoderCapabilitiesItf = $extype"SLAudioDecoderCapabilitiesItf"

typedef struct_SLAudioDecoderCapabilitiesItf_ = $extype_struct"struct SLAudioDecoderCapabilitiesItf_" of {
   GetAudioDecoders = (SLAudioDecoderCapabilitiesItf, cPtr0(SLuint32), cPtr0(SLuint32)) -> SLresult
 , GetAudioDecoderCapabilities = (SLAudioDecoderCapabilitiesItf, SLuint32, cPtr0(SLuint32), cPtr0(SLAudioCodecDescriptor)) -> SLresult
}

typedef SLAudioEncoderSettings = $extype_struct"SLAudioEncoderSettings" of {
   encoderId = SLuint32
 , channelsIn = SLuint32
 , channelsOut = SLuint32
 , sampleRate = SLmilliHertz
 , bitRate = SLuint32
 , bitsPerSample = SLPCMSampleFormat 
 , rateControl = SLuint32
 , profileSetting = SLuint32
 , levelSetting = SLuint32
 , channelMode = SLuint32
 , streamFormat = SLuint32
 , encodeOptions = SLuint32
 , blockAlignment = SLuint32
}

typedef struct_SLAudioEncoderCapabilitiesItf_ = $extype"struct SLAudioEncoderCapabilitiesItf_"

typedef SLAudioEncoderCapabilitiesItf = $extype"SLAudioEncoderCapabilitiesItf"

typedef struct_SLAudioEncoderCapabilitiesItf_ = $extype_struct"struct SLAudioEncoderCapabilitiesItf_" of {
   GetAudioEncoders = (SLAudioEncoderCapabilitiesItf, cPtr0(SLuint32), cPtr0(SLuint32)) -> SLresult
 , GetAudioEncoderCapabilities = (SLAudioEncoderCapabilitiesItf, SLuint32, cPtr0(SLuint32), cPtr0(SLAudioCodecDescriptor)) -> SLresult
}

typedef struct_SLAudioEncoderItf_ = $extype"struct SLAudioEncoderItf_"

typedef SLAudioEncoderItf = $extype"SLAudioEncoderItf"

typedef struct_SLAudioEncoderItf_ = $extype_struct"struct SLAudioEncoderItf_" of {
   SetEncoderSettings = (SLAudioEncoderItf, cPtr0(SLAudioEncoderSettings)) -> SLresult
 , GetEncoderSettings = (SLAudioEncoderItf, cPtr0(SLAudioEncoderSettings)) -> SLresult
}

typedef struct_SLBassBoostItf_ = $extype"struct SLBassBoostItf_"

typedef SLBassBoostItf = $extype"SLBassBoostItf"

typedef struct_SLBassBoostItf_ = $extype_struct"struct SLBassBoostItf_" of {
   SetEnabled = (SLBassBoostItf, SLboolean) -> SLresult
 , IsEnabled = (SLBassBoostItf, cPtr0(SLboolean)) -> SLresult
 , SetStrength = (SLBassBoostItf, SLpermille) -> SLresult
 , GetRoundedStrength = (SLBassBoostItf, cPtr0(SLpermille)) -> SLresult
 , IsStrengthSupported = (SLBassBoostItf, cPtr0(SLboolean)) -> SLresult
}

typedef struct_SLPitchItf_ = $extype"struct SLPitchItf_"

typedef SLPitchItf = $extype"SLPitchItf"

typedef struct_SLPitchItf_ = $extype_struct"struct SLPitchItf_" of {
   SetPitch = (SLPitchItf, SLpermille) -> SLresult
 , GetPitch = (SLPitchItf, cPtr0(SLpermille)) -> SLresult
 , GetPitchCapabilities = (SLPitchItf, cPtr0(SLpermille), cPtr0(SLpermille)) -> SLresult
}

typedef struct_SLRatePitchItf_ = $extype"struct SLRatePitchItf_"

typedef SLRatePitchItf = $extype"SLRatePitchItf"

typedef struct_SLRatePitchItf_ = $extype_struct"struct SLRatePitchItf_" of {
   SetRate = (SLRatePitchItf, SLpermille) -> SLresult
 , GetRate = (SLRatePitchItf, cPtr0(SLpermille)) -> SLresult
 , GetRatePitchCapabilities = (SLRatePitchItf, cPtr0(SLpermille), cPtr0(SLpermille)) -> SLresult
}

typedef struct_SLVirtualizerItf_ = $extype"struct SLVirtualizerItf_"

typedef SLVirtualizerItf = $extype"SLVirtualizerItf"

typedef struct_SLVirtualizerItf_ = $extype_struct"struct SLVirtualizerItf_" of {
   SetEnabled = (SLVirtualizerItf, SLboolean) -> SLresult
 , IsEnabled = (SLVirtualizerItf, cPtr0(SLboolean)) -> SLresult
 , SetStrength = (SLVirtualizerItf, SLpermille) -> SLresult
 , GetRoundedStrength = (SLVirtualizerItf, cPtr0(SLpermille)) -> SLresult
 , IsStrengthSupported = (SLVirtualizerItf, cPtr0(SLboolean)) -> SLresult
}

typedef struct_SLVisualizationItf_ = $extype"struct SLVisualizationItf_"

typedef SLVisualizationItf = $extype"SLVisualizationItf"

typedef slVisualizationCallback = (ptr, cPtr0(SLuint8), cPtr0(SLuint8), SLmilliHertz) -> void

typedef struct_SLVisualizationItf_ = $extype_struct"struct SLVisualizationItf_" of {
   RegisterVisualizationCallback = (SLVisualizationItf, slVisualizationCallback, ptr, SLmilliHertz) -> SLresult
 , GetMaxRate = (SLVisualizationItf, cPtr0(SLmilliHertz)) -> SLresult
}


abstype SLEngineItf = $extype"SLEngineItf"

typedef struct_SLEngineItf_ = $extype_struct"struct SLEngineItf_" of {
   CreateLEDDevice = (SLEngineItf, cPtr0(SLObjectItf), SLuint32, SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateVibraDevice = (SLEngineItf, cPtr0(SLObjectItf), SLuint32, SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateAudioPlayer = (SLEngineItf, cPtr0(SLObjectItf), cPtr0(SLDataSource), cPtr0(SLDataSink), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateAudioRecorder = (SLEngineItf, cPtr0(SLObjectItf), cPtr0(SLDataSource), cPtr0(SLDataSink), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateMidiPlayer = (SLEngineItf, cPtr0(SLObjectItf), cPtr0(SLDataSource), cPtr0(SLDataSource), cPtr0(SLDataSink), cPtr0(SLDataSink), cPtr0(SLDataSink), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateListener = (SLEngineItf, cPtr0(SLObjectItf), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , Create3DGroup = (SLEngineItf, cPtr0(SLObjectItf), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateOutputMix = (SLEngineItf, cPtr0(SLObjectItf), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateMetadataExtractor = (SLEngineItf, cPtr0(SLObjectItf), cPtr0(SLDataSource), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , CreateExtensionObject = (SLEngineItf, cPtr0(SLObjectItf), ptr, SLuint32, SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) -> SLresult
 , QueryNumSupportedInterfaces = (SLEngineItf, SLuint32, cPtr0(SLuint32)) -> SLresult
 , QuerySupportedInterfaces = (SLEngineItf, SLuint32, SLuint32, cPtr0(SLInterfaceID)) -> SLresult
 , QueryNumSupportedExtensions = (SLEngineItf, cPtr0(SLuint32)) -> SLresult
 , QuerySupportedExtension = (SLEngineItf, SLuint32, cPtr0(SLchar), cPtr0(SLint16)) -> SLresult
 , IsExtensionSupported = (SLEngineItf, cPtr0(SLchar), cPtr0(SLboolean)) -> SLresult
}

fn SLEngineItf_deref( SLEngineItf ) : struct_SLEngineItf_ = "mac#_sles_object_deref"
overload ! with SLEngineItf_deref 

typedef struct_SLEngineCapabilitiesItf_ = $extype"struct SLEngineCapabilitiesItf_"

typedef SLEngineCapabilitiesItf = $extype"SLEngineCapabilitiesItf"

typedef struct_SLEngineCapabilitiesItf_ = $extype_struct"struct SLEngineCapabilitiesItf_" of {
   QuerySupportedProfiles = (SLEngineCapabilitiesItf, cPtr0(SLuint16)) -> SLresult
 , QueryAvailableVoices = (SLEngineCapabilitiesItf, SLuint16, cPtr0(SLint16), cPtr0(SLboolean), cPtr0(SLint16)) -> SLresult
 , QueryNumberOfMIDISynthesizers = (SLEngineCapabilitiesItf, cPtr0(SLint16)) -> SLresult
 , QueryAPIVersion = (SLEngineCapabilitiesItf, cPtr0(SLint16), cPtr0(SLint16), cPtr0(SLint16)) -> SLresult
 , QueryLEDCapabilities = (SLEngineCapabilitiesItf, cPtr0(SLuint32), cPtr0(SLuint32), cPtr0(SLLEDDescriptor)) -> SLresult
 , QueryVibraCapabilities = (SLEngineCapabilitiesItf, cPtr0(SLuint32), cPtr0(SLuint32), cPtr0(SLVibraDescriptor)) -> SLresult
 , IsThreadSafe = (SLEngineCapabilitiesItf, cPtr0(SLboolean)) -> SLresult
}

typedef struct_SLThreadSyncItf_ = $extype"struct SLThreadSyncItf_"

typedef SLThreadSyncItf = $extype"SLThreadSyncItf"

typedef struct_SLThreadSyncItf_ = $extype_struct"struct SLThreadSyncItf_" of {
   EnterCriticalSection = (SLThreadSyncItf) -> SLresult
 , ExitCriticalSection = (SLThreadSyncItf) -> SLresult
}

typedef SLEngineOption = $extype_struct"SLEngineOption" of {
   feature = SLuint32
 , data = SLuint32
}

fun slCreateEngine(cPtr0(SLObjectItf), SLuint32, cPtr0(SLEngineOption), SLuint32, cPtr0(SLInterfaceID), cPtr0(SLboolean)) : SLresult = "mac#"

fun slQueryNumSupportedEngineInterfaces(cPtr0(SLuint32)) : SLresult = "mac#"

fun slQuerySupportedEngineInterfaces(SLuint32, cPtr0(SLInterfaceID)) : SLresult = "mac#"

castfn SLuint32_size( size_t ) :<> SLuint32 
overload SLu32 with SLuint32_size

castfn SLint8_int( int ) :<> SLint8 
overload SLi8 with SLint8_int
castfn SLint16_int( int ) :<> SLint16 
overload SLi16 with SLint16_int
castfn SLint32_int( int ) :<> SLint32 
overload SLi32 with SLint32_int
