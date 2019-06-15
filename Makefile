CPPFLAGS = -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600  # conform to SUSv3 (UNIX 03)
CFLAGS = -MMD -MF .$*.d -g -O3 -std=c11 -fPIC -Wall -Wextra -pedantic -Werror=pedantic
CXXFLAGS = -MMD -MF .$*.d -g -O3 -std=c++14 -fPIC -Wall -Wextra -pedantic -Werror=pedantic
LDFLAGS = -g -fPIC -fpie
LD = $(CC)

ifeq ($(shell $(CC) -dumpmachine | fgrep -q mingw && echo WIN32),WIN32)
EXEEXT = .exe
CPPFLAGS += -U__STRICT_ANSI__
endif

TARGETS ?= $(addsuffix $(EXEEXT),mcp example_player my_player)
SRC_mcp = mcp.c $(if $(wildcard mcp_state.c),mcp_state.c,mcp_state.S)
SRC_example = example_player.c
SRC_my = my_player.cc

SRC_all ?= $(SRC_mcp) $(SRC_example) $(SRC_my)
DEP_all = $(patsubst %,.%.d,$(basename $(SRC_all)))

.PHONY: all help demo run clean dist

all:: $(TARGETS)

mcp$(EXEEXT): $(addsuffix .o,$(basename $(SRC_mcp)))
example_player$(EXEEXT): $(addsuffix .o,$(basename $(SRC_example)))
my_player$(EXEEXT): $(addsuffix .o,$(basename $(SRC_my)))
my_player$(EXEEXT): LD=$(CXX)

help:
	@echo "The following make commands are available:"
	@echo "  $(MAKE) all   - builds everything"
	@echo "  $(MAKE) demo  - runs two of the example players against each other"
	@echo "  $(MAKE) run   - runs your own player against the example player"
	@echo "  $(MAKE) fight - runs two of your own player with resource limits"
	@echo "  $(MAKE) clean - removes all created files"

demo: $(addsuffix $(EXEEXT),mcp example_player example_player)
	./$+

run: $(addsuffix $(EXEEXT),mcp my_player example_player)
	./$+

fight: $(addsuffix $(EXEEXT),mcp my_player my_player)
	./$< -t 60 -T 61 -m 1024 -M 1024 $(filter-out $<,$+)

clean::
	rm -f $(TARGETS) $(wildcard *.o) $(DEP_all)

.S.o:
	$(CC) -c -o $@ $<

$(TARGETS):
	$(LD) $(LDFLAGS) -o $@ $^

# Rebuild everything when the Makefile or the compiler has changed.
$(wildcard *.o): Makefile $(shell which $(CC))

# Include dependency information.
-include $(DEP_all)
