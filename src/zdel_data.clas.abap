CLASS zdel_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdel_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    DATA lt_data TYPE TABLE OF zks_crr_emap.
**
*    SELECT * FROM zks_crr_emap INTO TABLE @lt_data.
*    DELETE zks_crr_emap FROM TABLE @lt_data.
*
*
*    DATA: ls_hdr TYPE zks_crr_hdr.
*
*    " Populate the structure with the input values
*    ls_hdr-mandt = sy-mandt.          " Mandant (client) from system
*    ls_hdr-trnid = '12312312'.          " Tracking ID
*    ls_hdr-brnid = '203'.          " Branch ID
*    ls_hdr-cstid = '1102'.          " Customer ID
*    ls_hdr-sourc = '203'.          " Courier source
*    ls_hdr-desti = '206'.          " Courier destination
*    ls_hdr-stats = 'NOT DELIVERED'.          " Courier status
*    ls_hdr-cuky = 'INR'.            " Currency
*    ls_hdr-unit = 'KG'.            " Unit of measure
*    ls_hdr-price = '1000'.          " Price
*    ls_hdr-weigt = '5'.          " Weight
*
*    " Insert the populated structure into the table
*    INSERT zks_crr_hdr FROM @ls_hdr.


*DATA: ls_emap TYPE zks_crr_emap.
*
*    " Populate the structure with the input values
*    ls_emap-mandt = sy-mandt.              " Client
*    ls_emap-empid = '400020'.              " Employee ID
*    ls_emap-trnid = '12312312'.              " Tracking ID
*    ls_emap-brnid = '203'.              " Branch ID
*    ls_emap-name = 'Krishil'.                " Employee Name
*    ls_emap-role = 'Shipper'.                " Employee Role
*    ls_emap-phone = '9309116762'.              " Phone Number
*    ls_emap-email = 'kds@gmail.com'.              " Email Address
*    ls_emap-asign = ' '.              " Assigned Status
*
*    " Insert the populated structure into the zks_crr_emap table
*
*INSERT zks_crr_emap FROM @ls_emap.







  ENDMETHOD.
ENDCLASS.
