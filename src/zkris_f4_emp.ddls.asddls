@AbapCatalog.sqlViewName: 'ZKS_F4_EMP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Emp ID'
@Metadata.ignorePropagatedAnnotations: true
define view ZKRIS_F4_EMP as select from zks_crr_emp
{
    key empid as Empid,
    name as Name,
    role as Role,
    phone as Phone,
    email as Email
}
