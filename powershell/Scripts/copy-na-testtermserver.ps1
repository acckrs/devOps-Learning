$msqmParams=@{'MsgStore'="E:\MSMQ\MessageFiles";
              'TransactionLogStore'= "E:\MSMQ\TransactionLogs";
              'MsgLogStore'= "E:\MSMQ\Storage"}
Set-MsmqQueueManager @msmqparams