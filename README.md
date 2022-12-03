# symcc_libc_preload
Implementation of `qsort` and `bsearch` to compile with symcc and LD_PRELOAD over libc to avoid symcc crashing.

`symcc` does not (and cannot) support calling uninstrumented functions (e.g. in libc) with callbacks in instrumented code. If this happens,
the instrumented callback will assume it was called from instrumented code with the symbolic state setup correctly, but because the calling function
is uninstrumented, it will access stale symbolic arguments (and a myriad of things can happen).

Since `libc++` is expected to be compiled with symcc, the only really common offenders are in libc (which is usually dynamically linked in).
Since this issue affects only functions that take callback functions as arguments, the only two offenders i've seen so far are `bsearch` and `qsort`.
