org 100h
 
.MODEL SMALL
.STACK 100h
 
.DATA
    PROMPT1      DB 'Enter first number: $'
    PROMPT2      DB 0Dh,0Ah,'Enter second number: $'
    MSG_RESULT1  DB 0Dh,0Ah,'Result = ', '$'
    MSG_CLOSE    DB 0Dh,0Ah,'closed$', 0Dh,0Ah,'$'
 
    RESULT   DB ?         ; store result
    COUNT1   DB 0
 
.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax
 
 
    mov ah,09h
    lea dx, PROMPT1
    int 21h
 
    mov ah,01h     ; read char
    int 21h
    sub al, 30h    ; convert ASCII to number
    mov bl, al     ; store first number
 

    mov ah,09h
    lea dx, PROMPT2
    int 21h
 
    mov ah,01h
    int 21h
    sub al, 30h
    mov bh, al     ; store second number
 

    mov al, bl
    sub al, bh
    add al, 30h    ; convert to ASCII
    mov RESULT, al
 

PRINT_LOOP:
    mov ah,09h
    lea dx, MSG_RESULT1
    int 21h
 
    mov dl, RESULT
    mov ah,02h
    int 21h
 
    inc COUNT1
    cmp COUNT1, 5
    jl PRINT_LOOP
 

    mov ah,09h
    lea dx, MSG_CLOSE
    int 21h
 

    mov ah,4Ch
    int 21h
 
MAIN ENDP
END MAIN