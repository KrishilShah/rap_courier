CLASS zcl_crr_header_api_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: z_num_range TYPE cl_numberrange_intervals=>nr_object,
          lv_object   TYPE cl_numberrange_objects=>nr_attributes-object.


    TYPES:
      tt_create_header  TYPE TABLE FOR CREATE zks_i_hdr_100\\header,
      tt_mapped_early   TYPE RESPONSE FOR MAPPED EARLY zks_i_hdr_100,
      tt_reponse_early  TYPE RESPONSE FOR FAILED EARLY zks_i_hdr_100,
      tt_reported_early TYPE RESPONSE FOR REPORTED EARLY zks_i_hdr_100,


      tt_reported_late  TYPE RESPONSE FOR REPORTED LATE zks_i_hdr_100,

      tt_header_keys    TYPE TABLE FOR READ IMPORT zks_i_hdr_100\\header,
      tt_header_result  TYPE TABLE FOR READ RESULT zks_i_hdr_100\\header,

      tt_header_update  TYPE TABLE FOR UPDATE zks_i_hdr_100\\header,


      tt_create_emp     TYPE TABLE FOR CREATE zks_i_hdr_100\\header\_crrempinfo,

      tt_header_delete TYPE table for delete zks_i_hdr_100\\header,

      tt_lock_header type table for key of zks_i_hdr_100\\header.


    "Create Constructor
    CLASS-METHODS: get_Instance RETURNING VALUE(ro_instance) TYPE REF TO zcl_crr_header_api_class. "return object instance

    "Class Method
    METHODS:
      earlynumbering_create_header
        IMPORTING entities TYPE tt_create_header
        CHANGING  mapped   TYPE tt_mapped_early
                  failed   TYPE tt_reponse_early
                  reported TYPE tt_reported_early ,


      create_header
        IMPORTING entities TYPE tt_create_header      " table for create zks_i_hdr_100\\header
        CHANGING  mapped   TYPE tt_mapped_early          "response for mapped early zks_i_hdr_100
                  failed   TYPE tt_reponse_early         "response for failed early zks_i_hdr_100
                  reported TYPE tt_reported_early ,    "response for reported early zks_i_hdr_100

      savedata
        CHANGING reported TYPE tt_reported_late, " response for reported late zks_i_hdr_100



      readheader
        IMPORTING keys     TYPE tt_header_keys        "table for read import zks_i_hdr_100\\header
        CHANGING  result   TYPE tt_header_result    "table for read result zks_i_hdr_100\\header
                  failed   TYPE tt_reponse_early             "response for failed early zks_i_hdr_100
                  reported TYPE tt_reported_early,         "response for reported early zks_i_hdr_100

      update_header
        IMPORTING entities TYPE  tt_header_update             "table for update zks_i_hdr_100\\header
        CHANGING  mapped   TYPE tt_mapped_early  "response for mapped early zks_i_hdr_100
                  failed   TYPE tt_reponse_early         "response for failed early zks_i_hdr_100
                  reported TYPE tt_reported_early ,   "response for reported early zks_i_hdr_100


      cba_crrempinfo
        IMPORTING entities_cba TYPE tt_create_emp      "table for create zks_i_hdr_100\\header\_crrempinfo  [ derived type... ]
        CHANGING  mapped       TYPE tt_mapped_early           "response for mapped early zks_i_hdr_100  [ derived type... ]
                  failed       TYPE tt_reponse_early          " response for failed early zks_i_hdr_100  [ derived type... ]
                  reported     TYPE tt_reported_early  ,   "response for reported early zks_i_hdr_100  [ derived type... ]


      earlynumbering_cba_crrempinfo
        IMPORTING entities TYPE tt_create_emp "table for create zks_i_hdr_100\\header\_crrempinfo  [ derived type... ]
        CHANGING  mapped   TYPE tt_mapped_early "response for mapped early zks_i_hdr_100  [ derived type... ]
                  failed   TYPE tt_reponse_early"response for failed early zks_i_hdr_100  [ derived type... ]
                  reported TYPE tt_reported_early,"response for reported early zks_i_hdr_100  [ derived type... ]


          delete_header
             importing keys type tt_header_delete" table for delete zks_i_hdr_100\\header
             changing mapped  type tt_mapped_early"response for mapped early zks_i_hdr_100
              failed  type tt_reponse_early "response for failed early zks_i_hdr_100
              reported  type tt_reported_early,"response for reported early zks_i_hdr_100

          lock_header
                 importing keys  type tt_lock_header "table for key of zks_i_hdr_100\\header  [ derived type... ]
                 changing failed  type tt_reponse_early "response for failed early zks_i_hdr_100  [ derived type... ]
                  reported  type tt_reported_early."response for reported early zks_i_hdr_100  [ derived type... ]



      protected SECTION.

  PRIVATE SECTION.

    CLASS-DATA : mo_instance TYPE REF TO zcl_crr_header_api_class,
                 gt_header   TYPE STANDARD TABLE OF zks_crr_hdr,
                 gs_mapped   TYPE tt_mapped_early,
                 gt_emp      TYPE STANDARD TABLE OF zks_crr_emap,
                 gt_sts      TYPE STANDARD TABLE OF zks_crr_sts,
                 gr_header_d type range of zks_crr_hdr-trnid.

ENDCLASS.

CLASS zcl_crr_header_api_class IMPLEMENTATION.

  METHOD get_instance.
    mo_instance = ro_instance = COND #( WHEN mo_instance  IS BOUND
                                        THEN mo_instance
                                        ELSE NEW #(  ) ).
  ENDMETHOD.

  METHOD earlynumbering_create_header.

*    DATA(ls_mapped) = gs_mapped.
*
    DATA(lt_entities) = entities.
*    lv_object = 'ZNUM_RANG'.
*
*    DELETE lt_entities WHERE TrackingID IS NOT INITIAL.
*
*    TRY.
*        cl_numberrange_runtime=>number_get(
*            EXPORTING
**                 ignore_buffer  =
*                 nr_range_nr  = '01'
*                 object    = 'ZNUM_RANG'
*                 quantity   = CONV #( lines( lt_entities ) )
**                 subobject   =
**                 toyear    =
*            IMPORTING
*              number    = DATA(lv_latest_num)
*              returncode =   DATA(lv_code)
*              returned_quantity = DATA(lv_qty)
*        ).CATCH cx_nr_object_not_found.
*      CATCH cx_number_ranges INTO DATA(lo_error).
*
*
*        LOOP AT lt_entities INTO DATA(ls_entities).
*          APPEND VALUE #(  %cid = ls_entities-%cid
*                                    %is_draft =  ls_entities-%is_draft
*                                    %key = ls_entities-%key  )
*                                    TO failed-header.
*
*          APPEND VALUE #(  %cid = ls_entities-%cid
*                                    %is_draft =  ls_entities-%is_draft
*                                    %key = ls_entities-%key
*                                    %msg = lo_error  )
*                                    TO reported-header.
*
*        ENDLOOP.
*        EXIT.
*    ENDTRY.

*    ASSERT lv_qty = lines( lt_entities ).




    SELECT COUNT( trackingid )
    FROM zks_d_crr_hdr
    INTO @DATA(lv_count_d).

*    IF lv_count_d EQ 0.
            SELECT COUNT( trnid )
            FROM zks_crr_hdr
            INTO @DATA(lv_count_hdr).

*            DATA(lv_curr_num) = lv_count_hdr + 1 .
*    ELSE.
            DATA(lv_curr_num) = lv_count_hdr + lv_count_d + 1 .
*    ENDIF.

    DATA : lt_header TYPE TABLE FOR MAPPED EARLY zks_i_hdr_100,
           ls_header LIKE LINE OF lt_header.

*    DATA(lv_curr_num) = lv_count + 1 .
*    DATA(lv_curr_num) = lv_latest_num - lv_qty.

    LOOP AT lt_entities INTO DATA(ls_entities).
*    TRY.
*      lv_curr_num = lv_curr_num + 1.
      APPEND VALUE #(
                      %cid = ls_entities-%cid
                      %is_draft =  ls_entities-%is_draft
                      TrackingID = lv_curr_num

                       ) TO mapped-header.
*    CATCH cx_any_error INTO DATA(lx_error).
*      APPEND VALUE #( %cid = ls_entities-%cid
*                      %is_draft =  ls_entities-%is_draft
*                      %key = ls_entities-%key
*                       ) TO failed-header.
*    ENDTRY.
    ENDLOOP.




  ENDMETHOD.

  METHOD create_header.
    gt_header = CORRESPONDING #( entities MAPPING FROM ENTITY ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_header>).

      IF NOT gt_header[] IS INITIAL.
*        gt_header[ 1 ]-trnid = get_next_tid(  ).

*        gt_header[ 1 ]-cuky = 'INR'.
        gt_header[ 1 ]-stats = 'NOT DELIVERED'.


      ENDIF.


        mapped = VALUE #(
            header =  VALUE #(
                    FOR ls_entity IN entities (
                        %cid = ls_entity-%cid
                        %key = ls_entity-%key
                        %is_draft = ls_entity-%is_draft

                    ) )
                 ).
*      ENDIF.
    ENDLOOP.

*old method
*    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entites>).
*    IF NOT gt_header[] IS INITIAL.
**        gt_header[ 1 ]-trnid = get_next_tid(  ).
*    ENDIF.
*
*    mapped-header = VALUE #( (
*        %cid = <lfs_entites>-%cid
*        %key = <lfs_entites>-%key
*        %is_draft = <lfs_entites>-%is_draft
*     ) ).
*
*    ENDLOOP.

  ENDMETHOD.

  METHOD savedata.
    IF NOT gt_header[] IS INITIAL.
      MODIFY zks_crr_hdr FROM TABLE @gt_header.
    ENDIF.

    IF NOT gt_emp[] IS INITIAL.
      MODIFY zks_crr_emap FROM TABLE @gt_emp.
    ENDIF.

    IF NOT gr_header_d IS INITIAL.
        DELETE FROM zks_crr_hdr WHERE trnid IN @gr_header_d.
    ENDIF.

  ENDMETHOD.

  METHOD readheader.

    SELECT * FROM  zks_crr_hdr FOR ALL ENTRIES IN @keys
    WHERE trnid = @keys-TrackingID
    INTO TABLE @DATA(lt_header).

    result = CORRESPONDING #( lt_header MAPPING TO ENTITY ).

  ENDMETHOD.

  METHOD update_header.
    DATA: lt_header_update   TYPE STANDARD TABLE OF zks_crr_hdr,
          lt_header_update_x TYPE STANDARD TABLE OF zks_s_crr_hdr.

    lt_header_update = CORRESPONDING #( entities MAPPING FROM ENTITY ).
    lt_header_update_x = CORRESPONDING #( entities MAPPING FROM ENTITY USING CONTROL ) .

    IF NOT lt_header_update IS INITIAL.

      SELECT * FROM zks_crr_hdr
      FOR ALL ENTRIES IN @lt_header_update
      WHERE trnid = @lt_header_update-trnid
      INTO TABLE @DATA(lt_header_update_old). " used for comparing old and new values

    ENDIF.


*    FOR <iterator> = <start_value> WHILE <condition>
*    LET <local_variable1> = <value_expression1>
*    LET <local_variable2> = <value_expression2>
*    IN
*    ( <result_expression> )



    gt_header = VALUE #(

        FOR x = 1 WHILE x <= lines( lt_header_update )
        LET
            ls_control_flag = VALUE #( lt_header_update_x[ x ] OPTIONAL )
            ls_student_new = VALUE #( lt_header_update[ x ] OPTIONAL )
            ls_student_old = VALUE #( lt_header_update_old[ trnid = ls_student_new-trnid  ] OPTIONAL )

        IN
        (
*            trnid =  ls_student_new-trnid
            trnid = COND #( WHEN ls_control_flag-trnid IS NOT INITIAL
                            THEN ls_student_new-trnid
                            ELSE ls_student_old-trnid )

            sourc = COND #( WHEN ls_control_flag-sourc IS NOT INITIAL
                            THEN ls_student_new-sourc
                            ELSE ls_student_old-sourc )
            brnid = COND #( WHEN ls_control_flag-brnid IS NOT INITIAL
                            THEN ls_student_new-brnid
                            ELSE ls_student_old-brnid )
            cstid = COND #( WHEN ls_control_flag-cstid IS NOT INITIAL
                            THEN ls_student_new-cstid
                            ELSE ls_student_old-cstid )
            desti = COND #( WHEN ls_control_flag-desti IS NOT INITIAL
                            THEN ls_student_new-desti
                            ELSE ls_student_old-desti )

            stats = COND #( WHEN ls_control_flag-stats IS NOT INITIAL
                            THEN ls_student_new-stats
                            ELSE ls_student_old-stats )

            price = COND #( WHEN ls_control_flag-price IS NOT INITIAL
                            THEN ls_student_new-price
                            ELSE ls_student_old-price )

            weigt = COND #( WHEN ls_control_flag-weigt IS NOT INITIAL
                            THEN ls_student_new-weigt
                            ELSE ls_student_old-weigt )

            cuky = COND #( WHEN ls_control_flag-cuky IS NOT INITIAL
                            THEN ls_student_new-cuky
                            ELSE ls_student_old-cuky )

            unit = COND #( WHEN ls_control_flag-unit IS NOT INITIAL
                            THEN ls_student_new-unit
                            ELSE ls_student_old-unit )

*            ADMIN DETAILS PENDING
        )

     ).

  ENDMETHOD.

  METHOD cba_crrempinfo.

    gt_emp = VALUE #(
        FOR ls_entities_cba IN entities_cba
            FOR ls_emp_cba IN ls_entities_cba-%target
            LET
                ls_rap_emp =  CORRESPONDING zks_crr_emap(
                    ls_emp_cba MAPPING FROM ENTITY
                )
            IN
             (
                 ls_rap_emp  "The result of the mapping (ls_rap_emp) is added to the internal table being constructed (i.e., gt_emp).
             )
    ).

    mapped = VALUE #(
            employee = VALUE #(
            FOR i = 1 WHILE i <= lines( entities_cba )
            LET
            lt_emp = VALUE #( entities_cba[ i ]-%target OPTIONAL )
            IN
                FOR j = 1  WHILE j <= lines( lt_emp )
                LET
                ls_curr_emp = VALUE #( lt_emp[ j ] OPTIONAL )
                IN
                (
                    %cid = ls_curr_emp-%cid
                    %key = ls_curr_emp-%key
                    %is_draft = ls_curr_emp-%is_draft
                 )
         )
    ).

  ENDMETHOD.

  METHOD earlynumbering_cba_crrempinfo.

*Data(lv_new_result_id) = get_next_id( ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entities>).

      LOOP AT <lfs_entities>-%target ASSIGNING FIELD-SYMBOL(<lfs_result_create>).

        mapped-employee = VALUE #( (
            %cid = <lfs_result_create>-%cid
            %is_draft = <lfs_result_create>-%is_draft
            %key = <lfs_result_create>-%key
        ) ).

      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

  METHOD delete_header.

    DATA:  lt_header type standard table of zks_crr_hdr.
           lt_header = CORRESPONDING #( keys MAPPING FROM ENTITY ).

           gr_header_d = VALUE #(
                FOR ls_header IN lt_header
                sign = 'I'
                option = 'EQ'
                ( low = ls_header-trnid )
            ).



  ENDMETHOD.

  METHOD lock_header.
  ENDMETHOD.




ENDCLASS.
