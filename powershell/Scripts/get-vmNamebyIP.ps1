﻿Get-VM | Where-Object -FilterScript { $_.Guest.IPAddress -contains "10.35.45.245" }