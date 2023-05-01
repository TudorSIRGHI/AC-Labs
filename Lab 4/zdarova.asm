section .text                   ; Declaratia sectiunii, in cazul dat text

global  _start                 ; Punctul de inceput al programului

_start:

    mov     edx,len             ; Lungimea la mesaj
    mov     ecx,msg             ; Adresa mesajuluiprinted
    mov     ebx,1               ; Descriptia pentru 'stdout'
    mov     eax,4               ; Apel la sistem pentru 'write'
    int     0x80                ; Declanseaza sistemul pentru apelarea printarii mesajului

    mov     ebx,0               ; Return 0
    mov     eax,1               ; apel la sistem pentru 'exit'
    int     0x80                ; Declanseaza sistemul pentru apelarea iesirii programului

section .data                   ; Sectiunea data pentru declaratie

msg db      "Hello World!",0xa ; Declararea sirului de mesaj pentru printarea acestuia
len equ     $ - msg             ; Obtinerea lungimii mesajului
