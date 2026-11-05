$files_url = irm https://api.github.com/repos/ollama/ollama/releases/latest
wget -cnd ($files_url.assets.browser_download_url | sls 'windows-amd64.zip')
wget -cnd ($files_url.assets.browser_download_url | sls '.exe')

cp $HOME/.ollama -Recurse -Force -Destination .




