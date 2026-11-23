$files_url = irm https://api.github.com/repos/ollama/ollama/releases/latest
wget -cnd ($files_url.assets.browser_download_url | sls 'windows-amd64.zip\Z')
wget -cnd ($files_url.assets.browser_download_url | sls '.exe\Z')

# download models
ollama pull gemma4:12b
ollama pull hf.co/HauhauCS/Gemma4-12B-QAT-Uncensored-HauhauCS-Balanced:Q4_K_M

# download latest nvidia studio driver
$res = irm 'https://gfwsl.geforce.com/services_toolkit/services/com/nvidia/services/AjaxDriverService.php?func=DriverManualLookup&psid=131&pfid=1076&osID=135&languageCode=1033&isWHQL=0&beta=null&dltype=-1&dch=1&upCRD=null&qnf=null&ctk=null&sort1=0&numberOfResults=20'
$driver_url = $res[0].IDS.downloadInfo | ? Name -Match 'Studio' | % DownloadURL
wget -cnd $driver_url

cp $HOME/.ollama -Recurse -Force -Destination .




