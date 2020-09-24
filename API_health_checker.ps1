$Url = $args[0]
$Timeout = [int]$args[1]

$count = 0
$timeoutThreshold = [math]::floor($Timeout / 5)

do {
    # First we create the request.
    $HTTP_Request = [System.Net.WebRequest]::Create($Url)
    $HTTP_Status = 0
    $count = $count + 1
    try {
        # We then get a response from the site.
        $HTTP_Response = $HTTP_Request.GetResponse()
        # We then get the HTTP code as an integer.
        $HTTP_Status = [int]$HTTP_Response.StatusCode
    } 
    catch [System.Net.WebException] {
        $HTTP_Status = -1
    }

    If ($HTTP_Status -eq 200) {
        Write-Host "Site is OK!"
    }
    Else {
        Write-Host "Site not available yet. Retrying in 5 seconds."
        Start-Sleep -s 5
    }

    If ($count -gt $timeoutThreshold) {
        Write-Host "Timed out after 60 seconds. The Site may be down, please check!"        
        # Finally, we clean up the http request by closing it.
        If ($HTTP_Response -eq $null) { } 
        Else { $HTTP_Response.Close() }
        exit 1
    }
}
until ($HTTP_Status -eq 200)

# Finally, we clean up the http request by closing it.
If ($HTTP_Response -eq $null) { } 
Else { $HTTP_Response.Close() }