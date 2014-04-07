all: Makefile.coq
	$(MAKE) -f Makefile.coq all

Makefile.coq: Make
	$(COQBIN)coq_makefile -f Make -o Makefile.coq

clean: Makefile.coq
	$(MAKE) -f Makefile.coq clean
