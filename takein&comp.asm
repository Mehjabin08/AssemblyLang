                                           .model small 

.stack 100h 

.data 

    msg1 db "First Digit: $" 

    msg2 db 0Dh,0Ah, "Second Digit: $" 

    newline db 0Dh,0Ah, "$" 

    greaterMsg db " is greater than $" 

.code 

main proc 

    mov ax, @data 

    mov ds, ax 

 

    ; ------------------------- 

    ; Input first digit 

    ; ------------------------- 

    mov dx, offset msg1 

    mov ah, 09h 

    int 21h 

 

    mov ah, 01h        ; Read first digit 

    int 21h 

    mov bl, al 

    sub bl, 30h        ; ASCII ? number 

 

    ; New line 

    mov dx, offset newline 

    mov ah, 09h 

    int 21h 

 

    ; ------------------------- 

    ; Input second digit 

    ; ------------------------- 

    lea dx, msg2 

    mov ah, 09h 

    int 21h 

 

    mov ah, 01h 

    int 21h 

    mov cl, al 

    sub cl, 30h 

 

    ; New line 

    mov dx, offset newline 

    mov ah, 09h 

    int 21h 

 

    ; ------------------------- 

    ; Compare digits 

    ; ------------------------- 

    cmp bl, cl 

    jg first_is_greater 

    jl second_is_greater 

    je equal_case 

 

first_is_greater: 

    add bl, 30h        ; number ? ASCII 

    mov dl, bl 

    mov ah, 02h 

    int 21h 

 

    mov dx, offset greaterMsg 

    mov ah, 09h 

    int 21h 

 

    add cl, 30h 

    mov dl, cl 

    mov ah, 02h 

    int 21h 

 

    jmp exit 

 

second_is_greater: 

    add cl, 30h 

    mov dl, cl 

    mov ah, 02h 

    int 21h 

 

    mov dx, offset greaterMsg 

    mov ah, 09h 

    int 21h 

 

    add bl, 30h 

    mov dl, bl 

    mov ah, 02h 

    int 21h 

 

    jmp exit 

 

equal_case: 

    mov dx, offset newline 

    mov ah, 09h 

    int 21h 

    mov dx, offset newline 

    mov ah, 09h 

    int 21h 

 

exit: 

    mov ah, 4Ch 

    int 21h 

main endp 

end main 