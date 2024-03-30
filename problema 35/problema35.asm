 %include "io.inc"

section .text
global main
main:
    ;write your code here  
section .data
    n_a dd 5
    n_b dd 5
    array1 dw 11, 22, 33, 44, 55
    array2 dw 55, 33, 11, 44, 22 
    
section .text
    global _start

_start:
    ; Cargar la longitud de los arreglos (en palabras) en eax
    xor eax, eax
    mov eax, [n_a]
    xor ecx , ecx
    mov ecx, [n_b]
    cmp eax, ecx
    jne exit
    ; Inicializar el índice en 0
    mov eax , 2
    mul ecx
    mov ebx , 0
    cmp ebx , eax
    je equal_arrays

while:
    ; Cargar los elementos de array1 y array2
    mov si, [array1 + ebx]
    
    ; Verificar si el elemento de array1 está presente en array2
    mov edx, 0    ; Bandera para indicar si se encuentra el elemento

search_in_array2:
    ; Cargar el elemento actual de array2
    
    mov di,[ array2+ edx]

    ; Comparar con el elemento de array1
    cmp si, di
    je found_element
    add edx , 2
    cmp edx , eax
    je not_found_element    
    jmp search_in_array2    


not_found_element:
    ; Si no se encuentra el elemento en array2, salir
    jmp exit

found_element:
    ; Marcar que se encontró el elemento
    add ebx ,2  
    cmp ebx, eax
    je equal_arrays
    jmp while

equal_arrays:
    ; Devolver 1 (son iguales)
    mov eax, 1
    mov ebx, 0
    PRINT_STRING 'Son Iguales'  
    ret   
    
exit:
    ; Devolver 0 (no son iguales)
    mov eax, 0
    mov ebx, 0
    PRINT_STRING 'NO son iguales'
    ret
    
 
