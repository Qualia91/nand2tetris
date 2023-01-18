// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
    @R2    // Set A=R2
    M=0    // Initialise sum
(LOOP)
    @R1    // Set A=R1
    D=M    // Set D=M[R1], the multiplier
    @END   // Set A=END
    D;JLE  // If R1 is less than or equal to 0, jump to end
    @R2    // Set A=R2
    D=M    // Set D=M[R2], ie current sum
    @R0    // Set A=R0
    D=D+M  // Add R0 onto current sum
    @R2    // Set A=R2
    M=D    // Set sum variable
    @R1    // Set A=R1
    D=M-1  // Reduce multipler by 1
    M=D    // Set new multipler variable
    @LOOP
    0;JMP // Goto LOOP
(END)
    @END
    0;JMP // Infinite loop