# C Learning

## Setup
### IDE
- Went with VS Code (c/c++ extension) since IntelliJ recommends cLion, and I don't think I have a license for it.

### Compiler
A compiler is needed to run the code.
- Mac/Linux comes stock with gcc.
  - from command line: `gcc --version`
- clang is also a compiler
  - from command line: `clang --version`
- VSCode extension Code Runner allows you to pick either compiler and run the code from the IDE.

## C

### General Stuff
- C++ supports classes and objects. C does not.

### #include and #define
- `#include` is used to include header files.
  - `#include <stdio.h>` is used to include the standard input/output library. This allows the use of `printf()` and other useful functions.
- `#define` is used to define constants.

### Overflow

### Curiosities
- `printf("%i")` with no arguments prints a huge number which grows every time it's run.

## References
- Auckland guide: https://www.cs.auckland.ac.nz/~paul/C/Mac/
- Free Code Camp Guide: https://www.freecodecamp.org/news/how-to-write-and-run-c-cpp-code-on-visual-studio-code/
- Instructables.com guide (with errors): https://www.instructables.com/Your-First-Program-in-C-1/
  - Why I got a non-heap object error: https://www.codeproject.com/Questions/5312932/How-to-fix-warning-attempt-to-free-a-non-heap-obje