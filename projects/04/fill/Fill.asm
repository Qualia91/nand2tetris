// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    @STATE
    M=0     // Set initial keyboard state as 0 (White)
(INPUTLOOP)  // Loop over user input
    @KBD
    D=M
    @SKIPSET
    D;JEQ    // If keyboard is 0, skip set
    D=-1     // Set current state = -1
(SKIPSET)
    @NEWSTATE
    M=D
    // check if screen state has changed
    @STATE
    D=D-M
    @END
    D;JEQ    // If same, skip to end
    // Set state
    @NEWSTATE
    D=M
    @STATE
    M=D
    // Reset pixels
    @8192
    D=A
    @PIXELS
    M=D
(SCREENLOOP) // Loop over pixels
    @PIXELS
    D=M
    @END
    D;JLT    // If pixels remaining is 0, end
    @SCREEN
    D=D+A
    @CURRENTPIXEL
    M=D
    @STATE
    D=M
    @CURRENTPIXEL
    A=M
    M=D      // Set current pixle to current state
    @PIXELS
    M=M-1    // Reduce PIXELS by 1
    @SCREENLOOP
    0;JMP    // Goto SCREENLOOP
(END)
    @INPUTLOOP
    0;JMP // Infinite loop