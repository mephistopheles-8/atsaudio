PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

RMF=rm -f

PATSCC=$(PATSHOMEQ)/bin/patscc

PATSFLAGS=-DATS_MEMALLOC_LIBC
CFLAGS=-O2
LFLAGS=-lm
LFLAGS_JACK=-ljack $(LFLAGS)
LFLAGS_PORTAUDIO=-lportaudio $(LFLAGS)

all:: test01
test01: test01.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS_JACK) 
cleanall:: ; $(RMF) test01

all:: test02
test02: test02.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS_JACK) 
cleanall:: ; $(RMF) test02

all:: test03
test03: test03.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS_JACK) 
cleanall:: ; $(RMF) test03

all:: test04
test04: test04.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS_JACK) 
cleanall:: ; $(RMF) test04

all:: test05
test05: test05.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS_JACK) 
cleanall:: ; $(RMF) test05

all:: test06
test06: test06.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS) -Wno-incompatible-pointer-types  -o $@ $< $(LFLAGS_PORTAUDIO) 
cleanall:: ; $(RMF) test06

# This requires my SPSC library
#all:: test07
test07: test07.dats ; $(PATSCC) -D_SPSC_STDATOMIC $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS_JACK) 
cleanall:: ; $(RMF) test07

all:: test08
test08: test08.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS) -Wno-incompatible-pointer-types -o $@ $< $(LFLAGS_PORTAUDIO) 
cleanall:: ; $(RMF) test08

cleanall:: ; $(RMF) *_*ats.c

clean:: cleanall
