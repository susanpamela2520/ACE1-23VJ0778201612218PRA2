;--------------------------------------------------------------
;-----------------------macros generales-----------------------
;--------------------------------------------------------------
cadenaToSword2 macro texto,var	
    LOCAL buclerecorrercadena,FinalC

    mov var,00h
    mov si,2d
    dec si; esto decrementa para que no se pase el indice, el tamaño es mayor al indice
    xor ax,ax   ; ESTA ES LA VARIABLE TEMPORAL
    mov bx,1; inicio el multiplicador en 1
    
    buclerecorrercadena:;recorre la cadena desde laultima posicino hasta la primera    
        mov al,texto[si] ;temporal = entrada[i]
        sub ax,030h ; temporal = temporal - 48
        mul bx; multiplica el valor de la cadena en un espacio por el multiplicador y la coloca bx ; temporal = temporal * multiplicador
        add var, ax; binario+=bx    ; entero = enterio + temporal
        mov ax,0Ah ;incrementar el multiplicador en 10    
        mul bx
        mov bx,ax
        cmp si,00h
        je FinalC
        xor ax,ax
        dec si ; decrementa el contador de la variable    
        jmp buclerecorrercadena
    FinalC:
    
endm

Num2str macro numero,stringvar 
	local cNumerador,Convertir 
	push si
    push ax
    push bx
    push dx
    mov contadorfecha,0d
    xor si,si
    mov bx,10d
    mov ax,numero
    cNumerador:
        xor dx,dx
        div bx
        push dx
        inc contadorfecha
        cmp ax,0
        jne cNumerador
    mov si,offset stringvar
    Convertir:
        pop dx
        add dx,48d
        mov [si],dx
        inc si
        dec contadorfecha
        cmp contadorfecha,0
        jne Convertir
    pop dx
    pop bx
    pop ax
    pop si
endm

Fecha macro
    xor bx,bx
	mov ah,2ah
	int 21H
	mov literalanio,cx
	mov literalmes,dh
	mov literaldia,dl
endm

Hora macro 
    xor bx,bx
	mov ah,02ch
	int 21H
	mov literalhora,ch
	mov literalminuto,cl
	mov bl,dh
endm

Sword2Tocadena macro var,texto	
    LOCAL buclerecorrercadena,FinalC

    xor dx,dx
    mov cx, var
    mov ax,cx
    mov bx,10d
    div bx
    add ax,48d
    add dx,48d

    mov texto[0],al
    mov texto[1],dl
    
endm

getPass macro 
    mov ah,07h
    int 21h
endm

validarMayusculasNumero macro numbytes,array 
    LOCAL mfin,mstart,v1,v2,v3,v4,v5,v6
    xor si,si
    mov di,numbytes
    mov validar1,0b

    mstart:
        cmp si,di
        je mfin
        
        EsMayuscula array[si]
        cmp validarEsMayuscula,0b
        je v2

        EsNumero array[si]
        cmp validarEsNumero,0b
        je v2
        jmp v3

        v2:
        inc si
        jmp mstart

        v3:
        mov  al,array[si]
        cmp al,'$'
        je v2

        mov validar1,1b
        println msgErrorMayusculaNumero
        printChar array[si]
        printChar 10d

    mfin:
endm	

validarNumero macro numbytes,array	
    LOCAL mfin,mstart,v1,v2,v3,v4,v5,v6
    xor si,si
    mov di,numbytes
    mov validar1,0b

    mstart:
        cmp si,di
        je mfin
        
        EsNumero array[si]
        cmp validarEsNumero,0b
        je v2

        jmp v3

        v2:
        inc si
        jmp mstart

        v3:
        mov  al,array[si]
        cmp al,'$'
        je v2

        mov validar1,1b
        println msgErrorNumero
        printChar array[si]
        printChar 10d

    mfin:
endm	

validarMayusculasMinusculaNumeroSimbolo macro numbytes,array	 
    LOCAL mfin,mstart,v1,v2,v3,v4,v5,v6
    xor si,si
    mov di,numbytes
    mov validar1,0b

    mstart:
        cmp si,di
        je mfin
        
        EsMayuscula array[si]
        cmp validarEsMayuscula,0b
        je v2

        EsNumero array[si]
        cmp validarEsNumero,0b
        je v2

        EsSimbolo array[si]
        cmp validarEsSimbolo,0b
        je v2

        EsMinuscula array[si]
        cmp validarEsMinuscula,0b
        je v2

        jmp v3

        v2:
        inc si
        jmp mstart

        v3:
        mov  al,array[si]
        cmp al,'$'
        je v2

        mov validar1,1b
        println msgErrorMayusculaMinusculasNumeroSimbolo
        printChar array[si]
        printChar 10d

    mfin:
endm	

EsMayuscula macro char	 ;
    LOCAL v1,v2,mfin
        mov validarEsMayuscula,0b

        cmp char,65d ;limite inferior A
        jae v1
        jmp v2
        
        v1:
        cmp char,90d ;limite superior Z
        jbe mfin

        v2:
        mov validarEsMayuscula,1b
        
    mfin:
endm	

EsMinuscula macro char 
    LOCAL v1,v2,mfin
        mov validarEsMinuscula,0b

        cmp char,97d ;limite inferior a
        jae v1
        jmp v2
        
        v1:
        cmp char,122d ;limite superior z
        jbe mfin

        v2:
        mov validarEsMinuscula,1b
        
    mfin:
endm

EsNumero macro char	
    LOCAL v1,v2,mfin
        mov validarEsNumero,0b

        cmp char,48d ;limite inferior 0
        jae v1
        jmp v2
        
        v1:
        cmp char,57d ;limite superior 9
        jbe mfin

        v2:
        mov validarEsNumero,1b
        
    mfin:
endm	

EsSimbolo macro char 
    LOCAL v1,v2,mfin
        mov validarEsSimbolo,0b

        cmp char,44d ; ,
        je mfin

        cmp char,46d ; . 
        je mfin

        cmp char,33d ; ! 
        je mfin

        cmp char,32d ; espcio
        je mfin
        
        mov validarEsSimbolo,1b
        
    mfin:
endm	

printLimited macro numbytes,array 
    LOCAL getCadena, finCadena
    xor si,si
    mov di,numbytes
    getCadena:
        ; mov al,array[si]
        ; cmp al,'$'
        ; je finCadena
        cmp si,di
        je finCadena
        printChar array[si] 
        inc si
        jmp getCadena
    finCadena:
endm

LimpiarLimited macro numbytes,array, char 
    LOCAL getCadena, finCadena
    xor si,si
    mov di,numbytes
    getCadena:
        cmp si,di
        je finCadena
        mov al,char
        mov array[si],al
        inc si
        jmp getCadena
    finCadena:
endm

printLimitedln  macro numbytes,array	
    printLimited numbytes,array
    printChar 10d
endm

getTextoLimited macro numbytes,array	
    LOCAL getCadena, finCadena
    xor si,si
    mov di,numbytes
    getCadena:
        cmp si,di
        je finCadena
        getChar
        cmp al,0dh
        je finCadena
        mov array[si],al
        inc si
        jmp getCadena
    finCadena:
    printChar 10d
endm

getChar macro ;pide un char en teclado y lo guarda en al
    mov ah, 01h
    int 21h
endm

printChar macro char
    mov ah,02h
    mov dl, char
    int 21h
endm

print macro cadena
    mov ah, 09h
    mov dx, offset cadena
    int 21h
endm

println macro cadena
   print cadena
	printChar 10d
endm

LimpiarPantalla macro	;limpia la pantalla, solo en modo texto
    setModeGrafico
    setModoTexto
endm

setModoTexto macro ;pone en modod de texto el programa
    mov ax, 0003h
    int 10h
endm

setModeGrafico macro ;pone en modo grafico el programa
    mov ax, 0013h
    int 10h
endm

abrirF macro ruta,handle
		mov ah,3dh
		mov al,10b
		lea dx,ruta
		int 21h
		mov handle,ax
		jc exitProgramaArchivo
endm

leerF macro numbytes,buffer,handle
    mov ah,3fh
    mov bx,handle
    mov cx,numbytes
    lea dx,buffer
    int 21h
    jc exitProgramaArchivo
endm

editarFDesplazado macro  numbytes,buffer,handle,desplazamiento
    moverPuntero handle,desplazamiento
    mov ah, 40h
    mov bx, handle
    mov cx, numbytes
    mov dx, offset buffer
    int 21h
endm

moverPuntero macro handle,desplazamiento
    mov ah, 42h ; función para mover el puntero de posición del archivo
    mov al, 0 ; mover desde el inicio del archivo
    mov bx, handle ; handle del archivo
    mov cx, 0 ; parte alta del desplazamiento
    mov dx, desplazamiento ; parte baja del desplazamiento (5 bytes)
    int 21h
endm

moverPunteroFinal macro handle,desplazamiento
    mov ah, 42h ; función para mover el puntero de posición del archivo
    mov al, 2 ; mover desde el inicio del archivo
    mov bx, handle ; handle del archivo
    mov cx, 0d ; parte alta del desplazamiento
    mov dx, desplazamiento ; parte baja del desplazamiento (5 bytes)
    int 21h
endm

editarFDesplazadoFinal macro  numbytes,buffer,handle,desplazamiento
    moverPunteroFinal handle,desplazamiento
    mov ah, 40h
    mov bx, handle
    mov cx, numbytes
    mov dx, offset buffer
    int 21h
endm

cerrarF macro handle
    mov ah, 3Eh ; función para cerrar un archivo
    mov bx, handle ; handle del archivo
    int 21h
endm

leerFDesplazado macro numbytes,buffer,handle,desplazamiento
    moverPuntero handle,desplazamiento
    ; ahora puedes usar INT 21h, 3Fh para leer el archivo con un desplazamiento de 5 bytes
    mov ah, 3Fh
    mov bx, handle
    mov cx, numbytes
    mov dx, offset buffer
    int 21h
endm

deleteF macro ruta
    mov ah,41h
    mov dx,offset ruta
    int 21h
endm

crearF macro ruta
    mov ah,3ch
    mov cx,0
    ;add nombre,exrension
    mov dx,offset ruta
    int 21h
    jc exitPrograma ;si no se pudo crear
    mov bx,ax
    mov ah,3eh ;cierra el archivo
    int 21h
endm

editarF macro ruta,txt,size
    mov ah,3dh
    mov al,1h
    mov dx,offset ruta
    int 21h
    ;println p1
    jc exitPrograma ;Si hubo error
    ;Escritura de archivo
    mov bx,ax ; mover hadfile
    mov cx,size ;num de caracteres a grabar
    mov dx,offset txt
    mov ah,40h
    int 21h
    cmp cx,ax
    ;println p2
    jne exitPrograma ;error salir
    mov ah,3eh ;Cierre de archivo
    int 21h
    ;jmp submenu
endm

abrirNonExist macro ruta,handle
    LOCAL NonProdBin, mSalir,mStart

    mStart:
    mov ah,3dh
    mov al,10b
    lea dx,ruta
    int 21h
    mov handle,ax
    jc NonProdBin
    jmp mSalir
    NonProdBin: 
        crearF ruta
        jmp mStart
    mSalir:
endm

FinalizarPrograma macro    
    xor al,al
    mov ah,4ch
    int 21h 
endm

sizeCadena macro cadena		;cuenta cuantos espacios tiene una cadena y guarda el resultado en ax
    LOCAL buclecontarcadena,finalcadena
    xor si,si
    buclecontarcadena:
        cmp cadena[si],'$';compara si la cadena termino
        je finalcadena
        inc si
        jmp buclecontarcadena
    finalcadena:
    mov ax,si
	 PAnyNumber
endm

PAnyNumber macro          
    LOCAL label1,print1,salir
    mov cx,0
    mov dx,0
    label1:
        cmp ax,0
        je print1     
        mov bx,10       
        div bx                   
        push dx             
        inc cx             
        xor dx,dx
        jmp label1
    print1:
        cmp cx,0
        je salir
        pop dx
        add dx,48
        mov ah,02h
        int 21h
        dec cx
        jmp print1
    salir:
    printChar 10d
endm

SavePAnyNumber macro var      
    LOCAL label1,print1,salir
    mov cx,0
    mov dx,0
    
       label1:
        xor di,di
        cmp ax,0
        je print1     
        mov bx,10       
        div bx                   
        push dx             
        inc cx             
        xor dx,dx
        jmp label1
    print1:
        cmp cx,0
        je salir
        pop dx
        add dx,48
        mov var[di],dl
        inc di
        ;mov ah,02h
        ;int 21h
        dec cx
        jmp print1
    salir: 
endm

