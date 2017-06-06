            $props = @{'ComputerName'= "ict-211-5888";
                    "Workgroup"          = $comp.Workgroup;
                    "Domain"             = $comp.Domain;
                    'OSVersion'          = 2;
                    'SPVersion'          = 1;
                    'BIOSserial'         = $bios.serialNumber;
                    'Manufacturer'       = "HP";
                    'Model'              = "Elite";
                    'AdminPaswordStatus' = $admPasswordStatus
                } #end hash table for properties
                Write-Verbose "WMI queries complete"

                $obj = New-Object -TypeName psobject -Property $props
                $obj.PSObject.TypeNames.Insert(0, 'BIB.ComputerSystemInfo')
                Write-Output $obj