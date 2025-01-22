@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View For Employee Item Table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true 
define view entity ZKS_C_EMP_100 as projection on ZKS_I_EMP_100
{
    key EmployeeID,
    key TrackingID,
    key BranchID,
    Name,
    Role,
    Phone,
    Email,
    Asign,
    /* Associations */
    _crrheaderinfo : redirected to parent ZKS_C_HDR_100
}
