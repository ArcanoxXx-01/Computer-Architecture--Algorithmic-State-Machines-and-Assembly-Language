 %include "io.inc"
 
global main
main:
    ;write your code here
section .data
    n dd 3
    m dd 2
    A dw 0,1,2,3,4,5
    V dw 4,5
    
section .text
global _start

_start: 
    ;puntero para iterar por la matriz A
    mov ebx , 0
    ;puntero para iterar por el vector V
    mov esi , 0
    ;registros para calcular el producto de A*V
    xor ecx , ecx
    xor eax , eax
    xor edi , edi
    
while:
    mov ecx ,[A + ebx]
    mov eax ,[V + esi]
    mul ecx  ; se guarda en eax el producto 
    add esi , 2 ; aumento el puntero de V
    add ebx , 2 ; aumento el puntero A
    add edi , eax ; aqui llevare la suma de los productos en edi
    mov eax , [m] 
    mov ecx , 2
    mul ecx
    mov edx, eax ; actualizo el valor real de edx= m*2
    cmp esi , edx ; comparo si termine de iterar por el vector
    je equals 
    jmp while  
    
    
equals:
    mov esi , 0
    PRINT_DEC 2 , edi ; printeo el valor de una de las componentes del vector resultante
    NEWLINE 
    mov edi , 0    
    mov ecx , [n]
    mul ecx    ; se guarda en eax m*n*2
    cmp eax , ebx ; comparo si termine de iterar por el array A 
    je exit
    jmp while
    
exit:
    ret