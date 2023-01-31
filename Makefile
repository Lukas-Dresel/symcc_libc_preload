.PHONY: all clean

all: libc_symcc_preload.so libc_symcc_preload.a

bsearch.o: bsearch.c
	$(CC) $(CFLAGS) -c -o $@ $<

qsort.o: qsort.c
	$(CC) $(CFLAGS) -c -o $@ $<

libc_symcc_preload.so: bsearch.o qsort.o
	$(CC) $(CFLAGS) -shared -o $@ $^

libc_symcc_preload.a: bsearch.o qsort.o
	ar rcs $@ $^

clean:
	rm -f *.o *.so *.a
