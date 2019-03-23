class ZCL_WTC_MONEY_MACHINE definition
  public
  final
  create public .

public section.
  types: begin of ty_change,
         amount type i,
         type type string,
         end of ty_change.
  types tt_change type standard table of ty_change with default key.

  methods constructor.
  methods GET_AMOUNT_IN_COINS
    importing
      I_AMOUNT type I
    returning
      value(R_VALUE) type I .
  methods GET_AMOUNT_IN_NOTES
    importing
      I_AMOUNT type I
    returning
      value(R_VALUE) type I .
  methods get_change
    importing
      I_AMOUNT type I
    returning
      value(R_VALUES) type tt_change.

  PROTECTED SECTION.
  PRIVATE SECTION.
    data: m_ordered_amounts type tt_change.
ENDCLASS.



CLASS ZCL_WTC_MONEY_MACHINE IMPLEMENTATION.


  METHOD CONSTRUCTOR.
    m_ordered_amounts = VALUE #(
      ( amount = 500 type = 'note' )
      ( amount = 200 type = 'note' )
      ( amount = 100 type = 'note' )
      ( amount = 50  type = 'note' )
      ( amount = 20  type = 'note' )
      ( amount = 10  type = 'note' )
      ( amount = 5   type = 'note' )
      ( amount = 2   type = 'coin' )
      ( amount = 1   type = 'coin' )
    ).
  ENDMETHOD.


  METHOD get_amount_in_coins.
    r_value = COND #( WHEN i_amount <= 0
                      THEN -1
                      ELSE i_amount MOD 5 ).
  ENDMETHOD.


  METHOD get_amount_in_notes.
    r_value = i_amount - get_amount_in_coins( i_amount ).
  ENDMETHOD.

  METHOD GET_CHANGE.
    data(remaining_amount) = i_amount.
    loop at m_ordered_amounts assigning field-symbol(<ordered_amounts>).
        do remaining_amount div <ordered_amounts>-amount times.
            append <ordered_amounts> to r_values.
            subtract <ordered_amounts>-amount from remaining_amount.
        enddo.
        check remaining_amount > 0.
    endloop.
  ENDMETHOD.

ENDCLASS.
