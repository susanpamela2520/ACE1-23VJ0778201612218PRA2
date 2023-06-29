InicioPorgramaM macro
   println FistMesg
   println welcome 
   println credentiasl

   abrirF rutaUser,hanldetemp
   leerF SIZEOF DataArchivo, DataArchivo, hanldetemp
   cerrarF hanldetemp

   ; println DataArchivo
   ; sizeCadena DataArchivo
   ObtenerUsuarioClave 
   ValidarUsuarioClave
endm

EsperandoEnterM macro
   LOCAL PresionaEnter
   println pressEnter
   PresionaEnter:
      mov ah,07h  ; No imprimible
      int 21h
      cmp al,  13d
      jne PresionaEnter
endm

MenuPincipalM macro
   LeerMenuPrincipal:
      LimpiarPantalla
      println MenuPrincipal
      getChar
      cmp al,  '1'
      je LeerMenuProductos
      cmp al,  '2'
      je LeerMenuVentas
      cmp al,  '3'
      je LeerMenuHerramientas
      cmp al,  '4'
      je exitPrograma
      jmp LeerMenuPrincipal
endm

MenuProductosM macro
   LeerMenuProductos:
      LimpiarPantalla
      println MenuProductos
      getChar
      cmp al,  '1'
      je InicioIngresarProducto
      cmp al,  '2'
      je InicioEliminarProducto
      cmp al,  '3'
      je InicioVisualizarProducto
      cmp al,  '4'
      je LeerMenuPrincipal
      jmp LeerMenuProductos
endm

MenuVentasM macro
    LeerMenuVentas:
      LimpiarPantalla
      println MenuVentas
      getChar
      cmp al,  '1'
      je InicioRealizarVenta
      cmp al,  '2'
      je LeerMenuPrincipal
      cmp al,  '3'
      je InicioVisualizarVentas
      jmp LeerMenuVentas

endm

MenuHerramientasM macro
   LeerMenuHerramientas:
      LimpiarPantalla
      println MenuHerramientas
      getChar
      cmp al,  '1'
      je CatalogoCampleto
      cmp al,  '2'
      je CatalogoAlfabetico
      cmp al,  '3'
      je ReporteVentas
      cmp al,  '4'
      je CatalogoSinUnidades
      cmp al,  '5'
      je LeerMenuPrincipal
      jmp LeerMenuHerramientas

endm

SalirTodoProgramaM macro
   jmp exitPrograma

   exitProgramaUsuario:
   println msgUsuario
   jmp exitPrograma

   exitProgramaArchivo:
   println msgArchivo

   exitPrograma:
   print FinPrograma
   FinalizarPrograma
        
endm

ReporteCatalogoCompletoM macro
   CatalogoCampleto:
         abrirNonExist rutaProductos,hanldetemp
         getChar
         GenerarCatalogoCampleto
         cerrarF hanldetemp

         println msgReporte1
         EsperandoEnterM
   jmp LeerMenuHerramientas
endm

ReporteCatalogoAlfabeticoM macro
   CatalogoAlfabetico:
      abrirNonExist rutaProductos,hanldetemp
      GenerarCatalogoAlfabetico
      cerrarF hanldetemp

      println msgReporte1
      EsperandoEnterM
   jmp LeerMenuHerramientas
endm

ReporteVentasM macro
   ReporteVentas:
      abrirNonExist rutaVenta,hanldetempVenta
      InitReportesVentas

      deleteF rutaVentasRep
      abrirNonExist rutaVentasRep,hanldeReporte

      GenerateLast5Ventas
      GenerateSpecifico indiceMaxVentas,VentaMayorP
      GenerateSpecifico indiceMinVentas,VentaMenorP

      cerrarF hanldetempVenta
      cerrarF hanldeReporte

      println msgReporte1
      EsperandoEnterM
   jmp LeerMenuHerramientas
endm

ReporteProductosCeroM macro
   CatalogoSinUnidades:
      abrirNonExist rutaProductos,hanldetemp
      GenerarSinExistenvias
      cerrarF hanldetemp

      println msgReporte1
      EsperandoEnterM
   jmp LeerMenuHerramientas
endm

RealizarVentaM macro
   InicioRealizarVenta:
      mov itemsContador,0d
      mov totalVenta,0d

      CicloItems:
      mov subtotalVenta,0d
      abrirNonExist rutaProductos,hanldetemp
      mov si, itemsContador
      cmp si,10d
      je ErrorMaxItems
   
      ; -- Ingreso de codigo
      ObtenerRequerimientoProducto msgVentaProductoCodigo,codigoProducto,5d

      compararArray SIZE finVenta, finVenta, codigoProducto
      cmp validar1,0b ; coinciden
      je CompletarVenta

      ; -- Resumen
      ;printLimitedln SIZEOF codigoProducto,codigoProducto
      BucarProducto
         
      cmp validar2,0b
      je ErrorBuscarVenta

      mov di,desProductos
      add di,4d
      add di,32d
      leerFDesplazado SIZEOF precioProducto,precioProducto,hanldetemp,di
      add di,2d
      leerFDesplazado SIZEOF unidadesProducto,unidadesProducto,hanldetemp,di
      
      cadenaToSword2 precioProducto,precioVentasNum
      cadenaToSword2 unidadesProducto,unidadesProductoNum

   
      cmp unidadesProductoNum,0d
      je ErrorCeroStock
      
      ; -- Ingreso de unidades a vender
      pedirUnidadesVenta:
      ObtenerRequerimientoProducto msgIngreseCantidad,unidadesVentas,3d
      cadenaToSword2 unidadesVentas,unidadesVentasNum
      
   
      cmp unidadesVentasNum,0d
      je ErrorCeroUnidades

      ; validar hay stock para la vente

      mov ax,unidadesProductoNum
      cmp unidadesVentasNum,ax
      ja ErrorMayorAStock

      ; descontar stock
   
      mov ax,unidadesVentasNum
      sub unidadesProductoNum,ax

      Sword2Tocadena unidadesProductoNum, unidadesProducto

      
      mov di,desProductos
      add di,4d
      add di,32d
      add di,2d
      editarFDesplazado SIZEOF unidadesProducto,unidadesProducto,hanldetemp,di

      ; sumar total venta
      
      mov ax,unidadesVentasNum
      mov bx,precioVentasNum
      mul bx
      mov subtotalVenta,ax
      add totalVenta,ax

      
      Fecha
      Hora

      ; -- Guardar Venta
      abrirNonExist rutaVenta,hanldetempVenta
      BucarVacioVentas
      EscribirVentas
      cerrarF hanldetempVenta

      ; -- resumen
      cerrarF hanldetemp
      inc itemsContador
      println msgProductoAgregado
      println msgTotalPagar
      mov ax,totalVenta
      PAnyNumber
      EsperandoEnterM
      LimpiarPantalla
      jmp CicloItems

      ErrorMayorAStock:
            println msgErrorMayorAStockVentas
            EsperandoEnterM
            LimpiarPantalla
            jmp pedirUnidadesVenta

      ErrorCeroUnidades:
            println msgErrorCeroUnidadesVentas
            EsperandoEnterM
            LimpiarPantalla
            jmp pedirUnidadesVenta

      ErrorCeroStock:
            println msgErrorCeroStockVentas
            cerrarF hanldetemp
            EsperandoEnterM
            LimpiarPantalla
            jmp CicloItems

      ErrorBuscarVenta:
            println msgErrorBuscarCodigoProducto
            cerrarF hanldetemp
            EsperandoEnterM
            LimpiarPantalla
            jmp CicloItems

      ErrorMaxItems:
            EsperandoEnterM
            LimpiarPantalla
            println msgErrorMaxVentas
      
      CompletarVenta:
            cerrarF hanldetemp
            cmp itemsContador,0d
            je ErrorCeroItems
            println msgVentaProductoExito
            mov ax,itemsContador
            PAnyNumber
            EsperandoEnterM
            LimpiarPantalla
            jmp TerminoVenta

      ErrorCeroItems:
            println msgErrorNoItemsVentas
            EsperandoEnterM
         
      
      TerminoVenta:
      

   jmp LeerMenuVentas

endm

VerVentasM macro
   InicioVisualizarVentas:
      LimpiarPantalla
      printLimitedln SIZEOF ArrHeadVenta,ArrHeadVenta 
      printLimitedln SIZEOF ArrRowVenta,ArrRowVenta 
      
      abrirNonExist rutaVenta,hanldetempVenta
      verVentas
      cerrarF hanldetempVenta
      printLimitedln SIZEOF ArrRowVenta,ArrRowVenta 
   
   jmp LeerMenuVentas
endm

IngresarProductoM macro
   InicioIngresarProducto:
         println msgIngresoProducto
         ; -- Ingreso de codigo
         ObtenerRequerimientoProducto msgIngresoProductoCodigo,codigoProducto,1d
         
         ; -- Ingreso de descripcion
         ObtenerRequerimientoProducto msgIngresoProductoDescripcion,descripcionProducto,2d
         
         ; -- Ingreso de precio
         ObtenerRequerimientoProducto msgIngresoProductoPrecio,precioProducto,3d
         
         ; -- Ingreso de unidades
         ObtenerRequerimientoProducto msgIngresoProductoUnidades,unidadesProducto,3d
         
         ; -- Resumen
         ;printLimitedln SIZEOF codigoProducto,codigoProducto
         ;printLimitedln SIZEOF descripcionProducto,descripcionProducto
         ;printLimitedln SIZEOF precioProducto,precioProducto
         ;printLimitedln SIZEOF unidadesProducto,unidadesProducto

         ; -- Unir datos
         LimpiarLimited SIZEOF ArrProducto,ArrProducto,'$'

         InsertarEnArray ArrProducto,codigoProducto,0d, SIZEOF codigoProducto
         InsertarEnArray ArrProducto,descripcionProducto,4d, SIZEOF descripcionProducto
         InsertarEnArray ArrProducto,precioProducto,36d, SIZEOF precioProducto
         InsertarEnArray ArrProducto,unidadesProducto,38d, SIZEOF unidadesProducto

         ;printLimitedln SIZEOF ArrProducto,ArrProducto

         ; -- Abrir archivo
         abrirNonExist rutaProductos,hanldetemp

         ; -- Validar si ya existar codigo
         BucarProducto
         cmp validar2,0b
         jne ErrorCodigoExistente

         ; -- Guardar en archivo
         BucarVacioProducto
         editarFDesplazado SIZEOF ArrProducto,ArrProducto,hanldetemp,desProductos
         println msgProductoInsertado
         EsperandoEnterM
         jmp FinInsertarProducto

         ErrorCodigoExistente:
               println msgErrorCodigoEcistenteProducto
               EsperandoEnterM

         FinInsertarProducto:        
               cerrarF hanldetemp

   jmp LeerMenuProductos

endm

EliminacionProdcutoM macro
   InicioEliminarProducto:
      ; -- Ingreso de codigo
      ObtenerRequerimientoProducto msgEliminacionProductoCodigo,codigoProducto,1d

      ; -- Resumen
      ;printLimitedln SIZEOF codigoProducto,codigoProducto

      abrirNonExist rutaProductos,hanldetemp
      BucarProducto 
      
      cmp validar2,0b
      je ErrorBuscarEliminar

      LimpiarLimited SIZEOF ArrProducto,ArrProducto,'0'
      editarFDesplazado SIZEOF ArrProducto,ArrProducto,hanldetemp,desProductos    
      println msgProductoEliminado
      EsperandoEnterM
      jmp FinEliminarProducto

      ErrorBuscarEliminar:
            println msgErrorBuscarCodigoProducto
            EsperandoEnterM

      FinEliminarProducto:        
            cerrarF hanldetemp

   jmp LeerMenuProductos
endm

VisualizarProductoM macro
   InicioVisualizarProducto:
      LimpiarPantalla
      ;printLimitedln SIZEOF codigoProducto,codigoProducto 
      printLimitedln SIZEOF ArrHeadProducro,ArrHeadProducro 
      printLimitedln SIZEOF ArrRowProducro,ArrRowProducro 
   
      abrirNonExist rutaProductos,hanldetemp
      ImprimirProductos
      cerrarF hanldetemp
      printLimitedln SIZEOF ArrRowProducro,ArrRowProducro 
      EsperandoEnterM
   jmp LeerMenuProductos
endm

