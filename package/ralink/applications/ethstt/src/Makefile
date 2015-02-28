EXEC=ethstt
SRC=portstatus.c
all: $(EXEC)

$(EXEC): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SRC) $(LDLIBS)

clean:
	-rm -f $(EXEC) *.elf *.gdb *.o

