$ErrorActionPreference = "Stop"

if ([Environment]::Is64BitProcess) {
	$output = 'setup-x86_64.exe'
} else {
	$output = 'setup-x86.exe'
}

$directory = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid())
Set-Location -Path "$directory"
echo "Working in $directory"

$url = "https://cygwin.com/$output"
echo "Downloading Cygwin installer"
(New-Object System.Net.WebClient).DownloadFile($url, "$directory\$output")

echo "Installing Cygwin"
$directory\$output -q -W

Remove-Item -ErrorAction Ignore -Force -Recurse "$directory"

echo "Installing forklift"
bash -c 'bash <(curl -L https://raw.githubusercontent.com/g2forge/forklift/master/install)'

rm $PSCommandPath
