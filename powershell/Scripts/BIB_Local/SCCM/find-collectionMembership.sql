SELECT SMS_Collection.name 
FROM SMS_FullCollectionMembership, SMS_Collection 
where name = ##PRM:sms_r_system.LastLogonUserName##
and SMS_FullCollectionMembership.CollectionID = SMS_Collection.CollectionID 
and SMS_Collection.name LIKE 'Serveri%'
and SMS_Collection.name != 'Serveri svi koji se patch-uju'