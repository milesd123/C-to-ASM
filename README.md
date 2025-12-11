Converted the basic C functions into their _ASM_ replications:

1. `uint8_t cStringLengthAlgorithm(const char aString[])`: Compute the length a C-style string by using a loop to search for the sentinel(0x00) value.
2. `void cSumArrays(uint8_t *a, uint8_t *b, uint8_t *c, byte length)`: Add arrays a and b together, placing the result in c.
3. `uint16_t cDot(uint8_t *a, uint8_t *b, byte length)`: Computes the dot product of those arrays using pointers.

Also implemented the basic global variable loading functions in ASM:

1. `void updateGlobal(uint8_t a)`: Adds the given value to a global variable.
2. `uint8_t getGlobal()`: Returns the current value of the global variable.


