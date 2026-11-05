$files_url = irm https://api.github.com/repos/ollama/ollama/releases/latest
wget -cnd ($files_url.assets.browser_download_url | sls 'windows-amd64.zip\Z')
wget -cnd ($files_url.assets.browser_download_url | sls '.exe\Z')

cp $HOME/.ollama -Recurse -Force -Destination .




