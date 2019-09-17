
LANG1=olo
BASENAME=apertium-$(LANG1)

TARGETS_COMMON =			\
	$(LANG1).automorf.hfst		\
	$(LANG1).autogen.hfst		\
	$(LANG1).rlx.bin

# This include defines goals for install-modes, .deps/.d, autobil.prefixes and .mode files:
@ap_include@

# -------------------
# Livvi analysis:
# -------------------

.deps/$(LANG1).automorf.hfst: $(AP_SRC)/apertium-und.olo-und.LR.att.gz .deps/.d
	$(ZCAT) $< | hfst-txt2fst > $@

$(LANG1).automorf.hfst: .deps/$(LANG1).automorf.hfst
	hfst-fst2fst -O -i $< -o $@

# -------------------
# Inari Saami generation:
# ---------------------

.deps/$(LANG1).autogen.hfst: $(AP_SRC)/apertium-olo.olo.RL.att.gz .deps/.d
	$(ZCAT) $< | hfst-txt2fst > $@

$(LANG1).autogen.hfst: .deps/$(LANG1).autogen.hfst
	hfst-fst2fst -O -i $< -o $@

$(LANG1).rlx.bin: $(BASENAME).$(LANG1).rlx $(CGCOMP)
	$(CGCOMP) $< $@

EXTRA_DIST=$(BASENAME).$(LANG1).lexc		\
		$(BASENAME).$(LANG1).acx	\
		$(BASENAME).$(LANG1).rlx	\
		modes.xml


apertium_olodir=$(prefix)/share/apertium/$(BASENAME)/
apertium_olo_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_olo_DATA=$(TARGETS_COMMON)

pkgconfigdir = $(prefix)/share/pkgconfig
pkgconfig_DATA = $(BASENAME).pc

noinst_DATA=modes/$(LANG1)-morph.mode

install-data-local: install-modes
	test -d $(DESTDIR)$(apertium_olo_srcdir) || mkdir -p $(DESTDIR)$(apertium_olo_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).lexc $(DESTDIR)$(apertium_olo_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).rlx $(DESTDIR)$(apertium_olo_srcdir)

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

###############################################################################
## Test
###############################################################################

test: all
	echo "TODO test sentence" | apertium -d olo-morph | tee .test-mt
	@echo "TODO test analysis results" > .test-ref
	@diff .test-ref .test-mt
	@rm .test-ref .test-mt

