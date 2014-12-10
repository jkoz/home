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

	cp oauth2.sh oauth2

	cp -p {$(BINLST)} $(BINPREFIX)
	chmod 755 $(BINPREFIX)/{$(BINLST)}
	rm oauth2

uninstall:
	rm $(BINPREFIX)/{$(BINLST)}
clean:
	rm -rf *.sh
.PHONY: all install uninstall clean
