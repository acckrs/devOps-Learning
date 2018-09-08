$qry="SELECT SMS_Collection.* FROM SMS_FullCollectionMembership, SMS_Collection where name = 'fddb' and SMS_FullCollectionMembership.CollectionID = SMS_Collection.CollectionID"
$Collections = (Get-WmiObject -ComputerName sccm-bg-01  -Namespace root\SMS\site_BIB -Query "$qry").Name
$collections