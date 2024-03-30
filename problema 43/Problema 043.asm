 %include "io.inc"
global main
main:
    ;write your code here
section .data
    ;cantidad de filas
    n dd 6
    ; cantidad de columnas
    m dd 2
    ;escalar
    k dw 3
    ;matriz
    array dw 11, 89, 33, 90, 55 , 65 , 1 , 2 , 3 , 4 , 5 ,6
    
section .text
global _start

_start:
    mov ecx , [m]
    mov eax , 2
    mul ecx  
    mov edx , eax   ; se guarda en edx m*2
    mov ecx , [n]
    mul ecx    
    mov edi , eax  ; se guarda en edi m*n*2
    mov ebx , 0 ; puntero para iterar por la matriz
    mov esi , 0 ; puntero para iterar por las columnas de la matriz
    xor ecx , ecx
    xor eax , eax


while:  
     mov cx , [array + ebx] 
     mov ax , [k] 
     mul cx
     PRINT_DEC 2 , ax ; printeo el elemento de la matriz multiplicado por k
     PRINT_STRING " "
     add ebx , 2 ; aumento los punteros
     add esi , 2
     mov eax , [m]
     mov ecx , 2
     mul ecx ; guardo en eax m*2 para saber cuando debo printear salto de linea
     cmp edi , ebx
     je exit   ; termine de iterar por la matriz
     cmp esi , eax 
     je equals   ; si son iguales printeo salto de linea   
     PRINT_STRING ", "  ; si no printeo coma   
     jmp while 
    
equals:
     mov esi , 0 ; actualizo el puntero de las columnas en 0
     NEWLINE
     jmp while   
   
exit:
     ret      
          