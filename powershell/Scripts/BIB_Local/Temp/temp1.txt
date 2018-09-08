# Get all service principals, and for each one, get all the app role assignments, 
# resolving the app role ID to it's display name. 
Get-AzureADServicePrincipal | % {

  # Build a hash table of the service principal's app roles. The 0-Guid is
  # used in an app role assignment to indicate that the principal is assigned
  # to the default app role (or rather, no app role).
  $appRoles = @{ "$([Guid]::Empty.ToString())" = "(default)" }
  $_.AppRoles | % { $appRoles[$_.Id] = $_.DisplayName }

  # Get the app role assignments for this app, and add a field for the app role name
  Get-AzureADServiceAppRoleAssignment -ObjectId ($_.ObjectId) | Select ResourceDisplayName, PrincipalDisplayName,  Id | % {  $_ | Add-Member "AppRoleDisplayName" $appRoles[$_.Id] -Passthru
  }
}