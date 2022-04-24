#Get Hostpool to change
$resource = Get-AzResource -ResourceType 'Microsoft.DesktopVirtualization/hostpools' | Out-GridView -OutputMode Single -Title 'Select the HP to change'
$myHP = Get-AzWvdHostPool -Name $($resource.Name) -ResourceGroupName $($resource.ResourceGroupName) 

#modify settings using the correct sizings e.g.
$alternativevmtemplatesize = @{
	osDiskType            = 'StandardSSD_LRS'
    vmSize                = @{id='Standard D4ds v5'; cores=4; ram=16}
}

Update-AzWvdHostPool -Name $($myHP.Name) -VMTemplate $($alternativevmtemplatesize | ConvertTo-Json) -ResourceGroupName $($resource.ResourceGroupName)