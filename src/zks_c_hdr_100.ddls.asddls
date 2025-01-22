@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Header Table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZKS_C_HDR_100 as projection on ZKS_I_HDR_100
{
    key TrackingID,
    BranchID,
    CustomerID,
    Source,
    Destination,
    Status,
    cuky,
    unit,
        @Semantics.amount.currencyCode: 'cuky'
    price,
        @Semantics.quantity.unitOfMeasure: 'unit'
    Weight,
    lastchangedat,
    locallastchangedat,
    ernam,
    aedat,
    aenam,
    aezet,
    erdat,
    erzet,
  
    
   _crrempinfo : redirected to composition child ZKS_C_EMP_100,
   _crrstsinfo : redirected to composition child ZKS_C_STS_100
}

