*&---------------------------------------------------------------------*
*&  Include           ZHR_FACTURAS_TOP
*&---------------------------------------------------------------------*

REPORT  zhr_facturas.
data: param,lt_output type string.

DATA: BEGIN OF ty_cliente,
         cliente_id TYPE c LENGTH 10,
         nombre TYPE string,
         direccion TYPE string,
         telefono TYPE string,
       END OF ty_cliente.

DATA: BEGIN OF ty_producto,
         producto_id TYPE c LENGTH 10,
         descripcion TYPE string,
         precio TYPE p LENGTH 10 DECIMALS 2,
       END OF ty_producto.

DATA: BEGIN OF ty_factura,
         factura_id TYPE c LENGTH 10,
         cliente_id TYPE c LENGTH 10,
         producto_id TYPE c LENGTH 10,
         cantidad TYPE i,
         total TYPE p LENGTH 10 DECIMALS 2,
       END OF ty_factura.

DATA: lt_clientes LIKE TABLE OF ty_cliente,
      lt_productos LIKE TABLE OF ty_producto,
      lt_facturas LIKE TABLE OF ty_factura.
