# download ollama installer/portable
$files_url = irm https://api.github.com/repos/ollama/ollama/releases/latest
$files_url.assets.browser_download_url | ? { $_ -match 'windows-amd64.zip\Z' } | % { iwr $_ -OutFile . }
$files_url.assets.browser_download_url | ? { $_ -match '.exe\Z' } | % { iwr $_ -OutFile . }

# download models
ollama pull gemma4:12b
ollama pull hf.co/HauhauCS/Gemma4-12B-QAT-Uncensored-HauhauCS-Balanced:Q4_K_M

# download latest nvidia studio driver
$res = irm 'https://gfwsl.geforce.com/services_toolkit/services/com/nvidia/services/AjaxDriverService.php?func=DriverManualLookup&psid=131&pfid=1076&osID=135&languageCode=1033&isWHQL=0&beta=null&dltype=-1&dch=1&upCRD=null&qnf=null&ctk=null&sort1=0&numberOfResults=20'
$res.IDS.downloadInfo | ? Name -Match 'Studio' | % DownloadURL | Select -First 1 | % { iwr $_ -OutFile . }

cp $HOME/.ollama -Recurse -Force -Destination .
mi backup.ps1 -Destination backup.ps1.OLD -Force



