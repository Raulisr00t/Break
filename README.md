# Understanding `break` in C at the Assembly Level

## Overview

This project explores how the `break` statement in C is translated and handled at the assembly level.

## Key Concepts

- **High-level keywords like `break` are not directly understood by the CPU.**
- The C compiler converts `break` into a conditional `jmp` instruction.
- The CPU executes low-level instructions such as `cmp` and `jmp`, not high-level control flow constructs.

## Compilation Flow

1. Preprocessor creates a `.i` file.
2. Compiler generates an `.asm` (assembly) file.
3. Assembler produces an object file (`.obj` or `.o`).
4. Linker combines object files into an executable (PE on Windows, ELF on Linux).

## Example Program

A simple `for` loop prints numbers from 0 to 9, but breaks at 5:

```c
for (int i = 0; i < 10; i++) {
    if (i == 5)
        break;
    printf("%d\n", i);
}
```

Assembly Insight
In the MASM output, break becomes:
```asm
cmp DWORD PTR i$1[rsp], 5
jne SHORT $LN5@main
jmp SHORT $LN3@main  ; This jump acts as the 'break'
```

$LN3@main Label
This label marks the end of the loop and function cleanup:
```asm
$LN3@main:
xor eax, eax        ; return 0
add rsp, 56         ; stack cleanup
ret 0
```

# Conclusion
The break keyword is compiled into basic instructions that manipulate control flow using jumps. Understanding this helps bridge the gap between high-level C code and low-level CPU execution.
