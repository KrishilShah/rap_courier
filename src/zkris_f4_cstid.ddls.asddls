@AbapCatalog.sqlViewName: 'ZKS_CUST_F4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Cust ID'
@Metadata.ignorePropagatedAnnotations: true
define view ZKRIS_F4_CSTID as select from zks_crr_cust
{
    key cstid as Cstid,
    key brnid as Brnid,
    name as Name,
    phone as Phone,
    email as Email 
}


