;--------------------------------------------------- Herramientas -----------------------------------------------------

    GenerarCatalogoCampleto macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si
        deleteF rutaCatalogoCompleto
        abrirNonExist rutaCatalogoCompleto,hanldeReporte
        editarFDesplazadoFinal SIZEOF headHtml,headHtml, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF styleHTML,styleHTML, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF bodyHtml1,bodyHtml1, hanldeReporte, 0d
        
        editarFDesplazadoFinal SIZEOF TheadHtml,TheadHtml, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF arrStartObjeto,arrStartObjeto, hanldeReporte, 0d
    

        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF codigoProducto,codigoProducto,'$'
        LimpiarLimited SIZEOF descripcionProducto,descripcionProducto,'$'
        LimpiarLimited SIZEOF precioProducto,precioProducto,'$'
        LimpiarLimited SIZEOF unidadesProducto,unidadesProducto,'$'
        pop si
        
        mov di,si
        leerFDesplazado SIZEOF codigoProducto,codigoProducto,hanldetemp,di
        add di,4d
        leerFDesplazado SIZEOF descripcionProducto,descripcionProducto,hanldetemp,di
        add di,32d
        leerFDesplazado SIZEOF precioProducto,precioProducto,hanldetemp,di
        add di,2d
        leerFDesplazado SIZEOF unidadesProducto,unidadesProducto,hanldetemp,di

        mov al, codigoProducto[0]
        cmp al, '$'
        je mSalir
        mov al, codigoProducto[0]
        cmp al, '0'
        je v4

        push si
        RemplazarChar SIZEOF codigoProducto,codigoProducto,'$',' '
        RemplazarChar SIZEOF descripcionProducto,descripcionProducto,'$',' '
        RemplazarChar SIZEOF precioProducto,precioProducto,'$',' '
        RemplazarChar SIZEOF unidadesProducto,unidadesProducto,'$',' '
        
        InsertarEnArray codigoObjetoP,codigoProducto,9d, SIZEOF codigoProducto
        InsertarEnArray descripcionObjetoP,descripcionProducto,14d, SIZEOF descripcionProducto
        InsertarEnArray precioObjetoP,precioProducto,18d, SIZEOF precioProducto
        InsertarEnArray unidadesObjetoP,unidadesProducto,20d, SIZEOF unidadesProducto

        printLimitedln SIZEOF inicioObjeto,inicioObjeto
        printLimitedln SIZEOF codigoObjetoP,codigoObjetoP
        printLimitedln SIZEOF descripcionObjetoP,descripcionObjetoP
        printLimitedln SIZEOF precioObjetoP,precioObjetoP
        printLimitedln SIZEOF unidadesObjetoP,unidadesObjetoP
        printLimitedln SIZEOF finObjeto,finObjeto

        
        editarFDesplazadoFinal SIZEOF inicioObjeto,inicioObjeto, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF codigoObjetoP,codigoObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF descripcionObjetoP,descripcionObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF precioObjetoP,precioObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF unidadesObjetoP,unidadesObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF finObjeto,finObjeto, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF comaObjeto,comaObjeto, hanldeReporte, 0d
        pop si

        ;getPass
        v4:
        add si,40d
        jmp mInicio

        mSalir:
        editarFDesplazadoFinal SIZEOF arrEndObjeto,arrEndObjeto, hanldeReporte, 0d
        
        editarFDesplazadoFinal SIZEOF InitforHTML,InitforHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF createsForHTML,createsForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF getVluesForHTML,getVluesForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF appendForHTML,appendForHTML, hanldeReporte, 0d

        
        editarFDesplazadoFinal SIZEOF EndforHTML,EndforHTML, hanldeReporte, 0d
        
        editarFDesplazadoFinal SIZEOF endHtml,endHtml, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF initScripHTML,initScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF middleScripHTML,middleScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endScripHTML,endScripHTML, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF endHtml2,endHtml2, hanldeReporte, 0d
        cerrarF hanldeReporte
    endm

    GenerarCatalogoAlfabetico macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si
        deleteF rutaAlfabeticamente
        abrirNonExist rutaAlfabeticamente,hanldeReporte
        editarFDesplazadoFinal SIZEOF headHtml,headHtml, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF styleHTML,styleHTML, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF bodyHtml2,bodyHtml2, hanldeReporte, 0d
        
     

        editarFDesplazadoFinal SIZEOF TheadHtml,TheadHtml, hanldeReporte, 0d
        
        editarFDesplazadoFinal SIZEOF arrStartObjeto,arrStartObjeto, hanldeReporte, 0d
    

        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF codigoProducto,codigoProducto,'$'
        LimpiarLimited SIZEOF descripcionProducto,descripcionProducto,'$'
        LimpiarLimited SIZEOF precioProducto,precioProducto,'$'
        LimpiarLimited SIZEOF unidadesProducto,unidadesProducto,'$'
        pop si
        
        mov di,si
        leerFDesplazado SIZEOF codigoProducto,codigoProducto,hanldetemp,di
        add di,4d
        leerFDesplazado SIZEOF descripcionProducto,descripcionProducto,hanldetemp,di
        add di,32d
        leerFDesplazado SIZEOF precioProducto,precioProducto,hanldetemp,di
        add di,2d
        leerFDesplazado SIZEOF unidadesProducto,unidadesProducto,hanldetemp,di

        mov al, codigoProducto[0]
        cmp al, '$'
        je mSalir
        mov al, codigoProducto[0]
        cmp al, '0'
        je v4

        push si
        RemplazarChar SIZEOF codigoProducto,codigoProducto,'$',' '
        RemplazarChar SIZEOF descripcionProducto,descripcionProducto,'$',' '
        RemplazarChar SIZEOF precioProducto,precioProducto,'$',' '
        RemplazarChar SIZEOF unidadesProducto,unidadesProducto,'$',' '
        
        InsertarEnArray codigoObjetoP,codigoProducto,9d, SIZEOF codigoProducto
        InsertarEnArray descripcionObjetoP,descripcionProducto,14d, SIZEOF descripcionProducto
        InsertarEnArray precioObjetoP,precioProducto,18d, SIZEOF precioProducto
        InsertarEnArray unidadesObjetoP,unidadesProducto,20d, SIZEOF unidadesProducto

        printLimitedln SIZEOF inicioObjeto,inicioObjeto
        printLimitedln SIZEOF codigoObjetoP,codigoObjetoP
        printLimitedln SIZEOF descripcionObjetoP,descripcionObjetoP
        printLimitedln SIZEOF precioObjetoP,precioObjetoP
        printLimitedln SIZEOF unidadesObjetoP,unidadesObjetoP
        printLimitedln SIZEOF finObjeto,finObjeto

        
        editarFDesplazadoFinal SIZEOF inicioObjeto,inicioObjeto, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF codigoObjetoP,codigoObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF descripcionObjetoP,descripcionObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF precioObjetoP,precioObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF unidadesObjetoP,unidadesObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF finObjeto,finObjeto, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF comaObjeto,comaObjeto, hanldeReporte, 0d
        pop si

        ;getPass
        v4:
        add si,40d
        jmp mInicio

        mSalir:
        editarFDesplazadoFinal SIZEOF arrEndObjeto,arrEndObjeto, hanldeReporte, 0d

        
        editarFDesplazadoFinal SIZEOF sortHTML,sortHTML, hanldeReporte, 0d


        editarFDesplazadoFinal SIZEOF InitforHTML,InitforHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF createsForHTML,createsForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF getVluesForHTML,getVluesForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF appendForHTML,appendForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF EndforHTML,EndforHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endHtml,endHtml, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF initScripHTML,initScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF middleScripHTML,middleScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endScripHTML,endScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endHtml2,endHtml2, hanldeReporte, 0d
        cerrarF hanldeReporte
    endm

    GenerarSinExistenvias macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si
        deleteF rutaSinExistencias
        abrirNonExist rutaSinExistencias,hanldeReporte
        editarFDesplazadoFinal SIZEOF headHtml,headHtml, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF styleHTML,styleHTML, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF bodyHtml4,bodyHtml4, hanldeReporte, 0d
        
       

        editarFDesplazadoFinal SIZEOF TheadHtml,TheadHtml, hanldeReporte, 0d
        
        editarFDesplazadoFinal SIZEOF arrStartObjeto,arrStartObjeto, hanldeReporte, 0d
    

        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF codigoProducto,codigoProducto,'$'
        LimpiarLimited SIZEOF descripcionProducto,descripcionProducto,'$'
        LimpiarLimited SIZEOF precioProducto,precioProducto,'$'
        LimpiarLimited SIZEOF unidadesProducto,unidadesProducto,'$'
        pop si
        
        mov di,si
        leerFDesplazado SIZEOF codigoProducto,codigoProducto,hanldetemp,di
        add di,4d
        leerFDesplazado SIZEOF descripcionProducto,descripcionProducto,hanldetemp,di
        add di,32d
        leerFDesplazado SIZEOF precioProducto,precioProducto,hanldetemp,di
        add di,2d
        leerFDesplazado SIZEOF unidadesProducto,unidadesProducto,hanldetemp,di

        mov al, codigoProducto[0]
        cmp al, '$'
        je mSalir
        mov al, codigoProducto[0]
        cmp al, '0'
        je v4

        push si
        RemplazarChar SIZEOF codigoProducto,codigoProducto,'$',' '
        RemplazarChar SIZEOF descripcionProducto,descripcionProducto,'$',' '
        RemplazarChar SIZEOF precioProducto,precioProducto,'$',' '
        RemplazarChar SIZEOF unidadesProducto,unidadesProducto,'$',' '
        
        InsertarEnArray codigoObjetoP,codigoProducto,9d, SIZEOF codigoProducto
        InsertarEnArray descripcionObjetoP,descripcionProducto,14d, SIZEOF descripcionProducto
        InsertarEnArray precioObjetoP,precioProducto,18d, SIZEOF precioProducto
        InsertarEnArray unidadesObjetoP,unidadesProducto,20d, SIZEOF unidadesProducto

        printLimitedln SIZEOF inicioObjeto,inicioObjeto
        printLimitedln SIZEOF codigoObjetoP,codigoObjetoP
        printLimitedln SIZEOF descripcionObjetoP,descripcionObjetoP
        printLimitedln SIZEOF precioObjetoP,precioObjetoP
        printLimitedln SIZEOF unidadesObjetoP,unidadesObjetoP
        printLimitedln SIZEOF finObjeto,finObjeto

        editarFDesplazadoFinal SIZEOF inicioObjeto,inicioObjeto, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF codigoObjetoP,codigoObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF descripcionObjetoP,descripcionObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF precioObjetoP,precioObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF unidadesObjetoP,unidadesObjetoP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF finObjeto,finObjeto, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF comaObjeto,comaObjeto, hanldeReporte, 0d
        pop si

        ;getPass
        v4:
        add si,40d
        jmp mInicio

        mSalir:
        editarFDesplazadoFinal SIZEOF arrEndObjeto,arrEndObjeto, hanldeReporte, 0d

        
        editarFDesplazadoFinal SIZEOF SinUnidadesHTML,SinUnidadesHTML, hanldeReporte, 0d


        editarFDesplazadoFinal SIZEOF InitforHTML,InitforHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF createsForHTML,createsForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF getVluesForHTML,getVluesForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF appendForHTML,appendForHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF EndforHTML,EndforHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endHtml,endHtml, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF initScripHTML,initScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF middleScripHTML,middleScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endScripHTML,endScripHTML, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF endHtml2,endHtml2, hanldeReporte, 0d
        cerrarF hanldeReporte
    endm

    GenerarFecha macro dia, mes, anio, hora, minuto
        editarFDesplazadoFinal SIZEOF dia,dia, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF barrapuntosP,barrapuntosP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF mes,mes, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF barrapuntosP,barrapuntosP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF anio,anio, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF spacioP,spacioP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF spacioP,spacioP, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF hora,hora, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF dospuntosP,dospuntosP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF minuto,minuto, hanldeReporte, 0d
          editarFDesplazadoFinal SIZEOF spacioP,spacioP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF FainlPHrs,FainlPHrs, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
    endm

    GenerateLast5Ventas macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        
        Fecha
        Hora
        save8bits literaldia,diaVenta
        save8bits literalmes,mesVenta
        save16bits literalanio,anioVenta
        save8bits literalhora,horaVenta
        save8bits literalminuto,minutoVenta

        GenerarFecha diaVenta,mesVenta,anioVenta,horaVenta,minutoVenta
    
        editarFDesplazadoFinal SIZEOF division,division, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF UltimasPVentas,UltimasPVentas, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d

    
        cmp contarCantidadVentas,5d
        ja v1
        jmp v2

        v1:
        sub contarCantidadVentas,5d
        GenerateLastLastVentas
        jmp v3

        v2:
        GenerateMenos5Ventas

        v3:
    endm

    GenerateMenos5Ventas macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si

        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF ArrVentasBuscar,ArrVentasBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrVentasBuscar,ArrVentasBuscar,hanldetempVenta,si

        mov al, ArrVentasBuscar[0]
        cmp al, '?'
        je mSalir
        
        push si
        mov di,si
        leerFDesplazado SIZEOF literaldia,literaldia,hanldetempVenta,di
        add di, SIZEOF literaldia
        leerFDesplazado SIZEOF literalmes,literalmes,hanldetempVenta,di
        add di, SIZEOF literalmes
        leerFDesplazado SIZEOF literalanio,literalanio,hanldetempVenta,di
        add di, SIZEOF literalanio
        leerFDesplazado SIZEOF literalhora,literalhora,hanldetempVenta,di
        add di, SIZEOF literalhora
        leerFDesplazado SIZEOF literalminuto,literalminuto,hanldetempVenta,di
        add di, SIZEOF literalminuto
        leerFDesplazado SIZEOF codigoVenta,codigoVenta,hanldetempVenta,di
        add di, SIZEOF codigoVenta
        leerFDesplazado SIZEOF unidadesVentasNum,unidadesVentasNum,hanldetempVenta,di
        add di, SIZEOF unidadesVentasNum
        leerFDesplazado SIZEOF subtotalVenta,subtotalVenta,hanldetempVenta,di
        add di, SIZEOF subtotalVenta
        
        save8bits literaldia,diaVenta
        save8bits literalmes,mesVenta
        save16bits literalanio,anioVenta
        save8bits literalhora,horaVenta
        save8bits literalminuto,minutoVenta
        ;printLimitedln SIZEOF codigoVenta,codigoVenta
        mov ax, unidadesVentasNum
        mov unidadesVentasNumTemp,al
        save8bits unidadesVentasNumTemp,unidadesVenta
        save16bits subtotalVenta,totalVentaPrint

        GenerarFicha
    ;---
        
        ;getChar
        pop si  

        add si,14d
        jmp mInicio
        ;jmp mSalir

        mSalir:
        editarFDesplazadoFinal SIZEOF division,division, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
    
    endm

    GenerateLastLastVentas macro
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        mov ax, contarCantidadVentas
        mov bx, SIZEOF ArrVentasBuscar
        mul bx
        mov si,ax
        
        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF ArrVentasBuscar,ArrVentasBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrVentasBuscar,ArrVentasBuscar,hanldetempVenta,si

        mov al, ArrVentasBuscar[0]
        cmp al, '?'
        je mSalir
        
        push si
        mov di,si
        leerFDesplazado SIZEOF literaldia,literaldia,hanldetempVenta,di
        add di, SIZEOF literaldia
        leerFDesplazado SIZEOF literalmes,literalmes,hanldetempVenta,di
        add di, SIZEOF literalmes
        leerFDesplazado SIZEOF literalanio,literalanio,hanldetempVenta,di
        add di, SIZEOF literalanio
        leerFDesplazado SIZEOF literalhora,literalhora,hanldetempVenta,di
        add di, SIZEOF literalhora
        leerFDesplazado SIZEOF literalminuto,literalminuto,hanldetempVenta,di
        add di, SIZEOF literalminuto
        leerFDesplazado SIZEOF codigoVenta,codigoVenta,hanldetempVenta,di
        add di, SIZEOF codigoVenta
        leerFDesplazado SIZEOF unidadesVentasNum,unidadesVentasNum,hanldetempVenta,di
        add di, SIZEOF unidadesVentasNum
        leerFDesplazado SIZEOF subtotalVenta,subtotalVenta,hanldetempVenta,di
        add di, SIZEOF subtotalVenta
        
        save8bits literaldia,diaVenta
        save8bits literalmes,mesVenta
        save16bits literalanio,anioVenta
        save8bits literalhora,horaVenta
        save8bits literalminuto,minutoVenta
        ;printLimitedln SIZEOF codigoVenta,codigoVenta
        mov ax, unidadesVentasNum
        mov unidadesVentasNumTemp,al
        save8bits unidadesVentasNumTemp,unidadesVenta
        save16bits subtotalVenta,totalVentaPrint

        GenerarFicha
    ;---
        
        ;getChar
        pop si  

        add si,14d
        jmp mInicio
        ;jmp mSalir

        mSalir:
        editarFDesplazadoFinal SIZEOF division,division, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
    
    endm

    GenerarFicha macro 
        editarFDesplazadoFinal SIZEOF FechaPVentas,FechaPVentas, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
        GenerarFecha diaVenta,mesVenta,anioVenta,horaVenta,minutoVenta

        editarFDesplazadoFinal SIZEOF MontoPVentas,MontoPVentas, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF FainlPP,FainlPP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF totalVentaPrint,totalVentaPrint, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF FainlP,FainlP, hanldeReporte, 0d

        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF division2,division2, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
    endm

    GenerateSpecifico macro indice,text
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        mov si,indice

        editarFDesplazadoFinal SIZEOF text,text, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d


        mInicio:
        LimpiarPantalla
    
        push si
        LimpiarLimited SIZEOF ArrVentasBuscar,ArrVentasBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrVentasBuscar,ArrVentasBuscar,hanldetempVenta,si
        
        push si
        mov di,si
        leerFDesplazado SIZEOF literaldia,literaldia,hanldetempVenta,di
        add di, SIZEOF literaldia
        leerFDesplazado SIZEOF literalmes,literalmes,hanldetempVenta,di
        add di, SIZEOF literalmes
        leerFDesplazado SIZEOF literalanio,literalanio,hanldetempVenta,di
        add di, SIZEOF literalanio
        leerFDesplazado SIZEOF literalhora,literalhora,hanldetempVenta,di
        add di, SIZEOF literalhora
        leerFDesplazado SIZEOF literalminuto,literalminuto,hanldetempVenta,di
        add di, SIZEOF literalminuto
        leerFDesplazado SIZEOF codigoVenta,codigoVenta,hanldetempVenta,di
        add di, SIZEOF codigoVenta
        leerFDesplazado SIZEOF unidadesVentasNum,unidadesVentasNum,hanldetempVenta,di
        add di, SIZEOF unidadesVentasNum
        leerFDesplazado SIZEOF subtotalVenta,subtotalVenta,hanldetempVenta,di
        add di, SIZEOF subtotalVenta
        
        save8bits literaldia,diaVenta
        save8bits literalmes,mesVenta
        save16bits literalanio,anioVenta
        save8bits literalhora,horaVenta
        save8bits literalminuto,minutoVenta
        ;printLimitedln SIZEOF codigoVenta,codigoVenta
        mov ax, unidadesVentasNum
        mov unidadesVentasNumTemp,al
        save8bits unidadesVentasNumTemp,unidadesVenta
        save16bits subtotalVenta,totalVentaPrint

        GenerarFicha
    ;---
        
        ;getChar
        pop si  

        jmp mSalir

        mSalir:
        editarFDesplazadoFinal SIZEOF division,division, hanldeReporte, 0d
        editarFDesplazadoFinal SIZEOF enterP,enterP, hanldeReporte, 0d
    endm

    InitReportesVentas macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si
        mov contarCantidadVentas, 0d
        mov contarMaxVentas, 0d
        mov contarMinVentas, 65535d

        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF ArrVentasBuscar,ArrVentasBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrVentasBuscar,ArrVentasBuscar,hanldetempVenta,si

        mov al, ArrVentasBuscar[0]
        cmp al, '?'
        je mSalir
        
        push si
        mov di,si
        leerFDesplazado SIZEOF literaldia,literaldia,hanldetempVenta,di
        add di, SIZEOF literaldia
        leerFDesplazado SIZEOF literalmes,literalmes,hanldetempVenta,di
        add di, SIZEOF literalmes
        leerFDesplazado SIZEOF literalanio,literalanio,hanldetempVenta,di
        add di, SIZEOF literalanio
        leerFDesplazado SIZEOF literalhora,literalhora,hanldetempVenta,di
        add di, SIZEOF literalhora
        leerFDesplazado SIZEOF literalminuto,literalminuto,hanldetempVenta,di
        add di, SIZEOF literalminuto
        leerFDesplazado SIZEOF codigoVenta,codigoVenta,hanldetempVenta,di
        add di, SIZEOF codigoVenta
        leerFDesplazado SIZEOF unidadesVentasNum,unidadesVentasNum,hanldetempVenta,di
        add di, SIZEOF unidadesVentasNum
        leerFDesplazado SIZEOF subtotalVenta,subtotalVenta,hanldetempVenta,di
        add di, SIZEOF subtotalVenta
        pop si  

        mov ax,subtotalVenta
        cmp ax,contarMaxVentas
        jae v1
        jmp v2

        v1:
        mov contarMaxVentas, ax
        mov indiceMaxVentas, si

        v2:

        mov ax,subtotalVenta
        cmp contarMinVentas,ax 
        jae v3
        jmp v4
        
        v3:
        mov contarMinVentas, ax
        mov indiceMinVentas, si

        v4:
        inc contarCantidadVentas
        
        ;getChar
    

        add si,14d
        jmp mInicio
        ;jmp mSalir

        mSalir:

        ; mov ax, contarCantidadVentas
        ; PAnyNumber


        ; mov ax, contarMaxVentas
        ; PAnyNumber


        ; mov ax, indiceMaxVentas
        ; PAnyNumber

        ; mov ax, contarMinVentas
        ; PAnyNumber
        

        ; mov ax, indiceMinVentas
        ; PAnyNumber

    endm

;--------------------------------------------------- Ventas -----------------------------------------------------
    print8bits macro var
        xor ax,ax
        mov al,var
        PAnyNumber
    endm

    print16bits macro var
        mov ax,var
        PAnyNumber
    endm

    save8bits macro var,texto
        LimpiarLimited SIZEOF texto,texto,'$'
        xor ax,ax
        mov al,var
        SavePAnyNumber texto
        ArreglarNum2Digitos texto
        ;printLimitedln SIZEOF texto,texto
    endm

    save16bits macro var,texto
        LimpiarLimited SIZEOF texto,texto,'$'
        mov ax,var
        SavePAnyNumber texto
        RemplazarChar SIZEOF texto, texto, '$', ' '
        ;printLimitedln SIZEOF texto,texto

    endm

    verVentas macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si
        mInicio:
        LimpiarPantalla
        push si
        LimpiarLimited SIZEOF ArrVentasBuscar,ArrVentasBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrVentasBuscar,ArrVentasBuscar,hanldetempVenta,si

        mov al, ArrVentasBuscar[0]
        cmp al, '?'
        je mSalir
        
        push si
        mov di,si
        leerFDesplazado SIZEOF literaldia,literaldia,hanldetempVenta,di
        add di, SIZEOF literaldia
        leerFDesplazado SIZEOF literalmes,literalmes,hanldetempVenta,di
        add di, SIZEOF literalmes
        leerFDesplazado SIZEOF literalanio,literalanio,hanldetempVenta,di
        add di, SIZEOF literalanio
        leerFDesplazado SIZEOF literalhora,literalhora,hanldetempVenta,di
        add di, SIZEOF literalhora
        leerFDesplazado SIZEOF literalminuto,literalminuto,hanldetempVenta,di
        add di, SIZEOF literalminuto
        leerFDesplazado SIZEOF codigoVenta,codigoVenta,hanldetempVenta,di
        add di, SIZEOF codigoVenta
        leerFDesplazado SIZEOF unidadesVentasNum,unidadesVentasNum,hanldetempVenta,di
        add di, SIZEOF unidadesVentasNum
        leerFDesplazado SIZEOF subtotalVenta,subtotalVenta,hanldetempVenta,di
        add di, SIZEOF subtotalVenta
        
        save8bits literaldia,diaVenta
        save8bits literalmes,mesVenta
        save16bits literalanio,anioVenta
        save8bits literalhora,horaVenta
        save8bits literalminuto,minutoVenta
        printLimitedln SIZEOF codigoVenta,codigoVenta
        mov ax, unidadesVentasNum
        mov unidadesVentasNumTemp,al
        save8bits unidadesVentasNumTemp,unidadesVenta
        save16bits subtotalVenta,totalVentaPrint
    
        InsertarEnArray diaObjeto,diaVenta,15d, SIZEOF diaVenta
        InsertarEnArray mesObjeto,mesVenta,15d, SIZEOF mesVenta
        InsertarEnArray anioObjeto,anioVenta,16d, SIZEOF anioVenta
        InsertarEnArray horaObjeto,horaVenta,16d, SIZEOF horaVenta
        InsertarEnArray minutosObjeto,minutoVenta,19d, SIZEOF minutoVenta
        InsertarEnArray codigoObjeto,codigoVenta,9d, SIZEOF codigoVenta
        InsertarEnArray unidadesObjeto,unidadesVenta,20d, SIZEOF unidadesVenta
        InsertarEnArray subtotalObjeto,totalVentaPrint,20d, SIZEOF totalVentaPrint

        printLimitedln SIZEOF inicioObjeto,inicioObjeto
        printLimitedln SIZEOF diaObjeto,diaObjeto
        printLimitedln SIZEOF mesObjeto,mesObjeto
        printLimitedln SIZEOF anioObjeto,anioObjeto
        printLimitedln SIZEOF horaObjeto,horaObjeto
        printLimitedln SIZEOF minutosObjeto,minutosObjeto
        printLimitedln SIZEOF codigoObjeto,codigoObjeto
        printLimitedln SIZEOF unidadesObjeto,unidadesObjeto
        printLimitedln SIZEOF subtotalObjeto,subtotalObjeto
        printLimitedln SIZEOF finObjeto,finObjeto
        getChar
        pop si  

        add si,14d
        jmp mInicio
        ;jmp mSalir

        mSalir:


    endm

    EscribirVentas macro
        mov di,desVentas
        editarFDesplazado SIZEOF literaldia,literaldia,hanldetempVenta,di
        add di, SIZEOF literaldia
        editarFDesplazado SIZEOF literalmes,literalmes,hanldetempVenta,di
        add di, SIZEOF literalmes
        editarFDesplazado SIZEOF literalanio,literalanio,hanldetempVenta,di
        add di, SIZEOF literalanio
        editarFDesplazado SIZEOF literalhora,literalhora,hanldetempVenta,di
        add di, SIZEOF literalhora
        editarFDesplazado SIZEOF literalminuto,literalminuto,hanldetempVenta,di
        add di, SIZEOF literalminuto
        editarFDesplazado SIZEOF codigoProducto,codigoProducto,hanldetempVenta,di
        add di, SIZEOF codigoProducto
        editarFDesplazado SIZEOF unidadesVentasNum,unidadesVentasNum,hanldetempVenta,di
        add di, SIZEOF unidadesVentasNum
        editarFDesplazado SIZEOF subtotalVenta,subtotalVenta,hanldetempVenta,di
        add di, SIZEOF subtotalVenta
    endm

    BucarVacioVentas macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si

        mInicio:

        push si
        LimpiarLimited SIZEOF ArrVentasBuscar,ArrVentasBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrVentasBuscar,ArrVentasBuscar,hanldetempVenta,si
        push si
        ;printLimitedln SIZEOF ArrVentasBuscar,ArrVentasBuscar
        pop si
        
        mov al, ArrVentasBuscar[0]
        cmp al, '?'
        je mSalir

        add si,14d
        jmp mInicio

        mSalir:
        mov desVentas, si
        ;mov ax, desVentas
        ;PAnyNumber
    endm

;--------------------------------------------------- Macros Producto -----------------------------------------------------

    compararArray macro numbytes, array1,array2
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

        mov validar1,0b
        xor si,si

        mInicio:
        cmp si,numbytes
        je mSalir

        mov al, array1[si]
        mov ah, array2[si]
        inc si
        cmp al, ah
        je mInicio

        mov validar1,1b

        mSalir:
    endm

    BucarProducto macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio, mIgual, mError, mValido
        
        ;printLimitedln SIZEOF codigoProducto,codigoProducto
        xor si,si
        mov validar2,0b

        mInicio:

            push si
            LimpiarLimited SIZEOF codigoBuscarProducto,codigoBuscarProducto,'?'
            pop si

            leerFDesplazado SIZEOF codigoBuscarProducto,codigoBuscarProducto,hanldetemp,si
    
            push si
            compararArray SIZEOF codigoProducto ,codigoProducto,codigoBuscarProducto
            pop si

            cmp validar1,0b ;encontro coincidencia
            je mIgual

            mov al, codigoBuscarProducto[0]
            cmp al, '?'
            je mSalir

            add si,40d
            jmp mInicio

            mIgual: 
            mov validar2,1b

        mSalir:
        mov desProductos, si
    endm

    InsertarEnArray macro destino, origen, desplazamiento, longitud
        LOCAL copy_loop
        mov si, offset origen ; Puntero al inicio de ArrProductosBuscar
        mov di, offset destino + desplazamiento ; Puntero a la posición 10 de ArrProducto
        mov cx, longitud ; Contador de caracteres a copiar

        copy_loop:
        mov al, [si] ; Cargar el carácter de ArrProductosBuscar en AL
        mov [di], al ; Almacenar el carácter en la posición correspondiente de ArrProducto
        inc si ; Incrementar el puntero de ArrProductosBuscar
        inc di ; Incrementar el puntero de ArrProducto
        loop copy_loop ; Repetir hasta que se copien los 10 caracteres
    endm

    RemplazarChar macro numbytes, array1, charOrigen, charDestino
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

        xor si,si
        mov al, charOrigen
        mov ah, charDestino

        mInicio:
        cmp si, numbytes
        je mSalir

        cmp al,array1[si]
        je v1
        jmp v2

        v1:
        mov array1[si],ah

        v2:
        inc si
        jmp mInicio

        mSalir:

    endm

    ArreglarNum2Digitos macro array1 
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

        xor si,si
        mov al, array1[0]
        mov ah, array1[1]

        mInicio:
        cmp ah,'$'
        jne mSalir

        mov array1[1],al
        mov array1[0],'0'

        mSalir:

    endm
        
    BucarVacioProducto macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si

        mInicio:
        push si
        LimpiarLimited SIZEOF ArrProductosBuscar,ArrProductosBuscar,'?'
        pop si
        leerFDesplazado SIZEOF ArrProductosBuscar,ArrProductosBuscar,hanldetemp,si
        
        mov al, ArrProductosBuscar[0]
        cmp al, '?'
        je mSalir
        mov al, ArrProductosBuscar[0]
        cmp al, '0'
        je mSalir

        add si,40d
        jmp mInicio

        mSalir:
        mov desProductos, si
        ;mov ax, desProductos
        ;PAnyNumber
    endm

    ImprimirProductos macro
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
        xor si,si
        ;xor di,di
        mov di,1d

        mInicio:

        push si
        push di
        LimpiarLimited SIZEOF codigoProducto,codigoProducto,'$'
        LimpiarLimited SIZEOF descripcionProducto,descripcionProducto,'$'
        LimpiarLimited SIZEOF precioProducto,precioProducto,'$'
        LimpiarLimited SIZEOF unidadesProducto,unidadesProducto,'$'
        pop di
        pop si
        
        push di
        mov di,si
        leerFDesplazado SIZEOF codigoProducto,codigoProducto,hanldetemp,di
        add di,4d
        leerFDesplazado SIZEOF descripcionProducto,descripcionProducto,hanldetemp,di
        add di,32d
        leerFDesplazado SIZEOF precioProducto,precioProducto,hanldetemp,di
        add di,2d
        leerFDesplazado SIZEOF unidadesProducto,unidadesProducto,hanldetemp,di
        pop di

        mov al, codigoProducto[0]
        cmp al, '$'
        je mSalir
        mov al, codigoProducto[0]
        cmp al, '0'
        je v1

        push si
        push di
        RemplazarChar SIZEOF codigoProducto,codigoProducto,'$',' '
        RemplazarChar SIZEOF descripcionProducto,descripcionProducto,'$',' '
        RemplazarChar SIZEOF precioProducto,precioProducto,'$',' '
        RemplazarChar SIZEOF unidadesProducto,unidadesProducto,'$',' '
        
        InsertarEnArray ArrRowProducroLleno,codigoProducto,1d, SIZEOF codigoProducto
        InsertarEnArray ArrRowProducroLleno,descripcionProducto,6d, SIZEOF descripcionProducto
        InsertarEnArray ArrRowProducroLleno,precioProducto,39d, SIZEOF precioProducto
        InsertarEnArray ArrRowProducroLleno,unidadesProducto,42d , SIZEOF unidadesProducto

        printLimitedln SIZEOF ArrRowProducroLleno,ArrRowProducroLleno
        pop di
        pop si

        cmp di, 5d
        jae v2
        jmp v1
        
        v2:
        xor di,di
        println msgVerProductos 
        getPass
    
        cmp al,  13d
        je v1
        cmp al, 113d
        je mSalir

        v1:
        inc di
        add si,40d
        jmp mInicio

        mSalir:
        
    endm

;--------------------------------------------------- Macros Obtener Usuario y clave -----------------------------------------------------
    ObtenerUsuarioClave macro
        LOCAL recorrerCadena,finalcadena,llenarUsuario,ciclollenarUsuario,finleerUsuario,llenarClave,ciclollenarClave,finleerClave
        xor si,si
        xor di,di

        recorrerCadena:
        
            cmp DataArchivo[si],'='
            je validartipo

            cmp DataArchivo[si],'$'
            je finalcadena

            inc si
            jmp recorrerCadena

            validartipo:
            cmp di,0
            je llenarUsuario
            cmp di,1
            je llenarClave
            jmp recorrerCadena

            llenarUsuario:
            add si,2

            ciclollenarUsuario:
            mov al, DataArchivo[si]
            mov usuarioArchivo[di],al
            inc si
            inc di
            cmp DataArchivo[si],'$'
            je finalcadena
            cmp DataArchivo[si],13
            je finleerUsuario
            jmp ciclollenarUsuario

            finleerUsuario: 
            mov di,1
            jmp recorrerCadena

            ;---
            llenarClave:
            xor di,di
            add si,2

            ciclollenarClave:
            mov al, DataArchivo[si]
            mov claveArchivo[di],al
            inc si
            inc di
            cmp DataArchivo[si],'$'
            je finleerClave
            jmp ciclollenarClave

            finleerClave: 
        finalcadena:
    endm

    ValidarUsuarioClave macro
        mov al, usuarioArchivo[0]
        cmp al, '$'
        je exitProgramaUsuario
        mov al, claveArchivo[0]
        cmp al, '$'
        je exitProgramaUsuario

        println msgMostarCredenciales
        println msgMostarCredencialesUsuario
        println usuarioArchivo
        println msgMostarCredencialesClave
        println claveArchivo
        println welcomeSistema
    endm

    ObtenerRequerimientoProducto macro mensaje,array,tipo
        LOCAL mSalir,v1,v2,v3,v4,v5,v6,mRepetir

        mRepetir:
        LimpiarLimited SIZEOF array,array,'$'
        println mensaje
        getTextoLimited SIZEOF array,array

        mov si, tipo

        cmp si,1d
        je v1

        cmp si,2d
        je v2

        cmp si,3d
        je v3

        cmp si,5d
        je v5

        v1: 
        validarMayusculasNumero SIZEOF array,array
        jmp v4

        v2:
        validarMayusculasMinusculaNumeroSimbolo SIZEOF array,array
        jmp v4

        v3: 
        validarNumero SIZEOF array,array 
        ArreglarNum2Digitos array
        jmp v4

        v5:
        mov validar1,0b

        v4:
        cmp validar1,1b
        je mRepetir

        mSalir:
    endm

