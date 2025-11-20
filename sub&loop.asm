                              .model small
.stack 100h

.data
    first_digit db 8       ; Store the first digit (8)
    second_digit db 3      ; Store the second digit (3)
    result db 'result = 5$', 0  ; Store the string "result = 5$" for printing

.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Subtract the second digit (3) from the first digit (8)
    mov al, [first_digit]   ; Load the first digit (8) into AL
    sub al, [second_digit]   ; Subtract the second digit (3) from AL (AL = AL - 3)
    mov bl, al              ; Store the result (5) in BL (result of subtraction)

    ; Initialize counter for the loop
    mov cx, 5               ; Set counter to 5 (this will be used for repeating output)

print_loop:
    ; Output the result string ("result = 5")
    mov ah, 09h             ; DOS function to display a string
    lea dx, result          ; Load effective address of "result = 5$" string into DX
    int 21h                 ; Call DOS interrupt to print the string

    ; Move to next line after each print
    mov ah, 02h
    mov dl, 0Ah             ; Line feed (new line character)
    int 21h

    mov ah, 02h
    mov dl, 0Dh             ; Carriage return (return to beginning of line)
    int 21h

    ; Decrement the counter and jump if it's not zero
    dec cx                   ; Decrement CX by 1
    jnz print_loop           ; Jump back to print_loop if CX is not zero

    ; Exit the program
    mov ah, 4Ch             ; DOS function to terminate program
    int 21h
end main