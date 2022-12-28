#ifndef SYMBOLIZE_H
#define SYMBOLIZE_H

#ifdef SYMBOLIZED
#define SYM(x) x##_symbolized
#else
#define SYM(x) x
#endif

#endif // SYMBOLIZE_H