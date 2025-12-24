CLASS zcl_urs_aoc_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_urs_aoc_test IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DELETE FROM /dmo/log_travel.
    out->write( 'Hello ABAP on Cloud Test Run' ).
  ENDMETHOD.

ENDCLASS.
