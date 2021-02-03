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

// Peseudo code:

// addr = SCREEN
// n = MaxSCREEN
// i = 0
// (LOOP)
//    if KBD == 0: value = 0
//    else: value = -1
//    if i > n goto RESET
//    RAM[addr] = value
//    addr += 1
//    i += 1
//    goto LOOP
// (RESET)
//    i = 0
//    addr = SCREEN
//    goto LOOp

@SCREEN
D=A
@addr
M=D  // addr = 16384

@8191  // 8K Screen Map 
D=A
@n
M=D

@i
M=0
(LOOP)
    @KBD
    D=M
    @V1
    D;JEQ  // if KBD == 0 goto V1

    @V2
    D;JMP  // if KBD > 0 goto V2

(V1)
    @R0
    D=A
    @value
    M=D  // if KBD == 0 then value = 0
    @MAIN
    0;JMP
(V2)
    @R1
    M=-1
    @R1
    D=M
    @value
    M=D  // value = -1
    @MAIN
    0;JMP 

(RESET)
    @SCREEN
    D=A
    @addr
    M=D  // reset addr
    @i
    M=0  // reset i
    @LOOP
    0;JMP

(MAIN)
    @i
    D=M
    @n
    D=D-M
    @RESET
    D;JGT  // if i > n goto RESET

    @value
    D=M
    @addr
    A=M
    M=D  // RAM[addr] = value(0, -1)

    @i
    M=M+1
    @addr
    M=M+1  // addr = addr + 1
    @LOOP
    0;JMP
