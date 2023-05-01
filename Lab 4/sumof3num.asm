section .data
    prompt db " Enter a number: ", 0
    sum_prompt db " The sum is: ", 0
section .bss
    num1 resb 2
    num2 resb 2
    num3 resb 2
section .text
    global _start
_start:
    ; Prompt for the first number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 16
    int 0x80
    
    ; Read the first number from stdin
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80
    
    ; Prompt for the second number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 16
    int 0x80
    
    ; Read the second number from stdin
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80
    
    ; Prompt for the third number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 16
    int 0x80
    
    ; Read the third number from stdin
    mov eax, 3
    mov ebx, 0
    mov ecx, num3
    mov edx, 2
    int 0x80
    
    ; Convert the first number from ASCII to integer
    mov eax, 0
    mov al, [num1]
    sub eax, 48
    mov ebx, eax
    
    ; Convert the second number from ASCII to integer
    mov eax, 0
    mov al, [num2]
    sub eax, 48
    add ebx, eax
    
    ; Convert the third number from ASCII to integer
    mov eax, 0
    mov al, [num3]
    sub eax, 48
    add ebx, eax
    
    ; Convert the sum to ASCII
    add ebx, 48
    mov [num1], bl
    
    ; Prompt for the sum
    mov eax, 4
    mov ebx, 1
    mov ecx, sum_prompt
    mov edx, 13
    int 0x80
    
    ; Write the sum to stdout
    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx, 2
    int 0x80
    
    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
