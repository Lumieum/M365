# Connect to Microsoft Graph
Connect-MgGraph -Scopes User.ReadWrite.All

# Read the CSV file
$users = Import-Csv -Path "C:\temp\UsersOfficeLocation.csv"

# Go through each user in the CSV and update the job title
foreach ($user in $users) {
    $userPrincipalName = $user.UserPrincipalName
    $OfficeLocation = $user.OfficeLocation

    # Check if the user exists
    $existingUser = Get-MgBetaUser -UserId $userPrincipalName -ErrorAction SilentlyContinue

    if ($existingUser) {
        # Check if the existing Office Location matches the new value
        if ($existingUser.JobTitle -eq $OfficeLocation) {
            # Office Location already set with the same value
            Write-Host "User '$userPrincipalName' already has Office Location '$OfficeLocation'." -ForegroundColor Cyan
        }
        else {
            # Update the job title
            Update-MgBetaUser -UserId $userPrincipalName -OfficeLocation $OfficeLocation
            Write-Host "User '$userPrincipalName' updated Office Location to '$OfficeLocation' successfully." -ForegroundColor Green
        }
    }
    else {
        # User not found
        Write-Host "User '$userPrincipalName' not found." -ForegroundColor Red
    }
}