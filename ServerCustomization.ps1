
$LogPath = "C:\Users\Administrator\Desktop\CustomizationLog.txt"
Rename-Computer -NewName "W22Server40-1"  | Out-File -FilePath $LogPath -NoClobber -Append
Install-WindowsFeature -Name containers | Out-File -FilePath $LogPath  -NoClobber -Append
curl.exe -LO https://raw.githubusercontent.com/kubernetes-sigs/sig-windows-tools/master/kubeadm/scripts/PrepareNode.ps1 | Out-File -FilePath $LogPath -NoClobber -Append

Restart-Computer 
