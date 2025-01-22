CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Header.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE Header.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Header.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Header.

    METHODS read FOR READ
      IMPORTING keys FOR READ Header RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Header.

    METHODS rba_Crrempinfo FOR READ
      IMPORTING keys_rba FOR READ Header\_Crrempinfo FULL result_requested RESULT result LINK association_links.

    METHODS rba_Crrstsinfo FOR READ
      IMPORTING keys_rba FOR READ Header\_Crrstsinfo FULL result_requested RESULT result LINK association_links.

    METHODS cba_Crrempinfo FOR MODIFY
      IMPORTING entities_cba FOR CREATE Header\_Crrempinfo.

    METHODS cba_Crrstsinfo FOR MODIFY
      IMPORTING entities_cba FOR CREATE Header\_Crrstsinfo.

    METHODS earlynumbering_cba_Crrempinfo FOR NUMBERING
      IMPORTING entities FOR CREATE Header\_Crrempinfo.

    METHODS earlynumbering_cba_Crrstsinfo FOR NUMBERING
      IMPORTING entities FOR CREATE Header\_Crrstsinfo.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    zcl_crr_header_api_class=>get_instance(  )->create_header(
          EXPORTING
            entities = entities
          CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD earlynumbering_create.

    zcl_crr_header_api_class=>get_instance(  )->earlynumbering_create_header(
        EXPORTING
            entities = entities
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).

  ENDMETHOD.

  METHOD update.
    zcl_crr_header_api_class=>get_instance(  )->update_header(
       EXPORTING
           entities = entities
       CHANGING
           mapped = mapped
           failed = failed
           reported = reported
    ).
  ENDMETHOD.

  METHOD delete.
      zcl_crr_header_api_class=>get_instance(  )->delete_header(
        EXPORTING
            keys = keys
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD read.

    zcl_crr_header_api_class=>get_instance(  )->readheader(
        EXPORTING
            keys = keys
        CHANGING
            result = result
            failed = failed
            reported = reported
    ).

  ENDMETHOD.

  METHOD lock.
*        try.
*        DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZCRRHEADER' ).
*        catch cx_abap_lock_failure into DATA(exception).
*        RAISE SHORTDUMP exception.
*        endtry.
*
*        LOOP at keys ASSIGNING FIELD-SYMBOL(<lfs_header>).
*
*            try.
*                lock->enqueue(
*                  it_parameter  = VALUE #( ( name = 'TrackingID' VALUE = REF #( <lfs_header>-TrackingID ) ) )
*                ).
*                CATCH cx_abap_foreign_lock INTO DATA(foreign_lock).
*
*                    APPEND VALUE #(
*
*                    %key = keys[ 1 ]
*                    %msg = new_message_with_text(
*                            severity = if_abap_behv_message=>severity-error
*                            text = 'Record is locked by' && foreign_lock->user_name
*                    )
*                    ) TO reported-header.
*
*                   APPEND VALUE #(
*                     %key = keys[ 1 ]
*                    ) to failed-header.
*
*
*                CATCH cx_abap_lock_failure INTO exception.
*                RAISE SHORTDUMP exception.
*
*            endtry.
*          ENDLOOP.


  ENDMETHOD.

  METHOD rba_Crrempinfo.
  ENDMETHOD.

  METHOD rba_Crrstsinfo.
  ENDMETHOD.

  METHOD cba_Crrempinfo.
    zcl_crr_header_api_class=>get_instance(  )->cba_crrempinfo(
     EXPORTING
         entities_cba = entities_cba
     CHANGING
         mapped = mapped
         failed = failed
         reported = reported

 ).
  ENDMETHOD.

  METHOD earlynumbering_cba_Crrempinfo.
        zcl_crr_header_api_class=>get_instance(  )->earlynumbering_cba_crrempinfo(
        EXPORTING
            entities = entities
        CHANGING
            mapped = mapped
            failed = failed
            reported = reported
    ).
  ENDMETHOD.

  METHOD cba_Crrstsinfo.
  ENDMETHOD.

  METHOD earlynumbering_cba_Crrstsinfo.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Employee RESULT result.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Employee.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Employee.

    METHODS read FOR READ
      IMPORTING keys FOR READ Employee RESULT result.

    METHODS rba_Crrheaderinfo FOR READ
      IMPORTING keys_rba FOR READ Employee\_Crrheaderinfo FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD update.
    DATA LV_VAR.
    lv_var = 'C'.
  ENDMETHOD.

  METHOD delete.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Crrheaderinfo.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Status DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Status RESULT result.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Status.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Status.

    METHODS read FOR READ
      IMPORTING keys FOR READ Status RESULT result.

    METHODS rba_Crrheaderinfo FOR READ
      IMPORTING keys_rba FOR READ Status\_Crrheaderinfo FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_Status IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.



  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Crrheaderinfo.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZKS_I_HDR_100 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZKS_I_HDR_100 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.

    data : gt_header_tmp TYPE STANDARD TABLE OF zks_crr_hdr.






  ENDMETHOD.

  METHOD save.
    zcl_crr_header_api_class=>get_instance(  )->savedata(
      CHANGING
        reported = reported
).

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
