PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

.PHONY: all install uninstall

all:
	@echo "Run 'sudo make install' to install linsanity into $(BINDIR)."

install:
	@install -d $(DESTDIR)$(BINDIR)
	@install -m 755 bin/linsanity $(DESTDIR)$(BINDIR)/linsanity
	@echo "[+] linsanity successfully installed to $(DESTDIR)$(BINDIR)/linsanity"

uninstall:
	@rm -f $(DESTDIR)$(BINDIR)/linsanity
	@echo "[-] linsanity removed from $(DESTDIR)$(BINDIR)/linsanity"
