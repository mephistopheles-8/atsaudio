#include "share/atspre_staload.hats"

staload "./../SATS/jack.sats"
staload "libats/libc/SATS/unistd.sats"

#define null cptr_null()

fun process ( 
   nframes :  jack_nframes_t 
 , arg     : ptr 
 ) : int = 0 where {

  
  } 

implement main0 () = 
  println!("Hello [test01]") where {

    var status : jack_status_t?
    
    val client 
      = jack_client_open("test01", JackNullOption, status )
    val () 
      = assert_errmsg( ~cptr_is_null(client), "Could not open JACK client")

    val x = jack_set_process_callback ( client, process, the_null_ptr )

    val output_port 
      = jack_port_register( client, "out", JACK_DEFAULT_MIDI_TYPE, JackPortIsOutput, 0UL )

    val () 
      = assert_errmsg( ~cptr_is_null(output_port), "Could not open JACK MIDI port")

    val _ = sleep( 10 )

    val _ = jack_client_close( client )

  }
