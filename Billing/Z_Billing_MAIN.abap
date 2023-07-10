*&---------------------------------------------------------------------*
*&  Include           ZHR_FACTURAS_MAIN
*&---------------------------------------------------------------------*

DATA: lv_counter TYPE i.

* Rellenar tabla lt_clientes
DO 100 TIMES.
  ty_cliente-cliente_id = `C` && sy-index.
  ty_cliente-nombre = `Nombre Cliente` && sy-index.
  ty_cliente-direccion = `Dirección Cliente` && sy-index.
  ty_cliente-telefono = `Teléfono Cliente` && sy-index.
  INSERT ty_cliente INTO TABLE lt_clientes.
ENDDO.

* Rellenar tabla lt_productos
DO 100 TIMES.
  ty_producto-producto_id = `P` && sy-index.
  ty_producto-descripcion = `Descripción Producto` && sy-index.
  ty_producto-precio = sy-index * 10.
  INSERT ty_producto INTO TABLE lt_productos.
ENDDO.

* Rellenar tabla lt_facturas
DO 100 TIMES.
  ty_factura-factura_id = `F` && sy-index.
  ty_factura-cliente_id = `C` && sy-index.
  ty_factura-producto_id = `P` && sy-index.
  ty_factura-cantidad = sy-index.
  ty_factura-total = sy-index * 100.
  INSERT ty_factura INTO TABLE lt_facturas.
ENDDO.

PARAMETERS: p_clntid LIKE ty_cliente-cliente_id,
            p_nombre LIKE ty_cliente-nombre,
            p_direcc LIKE ty_cliente-direccion,
            p_telefn LIKE ty_cliente-telefono.

SELECTION-SCREEN BEGIN OF BLOCK b1.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(8) text-001 FOR FIELD p_clntid.
SELECTION-SCREEN COMMENT 12(8) text-002 FOR FIELD p_nombre.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(8) text-003 FOR FIELD p_direcc.
SELECTION-SCREEN COMMENT 12(8) text-004 FOR FIELD p_telefn.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK b1.


START-OF-SELECTION.
  " Código para procesar los datos ingresados y mostrar los resultados


  LOOP AT lt_clientes INTO ty_cliente WHERE cliente_id = p_clntid.
    WRITE: / 'Cliente ID:', ty_cliente-cliente_id.
    WRITE: / 'Nombre:', ty_cliente-nombre.
    WRITE: / 'Dirección:', ty_cliente-direccion.
    WRITE: / 'Teléfono:', ty_cliente-telefono.
    WRITE: /.
  ENDLOOP.


  LOOP AT lt_facturas INTO ty_factura WHERE cliente_id = p_clntid.
    WRITE: / 'Factura ID:', ty_factura-factura_id.
    WRITE: / 'Producto ID:', ty_factura-producto_id.
    WRITE: / 'Cantidad:', ty_factura-cantidad.
    WRITE: / 'Total:', ty_factura-total.
    WRITE: /.
  ENDLOOP.
