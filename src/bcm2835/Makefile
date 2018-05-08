
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)

.PHONY: all clean

DEFAULT_TARGETS = libbcm2835.a

CFLAGS += -g -O2 -Wall -Wextra -Wno-unused-parameter -Wstrict-aliasing -Wformat-security

LDFLAGS +=
CFLAGS += -fPIC -I. -Igfx -Iwiring_bone
CDEFINES +=

all: $(DEFAULT_TARGETS)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CDEFINES) -o $@ $<

libbcm2835.a: $(OBJ)
	ar -cvq $@ $^

clean:
	rm -f *.o $(DEFAULT_TARGETS)

