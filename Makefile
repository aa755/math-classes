#############################################################################
##  v      #                   The Coq Proof Assistant                     ##
## <O___,, #                INRIA - CNRS - LIX - LRI - PPS                 ##
##   \VV/  #                                                               ##
##    //   #  Makefile automagically generated by coq_makefile Vtrunk      ##
#############################################################################

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

#
# This Makefile was generated by the command line :
# coq_makefile -f Make -o Makefile 
#

NOARG: all

# 
# This Makefile may take arguments passed as environment variables:
# COQBIN to specify the directory where Coq binaries resides;
# ZDEBUG/COQDEBUG to specify debug flags for ocamlc&ocamlopt/coqc;
# DSTROOT to specify a prefix to install path.

# Here is a hack to make $(eval $(shell works:
define donewline


endef
includecmdwithout@ = $(eval $(subst @,$(donewline),$(shell { $(1) | tr '\n' '@'; })))
$(call includecmdwithout@,$(COQBIN)coqtop -config)

##########################
#                        #
# Libraries definitions. #
#                        #
##########################

OCAMLLIBS?=-I .
COQSRCLIBS?=-I $(COQLIB)kernel -I $(COQLIB)lib \
  -I $(COQLIB)library -I $(COQLIB)parsing \
  -I $(COQLIB)pretyping -I $(COQLIB)interp \
  -I $(COQLIB)proofs -I $(COQLIB)tactics \
  -I $(COQLIB)toplevel \
  -I $(COQLIB)plugins/cc \
  -I $(COQLIB)plugins/decl_mode \
  -I $(COQLIB)plugins/dp \
  -I $(COQLIB)plugins/extraction \
  -I $(COQLIB)plugins/field \
  -I $(COQLIB)plugins/firstorder \
  -I $(COQLIB)plugins/fourier \
  -I $(COQLIB)plugins/funind \
  -I $(COQLIB)plugins/micromega \
  -I $(COQLIB)plugins/nsatz \
  -I $(COQLIB)plugins/omega \
  -I $(COQLIB)plugins/quote \
  -I $(COQLIB)plugins/ring \
  -I $(COQLIB)plugins/romega \
  -I $(COQLIB)plugins/rtauto \
  -I $(COQLIB)plugins/setoid_ring \
  -I $(COQLIB)plugins/subtac \
  -I $(COQLIB)plugins/subtac/test \
  -I $(COQLIB)plugins/syntax \
  -I $(COQLIB)plugins/xml
COQLIBS?= -R . MathClasses
COQDOCLIBS?=-R . MathClasses

##########################
#                        #
# Variables definitions. #
#                        #
##########################


ZFLAGS=$(OCAMLLIBS) $(COQSRCLIBS) -I $(CAMLP4LIB)
OPT?=
COQFLAGS?=-q $(OPT) $(COQLIBS) $(OTHERFLAGS) $(COQ_XML)
COQC?=$(COQBIN)coqc
COQDEP?=$(COQBIN)coqdep -c
GALLINA?=$(COQBIN)gallina
COQDOC?=$(COQBIN)coqdoc
CAMLC?=$(OCAMLC) -c -rectypes
CAMLOPTC?=$(OCAMLOPT) -c -rectypes
CAMLLINK?=$(OCAMLC) -rectypes
CAMLOPTLINK?=$(OCAMLOPT) -rectypes
GRAMMARS?=grammar.cma
CAMLP4EXTEND?=pa_extend.cmo pa_macro.cmo q_MLast.cmo
CAMLP4OPTIONS?=
PP?=-pp "$(CAMLP4BIN)$(CAMLP4)o -I $(CAMLLIB) -I . $(COQSRCLIBS) $(CAMLP4EXTEND) $(GRAMMARS) $(CAMLP4OPTIONS) -impl"

#################
#               #
# Install Paths #
#               #
#################

COQLIBINSTALL=${COQLIB}/user-contrib
COQDOCINSTALL=${DOCDIR}/user-contrib

###################################
#                                 #
# Definition of the "all" target. #
#                                 #
###################################

VFILES:=varieties/setoids.v\
  varieties/semirings.v\
  varieties/semigroups.v\
  varieties/rings.v\
  varieties/open_terms.v\
  varieties/monoids.v\
  varieties/groups.v\
  varieties/empty.v\
  varieties/closed_terms.v\
  theory/ua_transference.v\
  theory/ua_term_monad.v\
  theory/ua_subvariety.v\
  theory/ua_subalgebraT.v\
  theory/ua_subalgebra.v\
  theory/ua_products.v\
  theory/ua_packed.v\
  theory/ua_mapped_operations.v\
  theory/ua_homomorphisms.v\
  theory/ua_congruence.v\
  theory/strong_setoids.v\
  theory/streams.v\
  theory/shiftl.v\
  theory/setoids.v\
  theory/series.v\
  theory/sequences.v\
  theory/rings.v\
  theory/ring_ideals.v\
  theory/ring_congruence.v\
  theory/rationals.v\
  theory/quote_monoid.v\
  theory/products.v\
  theory/naturals.v\
  theory/nat_pow.v\
  theory/nat_distance.v\
  theory/monoid_normalization.v\
  theory/monads.v\
  theory/lattices.v\
  theory/jections.v\
  theory/integers.v\
  theory/int_to_nat.v\
  theory/int_pow.v\
  theory/int_abs.v\
  theory/hom_functor.v\
  theory/groups.v\
  theory/functors.v\
  theory/forget_variety.v\
  theory/forget_algebra.v\
  theory/finite_sets.v\
  theory/fields.v\
  theory/dec_fields.v\
  theory/cut_minus.v\
  theory/categories.v\
  theory/adjunctions.v\
  theory/abs.v\
  quote/classquote.v\
  orders/semirings.v\
  orders/rings.v\
  orders/rationals.v\
  orders/orders.v\
  orders/naturals.v\
  orders/nat_int.v\
  orders/minmax.v\
  orders/maps.v\
  orders/lattices.v\
  orders/integers.v\
  orders/dec_fields.v\
  misc/workarounds.v\
  misc/workaround_tactics.v\
  misc/util.v\
  misc/setoid_tactics.v\
  misc/propholds.v\
  misc/decision.v\
  misc/JMrelation.v\
  interfaces/vectorspace.v\
  interfaces/universal_algebra.v\
  interfaces/ua_basic.v\
  interfaces/sequences.v\
  interfaces/rationals.v\
  interfaces/orders.v\
  interfaces/naturals.v\
  interfaces/monads.v\
  interfaces/integers.v\
  interfaces/functors.v\
  interfaces/finite_sets.v\
  interfaces/canonical_names.v\
  interfaces/additional_operations.v\
  interfaces/abstract_algebra.v\
  implementations/stdlib_rationals.v\
  implementations/stdlib_binary_naturals.v\
  implementations/stdlib_binary_integers.v\
  implementations/semiring_pairs.v\
  implementations/positive_semiring_elements.v\
  implementations/polynomials.v\
  implementations/peano_naturals.v\
  implementations/option.v\
  implementations/nonzero_field_elements.v\
  implementations/nonneg_semiring_elements.v\
  implementations/nonneg_integers_naturals.v\
  implementations/ne_list.v\
  implementations/natpair_integers.v\
  implementations/mset_finite_set.v\
  implementations/modular_ring.v\
  implementations/list_finite_set.v\
  implementations/list.v\
  implementations/intfrac_rationals.v\
  implementations/field_of_fractions.v\
  implementations/fast_rationals.v\
  implementations/fast_naturals.v\
  implementations/fast_integers.v\
  implementations/dyadics.v\
  implementations/bool.v\
  implementations/ZType_integers.v\
  implementations/QType_rationals.v\
  implementations/NType_naturals.v\
  categories/variety.v\
  categories/varieties.v\
  categories/unit.v\
  categories/setoids.v\
  categories/setoid.v\
  categories/product.v\
  categories/functors.v\
  categories/functor.v\
  categories/empty.v\
  categories/dual.v\
  categories/categories.v\
  categories/cat.v\
  categories/algebras.v\
  categories/algebra.v\
  categories/JMcat.v

-include $(addsuffix .d,$(VFILES))
.SECONDARY: $(addsuffix .d,$(VFILES))

VOFILES:=$(VFILES:.v=.vo)
GLOBFILES:=$(VFILES:.v=.glob)
VIFILES:=$(VFILES:.v=.vi)
GFILES:=$(VFILES:.v=.g)
HTMLFILES:=$(VFILES:.v=.html)
GHTMLFILES:=$(VFILES:.v=.g.html)
CMOFILES=$(filter-out $(addsuffix .cmo,$(foreach lib,$(MLLIBFILES:.mllib=_MLLIB_DEPENDENCIES) $(MLPACKFILES:.mlpack=_MLPACK_DEPENDENCIES),$($(lib)))),$(ALLCMOFILES))

all: $(VOFILES) 

spec: $(VIFILES)

gallina: $(GFILES)

html: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc -html $(COQDOCLIBS) -d html $(VFILES)

gallinahtml: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc -html -g $(COQDOCLIBS) -d html $(VFILES)

all.ps: $(VFILES)
	$(COQDOC) -toc -ps $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`

all-gal.ps: $(VFILES)
	$(COQDOC) -toc -ps -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`

all.pdf: $(VFILES)
	$(COQDOC) -toc -pdf $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`

all-gal.pdf: $(VFILES)
	$(COQDOC) -toc -pdf -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $(VFILES)`


####################
#                  #
# Special targets. #
#                  #
####################

.PHONY: NOARG all opt byte archclean clean install depend html

%.vo %.glob: %.v
	$(COQC) $(COQDEBUG) $(COQFLAGS) $*

%.vi: %.v
	$(COQC) -i $(COQDEBUG) $(COQFLAGS) $*

%.g: %.v
	$(GALLINA) $<

%.tex: %.v
	$(COQDOC) -latex $< -o $@

%.html: %.v %.glob
	$(COQDOC) -html $< -o $@

%.g.tex: %.v
	$(COQDOC) -latex -g $< -o $@

%.g.html: %.v %.glob
	$(COQDOC) -html -g $< -o $@

%.v.d: %.v
	$(COQDEP) -slash $(COQLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

byte:
	$(MAKE) all "OPT:=-byte"

opt:
	$(MAKE) all "OPT:=-opt"

install:
	for i in $(VOFILES); do \
	 install -d `dirname $(DSTROOT)$(COQLIBINSTALL)/MathClasses/$$i`; \
	 install -m 0644 $$i $(DSTROOT)$(COQLIBINSTALL)/MathClasses/$$i; \
	done

install-doc:
	install -d $(DSTROOT)$(COQDOCINSTALL)/MathClasses/html
	for i in html/*; do \
	 install -m 0644 $$i $(DSTROOT)$(COQDOCINSTALL)/MathClasses/$$i;\
	done

clean:
	rm -f $(VOFILES) $(VIFILES) $(GFILES) $(VFILES:.v=.v.d)
	rm -f all.ps all-gal.ps all.pdf all-gal.pdf all.glob $(VFILES:.v=.glob) $(VFILES:.v=.tex) $(VFILES:.v=.g.tex) all-mli.tex
	- rm -rf html mlihtml

archclean:
	rm -f *.cmx *.o


printenv:
	@$(COQBIN)coqtop -config
	@echo CAMLC =	$(CAMLC)
	@echo CAMLOPTC =	$(CAMLOPTC)
	@echo PP =	$(PP)
	@echo COQFLAGS =	$(COQFLAGS)

Makefile: Make
	mv -f $@ $@.bak
	$(COQBIN)coq_makefile -f $< -o $@


# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING
