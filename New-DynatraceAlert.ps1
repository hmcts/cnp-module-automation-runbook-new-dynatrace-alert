param (
    [parameter(mandatory=$true)]  
    [String]$dynatraceTenant,

    [parameter(mandatory=$true)]  
    [String]$credentialName,

    [parameter(mandatory=$true)]
    [String]$alertName,

    [parameter(mandatory=$true)]
    [String]$alertDescription,

    [parameter(mandatory=$true)]
    [String]$entityType,

    [parameter(mandatory=$true)]
    [String]$entityName,

    [parameter(mandatory=$false)]
    [String]$eventType = "ERROR_EVENT"
) 

#####################################
# Start Script. #####################
Write-Output "`nDynatrace Tenant : $dynatraceTenant"
Write-Output "`nAlert Name       : $alertName"

####################################
# Get Credentials. #################
Write-Output "`nFetching Credentials From Automation Account, Please Wait..."
$automationCredential = Get-AutomationPSCredential -Name $credentialName
$apiToken             = $automationCredential.GetNetworkCredential().Password

####################################
# Create Headers. ##################
$requestHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$requestHeaders.Add("Authorization", "API-Token $apiToken")
$requestHeaders.Add("Content-Type", "application/json")

####################################
# Create Body. #####################
$requestBody = [PSCustomObject]@{
                    "eventType"      = "$eventType"
                    "title"          = "$alertName"
                    "entitySelector" = "type($entityType),entityName.startsWith($entityName)"
                    "properties"     = @{
                        "Description" = "$alertDescription"
                    }
                } | ConvertTo-Json

###############################
# POST Data. ##################
Write-Output "`nCreating Alert in Dynatrace, Please Wait..."
$response = Invoke-RestMethod "https://$dynatraceTenant.live.dynatrace.com/api/v2/events/ingest" -Method 'POST' -Headers $requestHeaders -Body $requestBody
$response | ConvertTo-Json