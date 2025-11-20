                                          .model small
.stack 100h

.data
    num1      db 8
    num2      db 3
    result    db ?

    msgResult db 'Result = $'
    msgClosed db 'CLOSED$'

.code
main proc

    ; initialize data segment
    mov ax, @data
    mov ds, ax


    ; ---------- SUBTRACT ----------
    mov al, num1
    sub al, num2
    mov result, al


    ; ---------- SHOW "Result = " ----------
    mov dx, offset msgResult
    mov ah, 09h
    int 21h

    ; show result once
    mov al, result
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; newline
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h


    ; ---------- PRINT RESULT 5 TIMES ----------
    mov cx, 5    ; loop counter

print_loop:

    ; print result only (no text)
    mov al, result
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; newline
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h

    loop print_loop


    ; ---------- PRINT "CLOSED" ----------
    mov dx, offset msgClosed
    mov ah, 09h
    int 21h


    ; ---------- EXIT ----------
    mov ah, 4Ch
    int 21h

main endp
end main