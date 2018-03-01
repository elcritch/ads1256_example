
SUBDIRS = src/bcm2835 src/AD-DA src/ADS1256 src/DAC8532

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	@for d in $(SUBDIRS); do (cd $$d; $(MAKE) clean ); done

.PHONY: $(SUBDIRS)


