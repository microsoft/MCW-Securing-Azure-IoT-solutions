$subscriptionId = "#SUBSCRIPTION_ID#";
$resourceGroupName = "#RESOURCE_GROUP_NAME#";
$workspaceName = "#WORKSPACE_NAME#";

$id = [Guid]::NewGuid();

$url = "https://management.azure.com/subscriptions/$subscriptionId/resourcegroups/$resourceGroupName/providers/Microsoft.operationalInsights/workspaces/$workspaceName/providers/Microsoft.SecurityInsights/incidents/$($id)?api-version=2021-04-01";

cd "c:/labfiles/#WORKSHOP_NAME#/artifacts/day-02"

$post = get-content "incident_post.json";

$post = $post.replace("#SUBSCRIPTION_ID#",$subscriptionId);
$post = $post.replace("#RESOURCE_GROUP_NAME#",$resourceGroupName);
$post = $post.replace("#WORKSPACE_NAME#",$workspaceName);

#login so you can get a token
az login;

#get an access token...
$tokenValue = ((az account get-access-token --resource https://management.azure.com) | ConvertFrom-Json).accessToken

#do the post...
$headers = @{
    'Authorization' = "Bearer " + $tokenValue;
    'Content-Type' = "application/json";
}

$res = Invoke-RestMethod -Uri $url -Method PUT -Headers $headers -Body $post

$res;

#reference - https://docs.microsoft.com/en-us/rest/api/securityinsights/incidents/create-or-update