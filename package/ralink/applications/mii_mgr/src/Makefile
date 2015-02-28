EXEC=mii_mgr
SRC=mii_mgr.c

all: $(EXEC)
gpio: $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SRC) $(LDLIBS)

clean:
	-rm -f $(EXEC) *.elf *.gdb *.o

