#SECCIÓN DE DATOS
.section .data 
lista:
.int 1,2,3,1,2,3,1,2,3
longlista:
.int 9
resultado:
.quad 0

#SECCIÓN CON EL CÓDIGO
.section .text 
.globl _start
_start: 
	.intel_syntax noprefix
push longlista 
push offset lista
call Suma 
add esp,8 
mov resultado, edx 
mov eax,1
mov eax,[ebx]
int 0x80 

.type Suma,@function
Suma:
push ebp 
mov ebp,esp
push ebx 
mov ebx,[ebp+8] 
mov ecx,[ebp+12] 
xor eax,eax
xor edx,edx
repetir:

add eax,[ebx+edx*4]
adc esi,0
cdq #Realizamos una conversión de tipos de 32 bits a 64 bits
mov eax,[ebx]
add edi,eax
adc esi,edx

add edx,1
cmp edx,ecx
jl repetir 
pop ebx
pop ebp
ret 
