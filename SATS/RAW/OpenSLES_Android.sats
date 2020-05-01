
staload "./OpenSLES.sats"
%{#
#include <SLES/OpenSLES_Android.h>
%}

macdef SL_IID_ANDROIDCONFIGURATION = $extval(SLInterfaceID, "SL_IID_ANDROIDCONFIGURATION")
macdef SL_IID_ANDROIDSIMPLEBUFFERQUEUE = $extval(SLInterfaceID, "SL_IID_ANDROIDSIMPLEBUFFERQUEUE")
macdef SL_DATALOCATOR_ANDROIDSIMPLEBUFFERQUEUE = $extval(SLDataLocatorType,"SL_DATALOCATOR_ANDROIDSIMPLEBUFFERQUEUE")
typedef SLAndroidSimpleBufferQueueItf = $extype"SLAndroidSimpleBufferQueueItf"

typedef slAndroidSimpleBufferQueueCallback = (SLAndroidSimpleBufferQueueItf, ptr) -> void

typedef SLAndroidSimpleBufferQueueState = $extype_struct"SLAndroidSimpleBufferQueueState" of {
   count = SLuint32
 , index = SLuint32
}

typedef struct_SLAndroidSimpleBufferQueueItf_ = $extype_struct"struct SLAndroidSimpleBufferQueueItf_" of {
   Enqueue = (SLAndroidSimpleBufferQueueItf, ptr, SLuint32) -> SLresult
 , Clear = (SLAndroidSimpleBufferQueueItf) -> SLresult
 , GetState = (SLAndroidSimpleBufferQueueItf, cPtr0(SLAndroidSimpleBufferQueueState)) -> SLresult
 , RegisterCallback = (SLAndroidSimpleBufferQueueItf, slAndroidSimpleBufferQueueCallback, ptr) -> SLresult
}

fn SLAndroidSimpleBufferQueueItf_deref (SLAndroidSimpleBufferQueueItf) : struct_SLAndroidSimpleBufferQueueItf_ = "mac#_sles_object_deref"
overload ! with SLAndroidSimpleBufferQueueItf_deref 

typedef SLDataLocator_AndroidSimpleBufferQueue = $extype_struct"SLDataLocator_AndroidSimpleBufferQueue" of {
   locatorType = SLDataLocatorType
 , numBuffers = SLuint32
}
