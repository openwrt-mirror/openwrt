EXEC = ated
SRCS = ated.c

#EXTRA_CFLAGS += -DDBG

all: $(EXEC)

$(EXEC): $(SRCS) 
	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(LDFLAGS) -o $@ $@.c $(LDLIBS)

clean:
	-rm -f $(EXEC) *.o

