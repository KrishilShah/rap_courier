@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View For Status Item Table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true 
define view entity ZKS_C_STS_100 as projection on ZKS_I_STS_100
{
    key TrackingID,
    key Contr,
    BranchiID,
    EmpID,
    ZDate,
    Time,
    Sourc,
    Desti,
    Stats,
    tindx,
    
    _crrheaderinfo : redirected to parent ZKS_C_HDR_100
}
