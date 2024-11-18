Prerequisites:

SharePoint Online PowerShell module
This script users ‘Set-SPOUser’ cmdlet. You must have the SharePoint Online global administrator permission to run the cmdlet.
Add Secondary Site Collection Admin for all OD4B Users:

Using the below Powershell script you can add the secondary site collection admin for all OD$B users.

In the script, replace the AdminURL and SecondaryAdmin with correct values.


Remove Secondary Site Collection Admin for all OD4B Users:

To remove the secondary site collection admin, in the above script, just change the Set-SPOUser cmdlet’s parameter “IsSiteCollectionAdmin” value to $false.