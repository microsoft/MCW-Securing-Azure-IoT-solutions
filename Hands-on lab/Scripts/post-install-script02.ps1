function FreshStart()
{
    #download it
    $url = "http://releases.ubuntu.com/18.04.2/ubuntu-18.04.2-desktop-amd64.iso";
    Start-BitsTransfer -Source $url -DisplayName Notepad -Destination "c:\temp\ubuntu.iso"

    # VM creation
    $vmNewDiskPath = "C:\VMs\UBUSRV.vhdx";
    $vmNewDiskSize = 40GB;
    $vmPath = "C:\VMs";
    $vmGeneration = 2;
    $vmBootDevice = "VHD";
    $vmSwitchName = "DefaultSwitch"; # To find existing switches run, Get-VMSwitch | ft
    $vmDvdDrivePath = "C:\temp\ubuntu.iso"

    $vmFirmwareEnableSecureBoot = "On"; # Turn off if you trust and/or image isn't supported.
    $vmFirmwareSecureBootTemplate = "MicrosoftUEFICertificateAuthority";

    $vmProcessorCount = 2;
    $vmMemoryStartUpBytes = 1GB;
    $vmMemoryMinimumBytes =  500MB;
    $vmMemoryMaximumBytes =  3GB;
    $vmDynamicMemoryEnabled = $true;

    #New-VMSwitch -name $vmSwitchName  -NetAdapterName Ethernet -AllowManagementOS $true

    New-VM -Name $global:vmName -BootDevice $vmBootDevice -NewVHDPath $vmNewDiskPath -Path $vmPath -NewVHDSizeBytes $vmNewDiskSize -Generation $vmGeneration -SwitchName $vmSwitchName
    Set-VMFirmware $global:vmName -EnableSecureBoot $vmFirmwareEnableSecureBoot -SecureBootTemplate $vmFirmwareSecureBootTemplate
    Set-VMProcessor $global:vmName -Count $vmProcessorCount
    Set-VMMemory $global:vmName -DynamicMemoryEnabled $vmDynamicMemoryEnabled -MinimumBytes $vmMemoryMinimumBytes -StartupBytes $vmMemoryStartUpBytes -MaximumBytes $vmMemoryMaximumBytes
    Add-VMDvdDrive $global:vmName -Path $vmDvdDrivePath # To eject run Remove-VMDvdDrive $vmName
}

function DownloadImages()
{
    #oilwells-edge-001
    $zippath = "c:\temp\oilwells-edge-001.zip";
    $downloadUrl = "https://solliancepublicdata.blob.core.windows.net/virtualmachines/oilwells-edge-001.zip";
    $verifyPath = "C:\VMs\oilwells-edge-001\Virtual Machines\ED3E2BA8-D55D-4C02-AACF-9B38F2C2858E.vmcx";
    DownloadImage $zipPath $downloadUrl $verifyPath;

    #remove-item $zipPath;

    #oilwells-d01
    $zippath = "c:\temp\oilwells-d01.zip";
    $downloadUrl = "https://solliancepublicdata.blob.core.windows.net/virtualmachines/oilwells-d01.zip";
    $verifyPath = "C:\VMs\oilwells-d01\Virtual Machines\5DEDCADB-AD22-47F0-98F7-5489512C36D0.vmcx";
    DownloadImage $zipPath $downloadUrl $verifyPath;

    #remove-item $zipPath;

    #iotmgmt
    $zippath = "c:\temp\iotmgmt.zip";
    $downloadUrl = "https://solliancepublicdata.blob.core.windows.net/virtualmachines/IoT Management Console.zip";
    $verifyPath = "C:\VMs\IoT Management Console\Virtual Machines\EC7F7411-C66C-418E-A3B7-7382CD37E245.vmcx";
    DownloadImage $zipPath $downloadUrl $verifyPath;

    #remove-item $zipPath;

    #iotsensor
    $zippath = "c:\temp\iotsensor.zip";
    $downloadUrl = "https://solliancepublicdata.blob.core.windows.net/virtualmachines/IoT Sensor.zip";
    $verifyPath = "C:\VMs\IoT Sensor\Virtual Machines\3539698D-B373-46FB-80DF-B6B46F387A1A.vmcx";
    DownloadImage $zipPath $downloadUrl $verifyPath;

    #remove-item $zipPath;
}

function DownloadImage($zipPath, $downloadUrl, $verifyPath)
{
    write-host "Checking for zip";

    $item = Get-Item $zipPath -ea silentlycontinue;

    if (!$item)
    {
        write-host "Downloading image zip : $downloadUrl";
        
        Start-BitsTransfer -Source $downloadurl -DisplayName Notepad -Destination $zipPath
    }

    $item = get-item $verifyPath -ea silentlycontinue;

    if (!$item)
    {
        #extract image
        write-host "Extracting zip : $zipPath";

        #Expand-archive -path "c:\temp\ubuntu.zip" -destinationpath c:\VMs\Ubuntu2; #doesn't work with explorer zips
        7z e $zipPath -oc:\vms *.* -r -spf
    }
}

function MountImage($name, $path, $noCPU, $memoryInGB)
{
    $vm = Get-VM $Name -ea silentlycontinue

    if (!$vm)
    {
        write-host "Creating VM";

        # VM creation
        $vmName = $name;
        $vmNewDiskPath = $path;
        $vmNewDiskSize = 40GB;
        $vmPath = "C:\VMs";
        $vmGeneration = 2;
        $vmBootDevice = "VHD";
        $vmSwitchName = "Default Switch"; # To find existing switches run, Get-VMSwitch | ft
        
        $vmFirmwareEnableSecureBoot = "On"; # Turn off if you trust and/or image isn't supported.
        $vmFirmwareSecureBootTemplate = "MicrosoftUEFICertificateAuthority";

        $vmProcessorCount = $noCPU;
        $vmMemoryStartUpBytes = $memoryInGB;
        $vmMemoryMinimumBytes =  500MB;
        $vmMemoryMaximumBytes =  $memoryInGB;
        $vmDynamicMemoryEnabled = $true;

        #New-VMSwitch -name $vmSwitchName  -NetAdapterName Ethernet -AllowManagementOS $true

        New-VM -Name $vmName -BootDevice $vmBootDevice -VHDPath $vmNewDiskPath -Path $vmPath -Generation $vmGeneration -SwitchName $vmSwitchName
        Set-VMFirmware $vmName -EnableSecureBoot $vmFirmwareEnableSecureBoot -SecureBootTemplate $vmFirmwareSecureBootTemplate
        Set-VMProcessor $vmName -Count $vmProcessorCount
        Set-VMMemory $vmName -DynamicMemoryEnabled $vmDynamicMemoryEnabled -MinimumBytes $vmMemoryMinimumBytes -StartupBytes $vmMemoryStartUpBytes -MaximumBytes $vmMemoryMaximumBytes

        SetupTPM $name;
    }
}

function SetupTPM($vmName)
{
    #setup TPM
    $owner = Get-HgsGuardian -Name "Guardian11" -ea silentlycontinue

    if (!$owner)
    {
        $owner = New-HgsGuardian -Name "Guardian11" -GenerateCertificates
    }

    $kp = New-HgsKeyProtector -Owner $owner -AllowUntrustedRoot
    Set-VMKeyProtector -VMName $vmName -KeyProtector $kp.RawData

    #turn on TPM
    $vm = Get-VM $vmName -ea silentlycontinue
    Enable-VMTPM -VM $vm

    #start it
    Start-VM $vmName;
}

function ImportImage()
{
    $vm = Get-VM $global:vmName -ea silentlycontinue

    if (!$vm)
    {
        write-host "Importing VM";

        #import the image
        Import-VM -Path 'C:\VMs\UBUSRV\Virtual Machines\BE674C9C-0461-4F44-B105-6893F5618F46.vmcx'
    }
}

Start-Transcript -Path C:\WindowsAzure\Logs\CloudLabsCustomScriptExtension.txt -Append

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls" 

. C:\LabFiles\AzureCreds.ps1

$userName = $AzureUserName                # READ FROM FILE
$global:password = $AzurePassword                # READ FROM FILE
$clientId = $TokenGeneratorClientId       # READ FROM FILE
$global:localusername = $username

Uninstall-AzureRm

mkdir c:\temp -ea silentlycontinue;
mkdir c:\VMs -ea silentlycontinue;

#do a second time???
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

DownloadImages;

$vmName = "oilwells-edge-001";
$vmNewDiskPath = "C:\VMs\oilwells-edge-001\Virtual Hard Disks\oilwells-edge-001.vhdx";

MountImage $vmName $vmNewDiskPath 2 1GB;

$vmName = "oilwells-d01";
$vmNewDiskPath = "C:\VMs\oilwells-d01\Virtual Hard Disks\oilwells-d01.vhdx";

MountImage $vmName $vmNewDiskPath 2 1GB;

#IoT Management
$vmVmcx = "C:\VMs\IoT Management Console\Virtual Machines\EC7F7411-C66C-418E-A3B7-7382CD37E245.vmcx";
Import-VM $vmVmcx;

#IoT Sensor
$vmVmcx = "C:\VMs\IoT Sensor\Virtual Machines\3539698D-B373-46FB-80DF-B6B46F387A1A.vmcx";
Import-VM $vmVmcx;

#diable the task
Disable-ScheduledTask -TaskName "MCW Setup Script"

Stop-Transcript

return 0;