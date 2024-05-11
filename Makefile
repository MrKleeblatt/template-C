NAME=Main
IGNORE := $(shell mkdir -p ./out/objects/)

all: clear_console clean compile run

CC=clang
DEBUG=-g
COMPILE_FLAGS=-g --std=gnu2x -Wall -Wextra -Wpedantic -Werror
LINK_FLAGS=-lm

SOURCES=$(shell find ./src/ -name '*.c')
OBJECTS=$(addprefix ./out/objects/,$(SOURCES:./src/%.c=%.o))
HEADER_DIR=include/
STATIC_LIBS=


clear_console:
	@clear

clean:
	rm -f $(OBJECTS)
	rm -f ./out/$(NAME)

compile: link
link: $(OBJECTS)
	$(CC) $(COMPILE_FLAGS) $(LINK_FLAGS) -o ./out/$(NAME) $(OBJECTS) $(STATIC_LIBS)

# compile
./out/objects/%.o: ./src/%.c
	$(CC) $(COMPILE_FLAGS) -I$(HEADER_DIR) -c -o $@ $<

run:
	@echo
	@./out/$(NAME)
	@echo
