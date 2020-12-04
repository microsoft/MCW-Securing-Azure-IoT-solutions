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

function DownloadImage()
{
    write-host "Checking for zip";

    $item = Get-Item "c:\temp\ubuntu.zip" -ea silentlycontinue;

    if (!$item)
    {
        write-host "Downloading Ubuntu zip";

        #download the image...
        $url = "https://solliancepublicdata.blob.core.windows.net/virtualmachines/UBUSRV.zip";
        Start-BitsTransfer -Source $url -DisplayName Notepad -Destination "c:\temp\ubuntu.zip"
    }

    $item = get-item "C:\VMs\UBUSRV\Virtual Machines\BE674C9C-0461-4F44-B105-6893F5618F46.vmcx"

    if (!$item)
    {
        #extract image
        write-host "Extracting Ubuntu zip";

        #Expand-archive -path "c:\temp\ubuntu.zip" -destinationpath c:\VMs\Ubuntu2; #doesn't work with explorer zips
        7z e c:\temp\ubuntu.zip -oc:\vms *.* -r -spf
    }
}

function MountImage()
{
    $vm = Get-VM $global:vmName -ea silentlycontinue

    if (!$vm)
    {
        write-host "Creating VM";

        # VM creation
        $vmName = "UBUSRV";
        $vmNewDiskPath = "C:\VMs\UBUSRV\Virtual Hard Disks\UBUSRV.vhdx";
        $vmNewDiskSize = 40GB;
        $vmPath = "C:\VMs";
        $vmGeneration = 2;
        $vmBootDevice = "VHD";
        $vmSwitchName = "Default Switch"; # To find existing switches run, Get-VMSwitch | ft
        
        $vmFirmwareEnableSecureBoot = "On"; # Turn off if you trust and/or image isn't supported.
        $vmFirmwareSecureBootTemplate = "MicrosoftUEFICertificateAuthority";

        $vmProcessorCount = 2;
        $vmMemoryStartUpBytes = 1GB;
        $vmMemoryMinimumBytes =  500MB;
        $vmMemoryMaximumBytes =  3GB;
        $vmDynamicMemoryEnabled = $true;

        #New-VMSwitch -name $vmSwitchName  -NetAdapterName Ethernet -AllowManagementOS $true

        New-VM -Name $vmName -BootDevice $vmBootDevice -VHDPath $vmNewDiskPath -Path $vmPath -Generation $vmGeneration -SwitchName $vmSwitchName
        Set-VMFirmware $vmName -EnableSecureBoot $vmFirmwareEnableSecureBoot -SecureBootTemplate $vmFirmwareSecureBootTemplate
        Set-VMProcessor $vmName -Count $vmProcessorCount
        Set-VMMemory $vmName -DynamicMemoryEnabled $vmDynamicMemoryEnabled -MinimumBytes $vmMemoryMinimumBytes -StartupBytes $vmMemoryStartUpBytes -MaximumBytes $vmMemoryMaximumBytes
    }
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

$global:vmName = "ubusrv"

DownloadImage;

MountImage;

#setup TPM
$owner = Get-HgsGuardian -Name "Guardian11" -ea silentlycontinue

if (!$owner)
{
    $owner = New-HgsGuardian -Name "Guardian11" -GenerateCertificates
}

$kp = New-HgsKeyProtector -Owner $owner -AllowUntrustedRoot
Set-VMKeyProtector -VMName $global:vmName -KeyProtector $kp.RawData

#turn on TPM
$vm = Get-VM $global:vmName -ea silentlycontinue
Enable-VMTPM -VM $vm

#start it
Start-VM $global:vmName;

#diable the task
Disable-ScheduledTask -TaskName "MCW Setup Script"

Stop-Transcript

return 0;