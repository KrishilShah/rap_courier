@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZKS_I_HDR_100 as select from zks_crr_hdr
composition[0..*] of ZKS_I_EMP_100 as _crrempinfo 
composition[0..*] of ZKS_I_STS_100 as _crrstsinfo

{
        key trnid as TrackingID,
        brnid as BranchID,
        cstid as CustomerID,
        sourc as Source,
        desti as Destination ,
        stats as Status,
        cuky,
        unit ,
       @Semantics.amount.currencyCode: 'cuky'
        price as price ,
        @Semantics.quantity.unitOfMeasure: 'unit'
        weigt as Weight,
        lastchangedat,
        locallastchangedat,
        ernam,
        aedat,
        aenam,
        aezet,
        erdat,         
        erzet,     

 

        
        
         _crrempinfo,
         _crrstsinfo
}
