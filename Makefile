.PHONY: all clean

all: libc_symcc_preload.so libc_symcc_preload.a

bsearch.o: bsearch.c
	$(CXX) $(CFLAGS) -c -o $@ $<

qsort.o: qsort.c
	$(CXX) $(CFLAGS) -c -o $@ $<

libc_symcc_preload.so: bsearch.o qsort.o
	$(CXX) $(CFLAGS) -shared -o $@ $^

libc_symcc_preload.a: bsearch.o qsort.o
	ar rcs $@ $^

clean:
	rm -f *.o *.so *.a
