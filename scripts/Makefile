PREFIX    ?= /usr/local
BINPREFIX  = $(PREFIX)/bin

SRC = $(wildcard *)
BIN = $(basename $(SRC))

comma  = ,
empty  =
space  = $(empty) $(empty)
BINLST = $(subst $(space),$(comma),$(BIN))

$(BIN):
	echo "No build"

all: $(BIN)

install:
	mkdir -p $(BINPREFIX)
	install -Dm755 preview $(BINPREFIX)
	install -Dm755 getwindowinfo $(BINPREFIX)
	install -Dm755 exterm $(BINPREFIX)
	install -Dm755 exbrowser $(BINPREFIX)
	install -Dm755 exdict $(BINPREFIX)
	install -Dm755 expdf $(BINPREFIX)
	install -Dm755 surf-tabbed $(BINPREFIX)
	install -Dm755 zathura-tabbed $(BINPREFIX)
	install -Dm755 newpost $(BINPREFIX)

uninstall:
	rm -f $(BINPREFIX)/preview
	rm -f $(BINPREFIX)/getwindowinfo
	rm -f $(BINPREFIX)/exterm
	rm -f $(BINPREFIX)/exbrowser
	rm -f $(BINPREFIX)/exdict
	rm -f $(BINPREFIX)/expdf
	rm -f $(BINPREFIX)/surf-tabbed
	rm -f $(BINPREFIX)/zathura-tabbed
	rm -f $(BINPREFIX)/newpost

clean:
	rm -rf *.sh
.PHONY: all install uninstall clean
