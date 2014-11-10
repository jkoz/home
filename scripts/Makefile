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
	cp -p {$(BINLST)} $(BINPREFIX)
	chmod 755 $(BINPREFIX)/{$(BINLST)}

uninstall:
	rm $(BINPREFIX)/{$(BINLST)}

.PHONY: all install uninstall
