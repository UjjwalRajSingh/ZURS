CLASS zcl_urs_amdp_func DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    INTERFACES if_oo_adt_classrun .

    CLASS-METHODS get_tax_amount AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
        IMPORTING
            VALUE(iv_amount) TYPE i
            VALUE(iv_tax_rate) TYPE i
        EXPORTING
            VALUE(rv_value) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_urs_amdp_func IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    zcl_urs_amdp_func=>get_tax_amount(
      EXPORTING
        iv_amount   = 1000
        iv_tax_rate = 7
      IMPORTING
        rv_value    = DATA(lv_tax)
    ).

    out->write(
      EXPORTING
        data   = lv_tax
*        name   =
*      RECEIVING
*        output =
    ).
  ENDMETHOD.

  METHOD get_tax_amount BY DATABASE PROCEDURE FOR HDB
                           LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.

    rv_value = :iv_amount * :iv_tax_rate / 100;
  ENDMETHOD.

ENDCLASS.
