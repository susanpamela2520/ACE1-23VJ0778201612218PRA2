include menus.asm
include macros.asm
include macrosp.asm
.model small
;.stack 1000h
.stack
.data

;Menus Principales de todas las utilidades (productos, ventas, herramientas, salir)*************
;Menus y Submenus*************

    FistMesg db 10,13,'>------ Bienvenidos a Ventas USAC -------<',10,13,'$'
    MenuPrincipal db 10,13,'>---------Menu Principal---------<',10,13,' 1.Productos',10,13,'  2.Ventas',10,13,'  3.Herramientas',10,13,'  4.Salir',10,13,'-------------------------------$'
    MenuProductos db 10,13,'>---------Menu Productos--------<',10,13,'  1.Ingresar',10,13,'  2.Eliminar',10,13,'  3.Ver productos',10,13,'  4.Menu Principal',10,13,'-------------------------------$'
    MenuVentas db 10,13,'>------------Menu Ventas-----------<',10,13,'  1.Generar Venta',10,13,'  2.Menu principal',10,13,'-------------------------------$'
    MenuHerramientas db 10,13,'>-----------Menu Herramientas---------<',10,13,'  1.Catalogo',10,13,'  2.Reporte de productos',10,13,'  3.Reporte de ventas',10,13,'  4.Reporte de productos sin existencia',10,13,'  5.Menu principal',10,13,'--------------------------$'

    msgReporte1 db 10,13,'>------ Generacion de Reporte: Exitoso -----<',10,13,'$'

;Especio de Rutas para guardar***********
    rutaUser db "PRA2.CNF",0
    rutaProductos db "PROD.BIN",0
    rutaVenta db "VENT.BIN",0

    rutaCatalogoCompleto db "CATALG.HTML",0
    rutaAlfabeticamente db "ABC.HTM",0
    rutaVentasRep db "REP.TXT",0
    rutaSinExistencias db "FALTA.HTM",0

;Inicio Tabla de Contedido para ver productos en la pantalla***********

    ; Productos en Pantalla (grafica)********
        ArrHeadProducro db '|Codigo|Descripcion| Precio|Unidades|'
        ArrRowProducro db '|.....|..........................|...|...|'
        ArrRowProducroLleno db '|.....|...........................|...|...|'
        ArrProductosBuscar db 40d dup('$')
        ArrProducto db 40d dup('$') ; [4 codigos][32 descripcion][2 precio][2 unidades] = 40
        desProductos dw 0d

    ; Ventas en Pantalla (grafica)*********
        ArrHeadVenta db '|dia|mes|anio|hora|minuto|codigo|unidades|total|'
        ArrRowVenta db '|..|..|....|..|..|....|..|....|'
        ArrVentasBuscar db 14d dup('$')
        desVentas dw 0d

;Inicio de mensaje Inicial (cumple requerimientos del enunciado)*******

    welcome db'Escuela de Vacaciones 2023',10,13,'Facultad de Ingenieria',10,13,'Arqui1',10,13,'Aux.Ronald Marin',10,13,'$'
    credentiasl db 'Nombre: Susan Pamela Herrera Monzon',10,13,'Carne: 201612218',10,13,'$'
    msgMostarCredenciales db '>------Usuario Encontrado:------<',10,13,'$'
    msgMostarCredencialesUsuario db '*Usuario:$'
    msgMostarCredencialesClave db '*Contra:$'
    welcomeSistema db 10,13,'>------Bienvenido a Ventas USAC Inicio ------<',10,13,'$'

    ;AREA DE PRODUCTOS (INGRESO)********
        pressEnter db 'Presiona ENTER...',10,13,'$'

        ;INGRESO (Info de de productos, codigo, descripcion , precio, cantidades)***********
            msgIngresoProducto db 10,13,'>--------Ingrese el Producto--------<',10,13A,'$'
            msgIngresoProductoCodigo db 10,13,'***Ingrese el codigo del producto:***$'
            msgIngresoProductoDescripcion db 10,13,'***Ingrese descripcion del producto:***$'
            msgIngresoProductoPrecio db 10,13,'***Ingrese precio del producto:***$'
            msgIngresoProductoUnidades db 10,13,'***Ingrese unidades existentes del producto:***$'
            msgVerProductos db 10,13,'>---- Menu: ----<',10,13,'(ENTER para continuar)',10,13,'("q" para salir:)$'

            msgProductoInsertado db 10,13,'|--- Producto agregado con exito---|',10,13,'$'
            msgProductoEliminado db 10,13,'|--- Producto eliminado con exito ---|',10,13,'$'

        ;Eliminarcion de Productos (se pone codigo)************
            msgEliminiacionProducto db 10,13,'||-- Eliminar un Producto --||',10,13,'$'
            msgEliminacionProductoCodigo db 10,13,'|- Ingrese el codigo del producto a eliminar: -|$'

    ;Venta del Producto (se ingresa el codigo, y cantidad)*********
        msgVentaProductoCodigo db 10,13,'>----------Ingrese el codigo del producto:---------<$'
        msgVentaProductoExito db 10,13,'|||--- Venta Completa ---|||',10,13,'$'
        msgProductoAgregado db 10,13,'¡---Producto agregado con exito ---!',10,13,'$'
        msgIngreseCantidad db 10,13,'>---------Ingrese la cantidad a vender:---------< $'
        msgTotalPagar db '$$$ Su total a pagar es: $$$ $'

    ;Posibles errores para restricciones*******************************************

    msgError db 'El valor ingreso ',10,13,'$'
    msgErrorMayusculaNumero db 'ERROR ----> Solo se permiten Mayuscular y Numeros en el Sistema$'
    msgErrorNumero db 'ERROR ----> Solo permite Numeros el sistema$'
    msgErrorMayusculaMinusculasNumeroSimbolo  db 'ERROR ----> El sistema solo permite Mayusculas y Numeros y Simbolos: , . ! espacio$'
    msgErrorBuscarCodigoProducto db 'ERROR ----> Este Producto NO Existe',10,13,'$'
    msgErrorCodigoEcistenteProducto db 'ERRRO ----> Codigo debe se unico',10,13,'$'
    msgErrorMaxVentas db 'ERROR ----> El maximo de Productos es 10',10,13,'$'
    msgErrorNoItemsVentas db 'ERROR ----> No sepuede generar, venta vacia',10,13,'$'
    msgErrorCeroUnidadesVentas db 'ERROR ----> No sepuede vender 0 unidades',10,13,'$'
    msgErrorMayorAStockVentas db 'ERROR ----> No hay Unidades sufiencietes para la venta',10,13,'$'
    msgErrorCeroStockVentas db 'ERROR ----> El producto ya no tiene unidades disponibles',10,13,'$'

;Finales de interfaces (salida, existencia de usuarios, existe o no el archivo) *******************************
    msgArchivo db 'ERROR ----> El archivo inexistente...',10,13,'$'
    msgUsuario db 'ERROR ----> No se encontro Clave o Usuario...',10,13,'$'
    FinPrograma db 0ah,'¡¡---- Hemos terminado, Gracias Por Usar el Sistema de Ventas USAC ---- !!$'

;Variables De Caracteres, Usuario y Contra*****************************************
  
    literaldia db 0d
    literalmes db 0d
    literalanio dw 0d
    
    literalhora db 0d
    literalminuto db 0d

    hanldeReporte dw 0d ; Handle del archivo temporal
    hanldetemp dw 0d ; Handle del archivo temporal
    hanldetempVenta dw 0d ; Handle del archivo temporal
    DataArchivo db 56d dup('$') ;14 [credentials]

    usuarioArchivo db 50 dup('$') ;usuario
    claveArchivo db 50 dup('$')  ;clave

    validar1 db 0b ;booleano
    validar2 db 0b ;booleano

    validarEsMayuscula db 0b ;booleano
    validarEsMinuscula db 0b ;booleano
    validarEsNumero db 0b ;booleano
    validarEsSimbolo db 0b ;booleano

    ;Varibles para productos  (se guarda producto, descripcion, unidades, buscar)*************
        codigoProducto db 4 dup('$')
        descripcionProducto db 32 dup('$')
        precioProducto db 2 dup('$')
        unidadesProducto db 2 dup('$')
        codigoBuscarProducto db 4 dup('?')

    ;Varibles para Ventas (cantidades, maxventas, totalventa)****************************
        
        ;ventas de reporte*******************************
        contarCantidadVentas dw 0d
        contarMaxVentas dw 0d
        contarMinVentas dw 65535d
        indiceMaxVentas dw 0d
        indiceMinVentas dw 0d

        totalVenta dw 0d
        subtotalVenta dw 0d
        itemsContador dw 0d
        finVenta db 'fin'
        unidadesVentas db 2 dup('$')
        unidadesVentasNum dw 0d
        unidadesVentasNumTemp db 0d
        precioVentasNum dw 0d
        unidadesProductoNum dw 0d

        ;Visializacion de ventas************************* 
        diaVenta db 2 dup('$')
        mesVenta db 2 dup('$')
        anioVenta db 4 dup('$')
        horaVenta db 2 dup('$')
        minutoVenta db 2 dup('$')
        codigoVenta db 4 dup('$')
        unidadesVenta db 2 dup('$')
        totalVentaPrint db 4 dup('$')

        ;Generacion de HTML********************************
        headHtml db "<!DOCTYPE html> <html> <head> <title>Reporte Sistema USAC</title> <style> table { border-collapse: collapse; width: 100%; border: 1px solid #CD5C5C; } th, td { border: 1px solid black; padding: 10px; text-align: left; vertical-align: middle; } "
        styleHTML db "body{background-color: rgb(251,252, 252);} th { background-color: #F08080; color: #000000; }tr:nth-child(even) { background-color: #E9967A; }tr:hover { background-color: #e0e0e0; color: #fff; }</style> </head>"
        bodyHtml1 db "<body><center><h1 style='font-family:sans-serif;'>Catalogo completo</h1></center> "
        bodyHtml2 db "<body><center><h1 style='font-family:sans-serif;'>Reporte alfabetico de productos</h1></center> "
        bodyHtml4 db "<body><center><h1 style='font-family:sans-serif;'>Reporte de productos sin existencias</h1></center> "
        

        initScripHTML db "<script>const currentDate = new Date(); const fecha = currentDate.getDate() + '/' + (currentDate.getMonth() + 1) + '/' + currentDate.getFullYear(); const tiempo = currentDate.getHours() + ':' + currentDate.getMinutes() + 'hrs';"
        middleScripHTML db "const fechaElement = document.createElement('h2'); fechaElement.textContent = 'Fecha: ' + fecha; document.querySelector('body').insertBefore(fechaElement, document.querySelector('h2'));"
        endScripHTML db "const tiempoElement = document.createElement('h2'); tiempoElement.textContent = 'Tiempo: ' + tiempo; document.querySelector('body').insertBefore(tiempoElement, document.querySelector('h2')); </script>"

        TheadHtml db "<table> <thead> <tr> <th>Codigo</th> <th>Descripcion</th> <th>Precio Q</th> <th>Unidades</th> </tr> </thead> <tbody> <script>"
        
        sortHTML db "array.sort((a, b) => a.descripcion.localeCompare(b.descripcion));"
        SinUnidadesHTML db "array = array.filter(producto => producto.unidades === 0);"

        ; const
        InitforHTML db "for (let i = 0; i < array.length; i++) {"
        createsForHTML db "const row = document.createElement('tr'); const idCell = document.createElement('td'); const nameCell = document.createElement('td'); const valueCell = document.createElement('td'); const unitsCell = document.createElement('td');"
        getVluesForHTML db "idCell.textContent = array[i].codigo; nameCell.textContent = array[i].descripcion; valueCell.textContent = array[i].precio.toString().padStart(2, '0');; unitsCell.textContent = array[i].unidades.toString().padStart(2, '0');;"
        appendForHTML db "row.appendChild(idCell); row.appendChild(nameCell); row.appendChild(valueCell); row.appendChild(unitsCell); document.querySelector('tbody').appendChild(row);"
        EndforHTML db "}"

        endHtml db '</script> </tbody> </table> '
        endHtml2 db ' </body> </html>'
        ; -- objeto     
        inicioObjeto db '{'
        finObjeto db '}'
        comaObjeto db ','
        arrStartObjeto db 'var array = ['
        arrEndObjeto db '];'
        ; -- objeto Producto
        codigoObjetoP db "codigo: 'XXXX',"
        descripcionObjetoP db "descripcion: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',"
        precioObjetoP db "precio: parseInt('XX',10),"
        unidadesObjetoP db "unidades: parseInt('XX',10)"

        ; -- objeto Venta
        division db "========================================"
        division2 db "----------------------------------------"
        enterP db  ' ',10,13,' '
        spacioP db  ' '
        dospuntosP db  ':'
        barrapuntosP db  '/'
        FainlP db  '.00'
        FainlPP db  'Q.'
        FainlPHrs db  'hrs'
;--------------------- Reportes
        UltimasPVentas db "Ultimas Ventas:"
        FechaPVentas db "Fecha:"
        MontoPVentas db "Monto:"
        VentaMayorP db "Venta con mayor monto:"
        VentaMenorP db "Venta con menor monto:"

        diaObjeto db "dia: parseInt('XX',10),"
        mesObjeto db "mes: parseInt('XX',10),"
        anioObjeto db "anio: parseInt('XXXX',10),"
        horaObjeto db "hora: parseInt('XX',10),"
        minutosObjeto db "minutos: parseInt('XX',10),"
        codigoObjeto db "codigo: 'XXXX',"
        unidadesObjeto db "unidades: parseInt('XX',10),"
        subtotalObjeto db "subtotal: parseInt('XX  ',10)"
       



.code

    main proc
        mov dx, @data  
        mov ds , dx  
        xor dx,dx 
        ; --------------------- Principio bienvenida
        InicioPorgramaM

        ; --------------------- Enter para continuar   
        EsperandoEnterM

        ; --------------------- Menu Principal
        MenuPincipalM

        ; --------------------- Menu Productos
        MenuProductosM

        ; Ingresar Producto ---------------------
        IngresarProductoM

        ; Eliminar Producto ---------------------
        EliminacionProdcutoM

        ; Visualizar Productor ---------------------
        VisualizarProductoM
            
        ; --------------------- Menu Ventas
        MenuVentasM

        ; Realizar Venta ---------------------
        RealizarVentaM
        
        ; Visualizar Ventas ---------------------
        VerVentasM
        
        ; --------------------- Menu Herramientas
        MenuHerramientasM

        ; Catalogo Completo ---------------------
        ReporteCatalogoCompletoM

        ; Catalogo Alfabetico ---------------------
        ReporteCatalogoAlfabeticoM

        ; Ventas ---------------------
        ReporteVentasM

        ; Sin Unidades ---------------------
        ReporteProductosCeroM

        ; ------- Salidas del programa
        SalirTodoProgramaM

        ; .exit
    main ENDP  
   
end main

