CLASS zcl_urs_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_opr type c VALUE 'R'.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_urs_eml IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* Change operation (CURD) value in CLASS definition
    CASE lv_opr.
        WHEN 'R'.

            READ ENTITIES OF ZURS_TRAVEL
            ENTITY Travel
            FIELDS ( travelid agencyid CustomerId OverallStatus ) WITH
            VALUE #( ( TravelId = '004946' )
                     ( TravelId = '00000051' )
                     ( TravelId = '00000061' )
                   )
            RESULT Data(lt_result)
            FAILED data(lt_failed)
            REPORTED DATA(lt_messages).

            out->write(
              EXPORTING
                data   = lt_result
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).


        WHEN 'C'.

            data(lv_description) = 'URS: EML with RAP'.
            data(lv_agency) = '070016'.
            data(lv_customer) = '000697'.

            MODIFY ENTITIES OF ZURS_TRAVEL
            ENTITY Travel
            CREATE FIELDS ( TravelId AgencyId CurrencyCode BeginDate EndDate Description OverallStatus )
            WITH VALUE #(
                            (
                              %CID = 'URS0001'
                              TravelId = '00012347'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
                            ( %CID = 'URS0002'
                              TravelId = '00012358'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
                             (
                              %CID = 'URS0003'
                              TravelId = '00000010'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
             )
             MAPPED data(lt_mapped)
             FAILED lt_failed
             REPORTED lt_messages.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

        WHEN 'U'.

            lv_description = 'URS, an Update'.
            lv_agency = '070032'.

            MODIFY ENTITIES OF ZURS_TRAVEL
            ENTITY Travel
            UPDATE FIELDS ( AgencyId Description )
            WITH VALUE #(
                            ( TravelId = '00001130'
                              AgencyId = lv_agency
                              Description = lv_description
                             )
                            ( TravelId = '00001135'
                              AgencyId = lv_agency
                              Description = lv_description
                             )
             )
             MAPPED lt_mapped
             FAILED lt_failed
             REPORTED lt_messages.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

        WHEN 'D'.

        MODIFY ENTITIES OF ZURS_TRAVEL
            ENTITY Travel
            DELETE FROM VALUE #(
                            ( TravelId = '00012347'
                             )
             )
             MAPPED lt_mapped
             FAILED lt_failed
             REPORTED lt_messages.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

    ENDCASE.
  ENDMETHOD.
ENDCLASS.
