section .data
    prompt db "Enter your choice (1-10): ", 0
    newline db 10, 0
    invalid_choice db "Invalid choice. Try again.", 0
    choice_format db "%d", 0
    string1 db 100, 0
    string2 db 100, 0
    num1 dq 0
    num2 dq 0

section .text
    global _start
    
_start:
    ; Print the menu
    mov eax, 4
    mov ebx, 1
    mov ecx, menu
    mov edx, menu_len
    int 0x80
    
    ; Prompt the user for their choice
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80
    
    ; Read in the user's choice
    mov eax, 3
    mov ebx, 0
    mov ecx, choice_buffer
    mov edx, choice_buffer_len
    int 0x80
    
    ; Convert the choice to an integer
    mov eax, choice_buffer
    mov ebx, 10
    xor edx, edx
    call strtol
    mov ebx, eax
    
    ; Check if the choice is valid
    cmp ebx, 1
    jl invalid_choice
    cmp ebx, 10
    jg invalid_choice
    
    ; Execute the chosen process
    cmp ebx, 1
    je replace_character
    cmp ebx, 2
    je check_palindrome
    cmp ebx, 3
    je delete_character
    cmp ebx, 4
    je generate_random
    cmp ebx, 5
    je sum_of_n_primes
    cmp ebx, 6
    je multiply_numbers
    cmp ebx, 7
    je add_numbers
    cmp ebx, 8
    je concatenate_strings
    cmp ebx, 9
    je add_character
    cmp ebx, 10
    je circle_perimeter
    
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
    
replace_character:
    ; Prompt the user for a string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_string1
    mov edx, input_string1_len
    int 0x80
    
    ; Read in the user's string
    mov eax, 3
    mov ebx, 0
    mov ecx, string1
    mov edx, string1_len
    int 0x80
    
    ; Prompt the user for a character to replace
    mov eax, 4
    mov ebx, 1
    mov ecx, input_char
    mov edx, input_char_len
    int 0x80
    
    ; Read in the user's character
    mov eax, 3
    mov ebx, 0
    mov ecx, input_char_buffer
    mov edx, input_char_buffer_len
    int 0x80
    
    ; Replace the character in the string
    mov eax, string1
    mov ebx, input_char_buffer
    call replace_char
    
    ; Print the modified string
    mov eax, 4
    mov ebx, 1
    mov ecx, output_string
    mov edx, output_string_len
    int 0x80
    
    ; Exit the program
    mov eax
    xor ebx, ebx
    int 0x80

check_palindrome:
    ; Prompt the user for a string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_string1
    mov edx, input_string1_len
    int 0x80
    ; Read in the user's string
    mov eax, 3
    mov ebx, 0
    mov ecx, string1
    mov edx, string1_len
    int 0x80

    ; Check if the string is a palindrome
    mov eax, string1
    call is_palindrome
    cmp eax, 1
    je is_palindrome_true

    ; Print that the string is not a palindrome
    mov eax, 4
    mov ebx, 1
    mov ecx, output_not_palindrome
    mov edx, output_not_palindrome_len
    int 0x80

    ; Exit the program
    xor ebx, ebx
    int 0x80
    is_palindrome_true:
    ; Print that the string is a palindrome
    mov eax, 4
    mov ebx, 1
    mov ecx, output_palindrome
    mov edx, output_palindrome_len
    int 0x80

    ; Exit the program
    xor ebx, ebx
    int 0x80

delete_character:
    ; Prompt the user for a string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_string1
    mov edx, input_string1_len
    int 0x80
    ; Read in the user's string
    mov eax, 3
    mov ebx, 0
    mov ecx, string1
    mov edx, string1_len
    int 0x80

    ; Prompt the user for a character to delete
    mov eax, 4
    mov ebx, 1
    mov ecx, input_char
    mov edx, input_char_len
    int 0x80

    ; Read in the user's character
    mov eax, 3
    mov ebx, 0
    mov ecx, input_char_buffer
    mov edx, input_char_buffer_len
    int 0x80

    ; Delete the character from the string
    mov eax, string1
    mov ebx, input_char_buffer
    call delete_char

    ; Print the modified string
    mov eax, 4
    mov ebx, 1
    mov ecx, output_string
    mov edx, output_string_len
    int 0x80

    ; Exit the program
    xor ebx, ebx
    int 0x80

generate_random:
    ; Generate a random number
    call random
    ; Print the random number
    mov eax, 1
    mov ebx, 1
    mov ecx, num1
    mov edx, 8
    call print_number

    ; Exit the program
    xor ebx, ebx
    int 0x80
    
sum_of_n_primes:
    ; Prompt the user for a number
    mov eax, 4
    mov ebx, 1
    mov ecx, input_number
    mov edx, input_number_len
    int 0x80
    ; Read in the user's number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Calculate the sum of n even prime numbers
    mov eax, num1
    call sum_of_n_primes

    ; Print the sum
    mov eax, 1
    mov ebx, 1
    mov ecx, num1
    mov edx, 8
    call print_number

    ; Exit the program
    xor ebx, ebx
    int 0x80

multiply_numbers:
    ; Prompt the user for two numbers
    mov eax, 4
    mov ebx, 1
    mov ecx, input_number1
    mov edx, input_number1_len
    int 0x80
    ; Read in the user's first number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Prompt the user for the second number
    mov eax, 4
    mov ebx, 1
    mov ecx, input_number2
    mov edx, input_number2_len
    int 0x80

    ; Read in the user's second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Multiply the two numbers
    mov eax, num1
    mov ebx, num2
    call multiply

    ; Print the result
    mov eax, 1
    mov ebx, 1
    mov ecx, num1
    mov edx, 16
    call print_number

    ; Exit the program
    xor ebx, ebx
    int 0x80

add_numbers:
    ; Prompt the user for two numbers
    mov eax, 4
    mov ebx, 1
    mov ecx, input_number1
    mov edx, input_number1_len
    int 0x80
    ; Read in the user's first number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Prompt the user for the second number
    mov eax, 4
    mov ebx, 1
    mov ecx, input_number2
    mov edx, input_number2_len
    int 0x80

    ; Read in the user's second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Add the two numbers
    mov eax, num1
    mov ebx, num2
    call add

    ; Print the result
    mov eax, 1
    mov ebx, 1
    mov ecx, num1
    mov edx, 16
    call print_number

    ; Exit the program
    xor ebx, ebx
    int 0x80

concatenate_strings:
    ; Prompt the user for two strings
    mov eax, 4
    mov ebx, 1
    mov ecx, input_string1
    mov edx, input_string1_len
    int 0x80
    ; Read in the user's first string
    mov eax, 3
    mov ebx, 0
    mov ecx, string1
    mov edx, string1_len
    int 0x80

    ; Prompt the user for the second string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_string2
    mov edx, input_string2_len
    int 0x80

    ; Read in the user's second string
    mov eax, 3
    mov ebx, 0
    mov ecx,
    string2
    mov edx, string2_len
    int 0x80

    ; Concatenate the two strings
    mov eax, string1
    mov ebx, string2
    call concatenate

    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, string1
    mov edx, 32
    int 0x80

    ; Exit the program
    xor ebx, ebx
    int 0x80

add_char_to_string:
    ; Prompt the user for a string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_string1
    mov edx, input_string1_len
    int 0x80
    ; Read in the user's string
    mov eax, 3
    mov ebx, 0
    mov ecx, string1
    mov edx, string1_len
    int 0x80

    ; Prompt the user for a character
    mov eax, 4
    mov ebx, 1
    mov ecx, input_char1
    mov edx, input_char1_len
    int 0x80

    ; Read in the user's character
    mov eax, 3
    mov ebx, 0
    mov ecx, char1
    mov edx, 1
    int 0x80

    ; Add the character to the string
    mov eax, string1
    mov ebx, char1
    call add_char

    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, string1
    mov edx, 16
    int 0x80

    ; Exit the program
    xor ebx, ebx
    int 0x80

calculate_circle_perimeter:
    ; Prompt the user for the radius of the circle
    mov eax, 4
    mov ebx, 1
    mov ecx, input_number1
    mov edx, input_number1_len
    int 0x80
    ; Read in the user's radius
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Calculate the perimeter of the circle
    mov eax, num1
    call calculate_perimeter

    ; Print the result
    mov eax, 1
    mov ebx, 1
    mov ecx, num1
    mov edx, 16
    call print_number

    ; Exit the program
    xor ebx, ebx
    int 0x80

