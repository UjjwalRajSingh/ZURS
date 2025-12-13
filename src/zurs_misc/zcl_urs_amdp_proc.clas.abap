CLASS zcl_urs_amdp_proc DEFINITION
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



CLASS zcl_urs_amdp_proc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lv_method) = 01.

    CASE lv_method.
        WHEN 01.
            zcl_urs_amdp_func=>get_tax_amount(
              EXPORTING
                iv_amount   = 1000
                iv_tax_rate = 7
              IMPORTING
                rv_value    = DATA(lv_data)
            ).

        WHEN 02.
    ENDCASE.


    out->write(
      EXPORTING
        data   = lv_data
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
