CLASS zcl_crr_num_range DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_crr_num_range IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA : lv_norange  TYPE REF TO cl_numberrange_objects,
         lv_interval TYPE REF TO cl_numberrange_intervals,
         lv_runtime  TYPE REF TO cl_numberrange_runtime.

  DATA : nr_attribute  TYPE cl_numberrange_objects=>nr_attribute,
         obj_text      TYPE cl_numberrange_objects=>nr_obj_text,
         lv_returncode TYPE cl_numberrange_objects=>nr_returncode,
         lv_errors     TYPE cl_numberrange_objects=>nr_errors,
         nr_interval   TYPE cl_numberrange_intervals=>nr_interval,
         st_interval   LIKE LINE OF nr_interval,
         nr_number     TYPE cl_numberrange_runtime=>nr_number,
         nr_interval1  TYPE cl_numberrange_runtime=>nr_interval,
         error         TYPE cl_numberrange_intervals=>nr_error,
         error_inf     TYPE cl_numberrange_intervals=>nr_error_inf,
         error_iv      TYPE cl_numberrange_intervals=>nr_error_iv,
         warning       TYPE cl_numberrange_intervals=>nr_warning,
         lv_object   TYPE cl_numberrange_objects=>nr_attributes-object,
         z_num_range TYPE cl_numberrange_intervals=>nr_object.

         lv_object = 'ZNUM_RANG'.


  nr_attribute-buffer = 'X'.
*  nr_attribute-object = '_RANGE'.
  nr_attribute-object = 'ZNUM_RANG'.
  nr_attribute-domlen = 'ZCRR_ID'.
  nr_attribute-percentage = 5.

*  nr_attribute-devclass = 'ZBP_KS_I_HDR_100' .
  nr_attribute-devclass = 'ZCL_CRRR_HEADER_API_CLASS' .
  obj_text-langu = 'E'.
  obj_text-object = 'ZNUM_RANG'.
  obj_text-txt = 'Testing Num Range'.
  obj_text-txtshort = 'Test'.

  st_interval-subobject = ''.
  st_interval-nrrangenr = '01'.
* st_INTERVAL-toyear
  st_interval-fromnumber  = '1000000000'.
  st_interval-tonumber    = '9999999999'.
  st_interval-procind     = 'I'.

  APPEND st_interval TO nr_interval.

*    TRY.
*      cl_numberrange_objects=>create(
*      EXPORTING
*          attributes                = nr_attribute
*          obj_text                  = obj_text
*      IMPORTING
*          errors = lv_errors
*          returncode = lv_returncode )
*         .
*    CATCH cx_number_ranges INTO DATA(lx_number_range).
*  ENDTRY.

*    TRY.
*      CALL METHOD cl_numberrange_intervals=>create
*        EXPORTING
*          interval  = nr_interval
*          object    = 'ZNUM_RANG'
*          subobject = ''
*        IMPORTING
*          error     = error
*          error_inf = error_inf
*          error_iv  = error_iv.
*    CATCH  cx_nr_object_not_found INTO DATA(lx_no_obj_found).
*    catch CX_NUMBER_RANGES into data(cx_number_ranges).

*  ENDTRY.


        TRY.
            cl_numberrange_runtime=>number_get(
              EXPORTING
*            ignore_buffer     =
                nr_range_nr       = '01'
                object            = 'ZNUM_RANG'
*            quantity          = CONV #( lines( lt_entities_to_gen ) )
*        subobject         =
*        toyear            =
              IMPORTING
                number            = data(number_range_key)
                returncode        = data(number_range_return_code)
                returned_quantity = data(number_range_returned_quantity)
            ).

            out->write( 'Number is got' ).

          CATCH cx_number_ranges.
            "handle exception
            out->write( 'Number is not got' ).
        ENDTRY.

        if sy-subrc = 0.
        ENDIF.



  ENDMETHOD.

ENDCLASS.




