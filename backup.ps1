$files_url = irm https://api.github.com/repos/ollama/ollama/releases/latest
wget -cnd ($files_url.assets.browser_download_url | sls 'windows-amd64.zip\Z')
wget -cnd ($files_url.assets.browser_download_url | sls '.exe\Z')

ollama pull gemma4:12b
ollama pull hf.co/HauhauCS/Gemma4-12B-QAT-Uncensored-HauhauCS-Balanced:Q4_K_M

cp $HOME/.ollama -Recurse -Force -Destination .




