Configuration SetupVM
{
  param ($MachineName)

  Node $MachineName
  {
    #Install Hyper-V
    WindowsFeature Hyper-V
    {
      Ensure = "Present"
      Name = "Hyper-V"
    }
	
	WindowsFeature Hyper-V-PowerShell
    {
      Ensure = "Present"
      Name = "Hyper-V-PowerShell"
    }

	#Download the Ubuntu image
	File DownloadPackage        
	{            	
		Ensure = "Present"              	
		Type = "File"             	
		SourcePath ="http://releases.ubuntu.com/18.04.2/ubuntu-18.04.2-desktop-amd64.iso?_ga=2.217794645.250537699.1561075707-451013508.1559761103"            	
		DestinationPath = "C:\ubuntu" 
	}
    
  }
} 