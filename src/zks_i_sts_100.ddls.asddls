@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View For Status Item Table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZKS_I_STS_100 as select from zks_crr_sts 
association to parent ZKS_I_HDR_100 as _crrheaderinfo on $projection.TrackingID = _crrheaderinfo.TrackingID
{
  key trnid as TrackingID,
  key contr as Contr,
      brnid as BranchiID,
      empid as EmpID,
      zdate as ZDate,
      ztime as Time,
      sourc as Sourc,
      desti as Desti,
      stats as Stats,
      tindx as tindx,
      
      _crrheaderinfo
      
}
