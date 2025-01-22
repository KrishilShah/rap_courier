@AbapCatalog.sqlViewName: 'ZKS_BRNID_F4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Branch ID'
@Metadata.ignorePropagatedAnnotations: true
define view ZKRIS_F4_BRNID as select from zks_crr_brch
{
    key brnid as Brnid,
    name as Name,
    loctn as Loctn,
    phone as Phone,
    distn as Distn
}



