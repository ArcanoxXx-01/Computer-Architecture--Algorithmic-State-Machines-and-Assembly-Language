 %include "io.inc"

global main
main:
    ;write your code here
section .data
    n_a dd 6
    n_b dd 5
    arrayA dw 11, 89, 33, 90, 55 , 65
    arrayB dw 55, 33, 11, 44, 22 
    
section .text
global _start

_start:
    ; Cargar la longitud de los arreglos en eax
    mov ecx, [n_b]
    mov eax , 2
    mul ecx
    mov ebx , eax
    mov ecx, [n_a]   
    mov eax , 2
    mul ecx

    ; tenemos guardados en eax y ebx los valores de las long de los arrays A y B multiplicados por 4 para acceder a sus elementos
    mov ecx , 0

loop_compare:
    ; Cargar los elementos de A
    cmp ecx , eax
    je exit 
    mov si, [arrayA + ecx] 
    ; Verificar si el elemento de arrayA está presente en arrayB
    mov edx, 0  

search_in_arrayB:
    ; Cargar el elemento actual de arrayB   
    mov di,[ arrayB + edx]
    ; Comparar con el elemento de arrayA
    cmp si, di
    je found_element
    add edx , 2
    cmp edx , ebx
    je not_found_element    
    jmp search_in_arrayB    


not_found_element:
    ; Si no se encuentra el elemento en arrayB lo imprimimos en la salida
    PRINT_DEC 2 , si
    NEWLINE
    add ecx , 2
    jmp loop_compare

found_element:
    ; Marcar que se encontró el elemento
    add ecx ,2
    jmp loop_compare


exit:
    mov ecx , 0
    mov esi , 0
    
    

print_ArrayB:
    cmp ecx , ebx
    je return
    mov si , [arrayB + ecx]
    PRINT_DEC 2, si
    NEWLINE
    add ecx , 2
    jmp print_ArrayB


return:
ret

 
  