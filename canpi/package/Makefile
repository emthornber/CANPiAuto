################################################################################
#
#       18 July, 2022 - E M Thornber
#       Created
#
#	EVs required
#	BFILE - path to canpi executable
#	ODIR - where to place the .deb file
#
#	Workign directory is assumed to be ${CMAKE_CURRENT_SOURCE_DIR}
################################################################################

EPM=/usr/bin/epm
PKGNAME=canpi
PKGDEFN=$(PKGNAME).epm
RM=/bin/rm -f
TS=`date "+%y%m%d-%H%M"`

all: clean pkgs

clean:
	sudo $(RM) *.log

pkgs: portable deb

portable:
	sudo $(EPM) -a armhf -f portable -vv --output-dir $(ODIR) binary=$(BFILE) srcdir="./" $(PKGNAME) ./$(PKGDEFN) | tee portable-$(TS).log

deb:
	sudo $(EPM) -a armhf -f deb -vv --output-dir $(ODIR) binary=$(BFILE) srcdir="./" $(PKGNAME) ./$(PKGDEFN) | tee deb-$(TS).log
