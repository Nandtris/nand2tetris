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

@SCREEN
D=A
@addr1 // addr1 = 16384
M=D
@addr2 // addr2 = 16384
M=D

@8191 // MAX SCREEN
D=A 
@max
M=D

@i1
M=0
@i2
M=0
(LOOP)
    @KBD
    D=M
    @CLEAR
    D;JEQ  // if RAM[KBD] == 0 goto CLEAR

    @FILL
    0;JMP  // if RAM[KBD] > 0 goto FILL

(FILL)
    @i1
    D=M
    @max
    D=D-M
    @RESET1
    D;JGT  // if i1 > max goto RESET1

    @addr1
    A=M
    M=-1  // RAM[addr1] = -1

    @addr1  // addr1 = addr1 + 1
    M=M+1
    @i1
    M=M+1
    @LOOP
    0;JMP  // goto LOOP


(CLEAR)
    @i2
    D=M
    @max
    D=D-M
    @RESET2
    D;JGT  // if i1 > max goto RESET2

    @addr2
    A=M
    M=0  // RAM[addr1] = 0

    @addr2  // addr2 = addr2+ 1
    M=M+1
    @i2
    M=M+1
    @LOOP
    0;JMP  // goto LOOP

(RESET1)
    @SCREEN
    D=A
    @addr1  // reset addr1
    M=D

    @i1
    M=0  // reset i1
    @LOOP
    0;JMP
 
(RESET2)
    @SCREEN
    D=A
    @addr2
    M=D

    @i2
    M=0
    @LOOP
    0;JMP 
