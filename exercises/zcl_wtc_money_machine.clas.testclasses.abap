*"* use this source file for your ABAP unit test classes
class ltc_money_machine definition for testing
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    DATA m_cut TYPE REF TO zcl_wtc_money_machine.

    METHODS setup.

    methods sort_change
        importing it_change type zcl_wtcr_money_machine=>tt_change
        returning value(rt_change) type zcl_wtcr_money_machine=>tt_change.

    "! Amount of 1 EUR results in 1 EUR coin
    METHODS amount_1_coin_1 FOR TESTING RAISING cx_static_check.
    "! Amount of 2 EUR results in 2 EUR coins
    METHODS amount_2_coin_2 FOR TESTING RAISING cx_static_check.
    "! Amount of 29 EUR results in 4 EUR coins
    METHODS amount_29_coin_4 FOR TESTING RAISING cx_static_check.

    "! Amount of 4 EUR results in 0 EUR notes
    METHODS amount_4_notes_0 FOR TESTING RAISING cx_static_check.
    "! Amount of 29 EUR results in 25 EUR notes
    METHODS amount_29_notes_25 FOR TESTING RAISING cx_static_check.

    methods get_change_for_amount_0 for testing.
    methods get_change_for_amount_minus_11 for testing.
    methods get_change_for_amount_1 for testing.
    methods get_change_for_amount_2 for testing.
    methods get_change_for_amount_3 for testing.
    methods get_change_for_amount_4 for testing.
    methods get_change_for_amount_5 for testing.
    methods get_change_for_amount_8 for testing.
    methods get_change_for_amount_10 for testing.
    methods get_change_for_amount_15 for testing.
    methods get_change_for_amount_20 for testing.
    methods get_change_for_amount_50 for testing.
    methods get_change_for_amount_85 for testing.
    methods get_change_for_amount_100 for testing.
    methods get_change_for_amount_200 for testing.
    methods get_change_for_amount_500 for testing.
    methods get_change_for_amount_388 for testing.
    methods get_change_for_amount_688 for testing.
endclass.

CLASS ltc_money_machine IMPLEMENTATION.
  METHOD setup.
    "given
    m_cut = NEW #( ).
  ENDMETHOD.

  METHOD amount_1_coin_1.
    "when
    DATA(coin_amount) = m_cut->get_amount_in_coins( 1 ).

    "then
    cl_abap_unit_assert=>assert_equals( act = coin_amount
                                        exp = 1 ).
  ENDMETHOD.

  METHOD amount_2_coin_2.
    "when
    DATA(coin_amount) = m_cut->get_amount_in_coins( 2 ).

    "then
    cl_abap_unit_assert=>assert_equals( act = coin_amount
                                        exp = 2 ).
  ENDMETHOD.

  METHOD amount_29_coin_4.
    "when
    DATA(coin_amount) = m_cut->get_amount_in_coins( 29 ).

    "then
    cl_abap_unit_assert=>assert_equals( act = coin_amount
                                        exp = 4 ).
  ENDMETHOD.

  METHOD amount_4_notes_0.
    "when
    DATA(note_amount) = m_cut->get_amount_in_notes( 4 ).

    "then
    cl_abap_unit_assert=>assert_equals( act = note_amount
                                        exp = 0 ).
  ENDMETHOD.

  METHOD amount_29_notes_25.
    "when
    DATA(note_amount) = m_cut->get_amount_in_notes( 29 ).

    "then
    cl_abap_unit_assert=>assert_equals( act = note_amount
                                        exp = 25 ).
  ENDMETHOD.

  METHOD get_change_for_amount_minus_11.
    cl_abap_unit_assert=>assert_initial( m_cut->get_change( -11 ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_0.
    cl_abap_unit_assert=>assert_initial( m_cut->get_change( 0 ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_1.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 1 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 1   type = 'coin' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_2.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 2 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 2   type = 'coin' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_3.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 3 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 2   type = 'coin' )
                                                ( amount = 1   type = 'coin' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_4.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 4 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 2   type = 'coin' )
                                                ( amount = 2   type = 'coin' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_5.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 5 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 5   type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_8.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 8 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 5   type = 'note' )
                                                ( amount = 2   type = 'coin' )
                                                ( amount = 1   type = 'coin' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_10.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 10 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 10  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_15.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 15 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 10  type = 'note' )
                                                ( amount = 5   type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_20.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 20 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 20  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_50.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 50 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 50  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_85.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 85 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 50  type = 'note' )
                                                ( amount = 20  type = 'note' )
                                                ( amount = 10  type = 'note' )
                                                ( amount =  5  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_100.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 100 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 100  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_200.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 200 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 200  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_500.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 500 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 500  type = 'note' ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_388.
    cl_abap_unit_assert=>assert_equals( act = sort_change( m_cut->get_change( 388 ) )
                                        exp = sort_change( VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 200 type = 'note' )
                                                ( amount = 100 type = 'note' )
                                                ( amount = 50  type = 'note' )
                                                ( amount = 20  type = 'note' )
                                                ( amount = 10  type = 'note' )
                                                ( amount = 5   type = 'note' )
                                                ( amount = 2   type = 'coin' )
                                                ( amount = 1   type = 'coin' ) ) ) ).
  ENDMETHOD.

  METHOD get_change_for_amount_688.
    cl_abap_unit_assert=>assert_equals( act = m_cut->get_change( 688 )
                                        exp = VALUE zcl_wtcr_money_machine=>tt_change(
                                                ( amount = 500 type = 'note' )
                                                ( amount = 100 type = 'note' )
                                                ( amount = 50  type = 'note' )
                                                ( amount = 20  type = 'note' )
                                                ( amount = 10  type = 'note' )
                                                ( amount = 5   type = 'note' )
                                                ( amount = 2   type = 'coin' )
                                                ( amount = 1   type = 'coin' ) ) ).
  ENDMETHOD.

  METHOD sort_change.
    rt_change = it_change.
    sort rt_change ascending.
  ENDMETHOD.

ENDCLASS.
