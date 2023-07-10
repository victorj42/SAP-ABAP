DATA: lt_fields TYPE TABLE OF dfies,
      ls_fields LIKE LINE OF lt_fields.

ls_fields-fieldname = 'CLIENTE_ID'.
ls_fields-ROLLNAME = 'ZCLIENTES'.
ls_fields-DATATYPE = 'CHAR'.
ls_fields-LENG = 10.
APPEND ls_fields TO lt_fields.
CLEAR ls_fields.

ls_fields-fieldname = 'NOMBRE'.
ls_fields-ROLLNAME = 'ZCLIENTES'.
ls_fields-DATATYPE = 'CHAR'.
ls_fields-LENG = 50.
APPEND ls_fields TO lt_fields.
CLEAR ls_fields.

ls_fields-fieldname = 'DIRECCION'.
ls_fields-ROLLNAME = 'ZCLIENTES'.
ls_fields-DATATYPE = 'CHAR'.
ls_fields-LENG = 100.
APPEND ls_fields TO lt_fields.
CLEAR ls_fields.

ls_fields-fieldname = 'TELEFONO'.
ls_fields-ROLLNAME = 'ZCLIENTES'.
ls_fields-DATATYPE = 'CHAR'.
ls_fields-LENG = 20.
APPEND ls_fields TO lt_fields.
CLEAR ls_fields.

CALL FUNCTION 'DDIF_TABL_GET_AND_PUT'
  EXPORTING
    operation = 'INS'
    name      = 'ZCLIENTES'
  TABLES
    dfies_tab = lt_fields.

IF sy-subrc = 0.
  WRITE: 'Tabla ZCLIENTES creada exitosamente.'.
ELSE.
  WRITE: 'Error al crear la tabla ZCLIENTES.'.
ENDIF.
