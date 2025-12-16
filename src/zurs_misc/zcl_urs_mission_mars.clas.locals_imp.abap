*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS zcl_earth DEFINITION.
    public section.
        METHODS start_engine RETURNING value(r_value) type string.
        METHODS leave_orbit RETURNING value(r_value) type string.
ENDCLASS.
CLASS zcl_earth IMPLEMENTATION.
        METHOD start_engine.
            r_value = 'We take off from planet Earth for mission Mars'.
        ENDMETHOD.
        METHOD leave_orbit.
            r_value = 'We leave earth orbit'.
        ENDMETHOD.
ENDCLASS.

CLASS zcl_planet1 DEFINITION.
    PUBLIC SECTION.
        METHODS enter_orbit RETURNING value(r_value) type string.
        METHODS leave_orbit RETURNING value(r_value) type string.
ENDCLASS.
CLASS zcl_planet1 IMPLEMENTATION.
        METHOD enter_orbit.
            r_value = 'We enter planet 1 orbit'.
        ENDMETHOD.
        METHOD leave_orbit.
            r_value = 'We leave planet 1 orbit'.
        ENDMETHOD.
ENDCLASS.

CLASS zcl_mars DEFINITION.
    PUBLIC SECTION.
        METHODS enter_orbit RETURNING value(r_value) type string.
        METHODS explore_mars RETURNING value(r_value) type string.
ENDCLASS.
CLASS zcl_mars IMPLEMENTATION.
        METHOD enter_orbit.
            r_value = 'We enter in Mars orbit'.
        ENDMETHOD.
        METHOD explore_mars.
            r_value = 'Roger! We found water on mars!!'.
        ENDMETHOD.
ENDCLASS.
