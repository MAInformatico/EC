#SECCIÓN DE DATOS
.section .data 
lista:
	.int 4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295
longlista:
	.int 32
resultado:
	.quad 0 #Directiva cambiada para poder almacenar los datos mayores de 32 bits

#SECCIÓN CON EL CÓDIGO
.section .text 
.globl _start
_start: 
	.intel_syntax noprefix
	push longlista 
	push offset lista
	call Suma 
	add esp,8 
	mov resultado, eax 
	
	mov eax,1 

	mov ebx,0 

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
	adc esi,0 #Realizamos la suma con acarreo que nos pide el problema
	add edx,1 
	cmp edx,ecx 
	jl repetir 
	
	pop ebx 

	pop ebp 
	ret 
