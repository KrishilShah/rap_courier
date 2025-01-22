@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View For Employee Item Table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZKS_I_EMP_100 as select from zks_crr_emap
    association to parent ZKS_I_HDR_100 as _crrheaderinfo on $projection.TrackingID = _crrheaderinfo.TrackingID
{
    key empid as EmployeeID,
    key trnid as TrackingID,
    key brnid as BranchID,
    name as Name,
    role as Role,
    phone as Phone,
    email as Email,
    asign as Asign,
    
    _crrheaderinfo
}
