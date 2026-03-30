# Set the headers for the API calls
$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer 010101010101010100110101_c1e7dfd1dfd65bb2212e5d0511f986eXXXXXXXXXX"
}


$account = "9ede486d-330a-4cad-912b-XXXXXXX"
$serial = "XXXXXX-GP2demo"
$profile = "0083c90d-68e1-4a79-9a7f-XXXXXXXXX"



# First API call - Get a list of users
$apiUrl1 = "https://demo.one.digicert.com/mpki/api/v1/certificate-search?account_id=$account&profile_id=$profile&common_name=$serial&status=issued" 
$response1 = Invoke-RestMethod -Uri $apiUrl1 -Method Get -Headers $headers -Data ""


# Extract the ID of the first user from the response
$SN = $response1.serial_number[0]


$apiUrl2 = "https://demo.one.digicert.com/mpki/api/v1/certificate/$SN/revoke"
$response2 = Invoke-RestMethod -Uri $apiUrl1 -Method Get -Headers $headers -Data ""revocation_reason": "superseded""


