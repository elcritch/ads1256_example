
SUBDIRS = src/bcm2835 src/AD-DA src/ADS1256 src/DAC8532

all: clean $(SUBDIRS)
	cp -v src/*/*_test rootfs_overlay/usr/local/bin/
	chmod +x rootfs_overlay/usr/local/bin/*

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	@for d in $(SUBDIRS); do (cd $$d; $(MAKE) clean ); done

.PHONY: $(SUBDIRS)


