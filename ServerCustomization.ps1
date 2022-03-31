
$LogPath = "C:\Users\Administrator\Desktop\CustomizationLog.txt"
# Rename Server
Rename-Computer -NewName "W22Server40-1"  | Out-File -FilePath $LogPath -NoClobber -Append
# Install Container Features and associated settings
Install-WindowsFeature -Name containers | Out-File -FilePath $LogPath  -NoClobber -Append
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
# Install Docker 
Install-Package -Name docker -ProviderName DockerMsftProvider
# Download Kubernetes components 
curl.exe -LO https://raw.githubusercontent.com/kubernetes-sigs/sig-windows-tools/master/kubeadm/scripts/PrepareNode.ps1 | Out-File -FilePath $LogPath -NoClobber -Append
# Uncomment following line to automatically restart computer for unattended installs
#Restart-Computer 

