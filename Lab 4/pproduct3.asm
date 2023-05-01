section .data
    msg db "The products of 3 or 3 is: "  ; define a string message to print
    len equ $ - msg                     ; calculate the length of the message
    
section .bss
    res resb 1                          ; define a byte variable to store the result
    
section .text
    global _start                       ; make the _start label visible to the linker
_start:
    ; Multiply 2 and 3 together
    mov eax, 3                          ; move the value 2 to the eax register
    mov ebx, 3                          ; move the value 3 to the ebx register
    mul ebx                             ; multiply the values in eax and ebx, storing the result in eax
    
    ; Convert the result to ASCII
    add al, '0'                         ; convert the result to an ASCII character
    mov [res], al                       ; store the ASCII character in the res variable
    
    ; Print the result
    mov edx, len                        ; move the length of the message to the edx register
    mov ecx, msg                        ; move the address of the message to the ecx register
    mov ebx, 1                          ; move the file descriptor (stdout) to the ebx register
    mov eax, 4                          ; move the system call number for "write" to the eax register
    int 0x80                            ; execute the system call to print the message
    
    mov edx, 1                          ; move the length of the result to the edx register
    mov ecx, res                        ; move the address of the result to the ecx register
    mov ebx, 1                          ; move the file descriptor (stdout) to the ebx register
    mov eax, 4                          ; move the system call number for "write" to the eax register
    int 0x80                            ; execute the system call to print the result
    
    ; Iesirea din program
    mov ebx, 0                          ; move the exit code to the ebx register
    mov eax, 1                          ; move the system call number for "exit" to the eax register
    int 0x80                            ; execute the system call to exit the program


