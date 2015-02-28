EXEC=btnd  
SRC=btnd.c

all: $(EXEC)
btnd: $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SRC) $(LDLIBS)

clean:
	-rm -f $(EXEC) *.elf *.gdb *.o

