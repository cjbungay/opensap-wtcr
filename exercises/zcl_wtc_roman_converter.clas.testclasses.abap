*"* use this source file for your ABAP unit test classes
class ltc_roman_to_arabic definition for testing
    risk level harmless
    duration short.

    private section.
        DATA: m_cut TYPE REF TO zcl_wtc_roman_converter.

        methods setup.
        methods one_in_1_out for testing.
        methods two_in_2_out for testing.
        methods three_in_3_out for testing.
        METHODS nine_in_9_out FOR TESTING RAISING cx_static_check.
        METHODS ten_in_error_out FOR TESTING RAISING cx_static_check.
        METHODS empty_in_nothing_out FOR TESTING RAISING cx_static_check.
        METHODS space_in_nothing_out FOR TESTING RAISING cx_static_check.
        METHODS invalid_in_error_out FOR TESTING RAISING cx_static_check.
        METHODS four_in_error_out FOR TESTING RAISING cx_static_check.
        METHODS five_in_error_out FOR TESTING RAISING cx_static_check.
        METHODS twohundred_in_200_out FOR TESTING RAISING cx_static_check.
        METHODS fivehundred_in_500_out FOR TESTING RAISING cx_static_check.
        METHODS twothousandseven_in_2007_out FOR TESTING RAISING cx_static_check.

endclass.

CLASS ltc_roman_to_arabic IMPLEMENTATION.
  method setup.
    "given
        m_cut = new ZCL_WTC_ROMAN_CONVERTER( ).
  endmethod.

  METHOD one_in_1_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'I' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '1' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD two_in_2_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'II' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '2' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD three_in_3_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'III' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '3' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD nine_in_9_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'IX' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '9' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD ten_in_error_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'VV' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '-1' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD empty_in_nothing_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = '' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD space_in_nothing_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = space ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD invalid_in_error_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'AA' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '-1' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD four_in_error_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'IIII' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '-1' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD five_in_error_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'VX' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '-1' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD twohundred_in_200_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'CC' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '200' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD fivehundred_in_500_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'D' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '500' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.

  METHOD twothousandseven_in_2007_out.
    "when
        data(arabic) = m_cut->TO_ARABIC( I_ROMAN_NUMERAL = 'MMVII' ).
    "then
        cl_abap_unit_assert=>ASSERT_EQUALS(
          exporting
            ACT                  =     arabic" Data object with current value
            EXP                  =     '2007' " Data object with expected type
            MSG                  =     'Wrong number' " Description
        ).
  ENDMETHOD.
ENDCLASS.
