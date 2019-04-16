echo Setup autostart
mkdir -p ~/.config/autostart/
cp -v desktop/* ~/.config/autostart/

# omniboard
(crontab -l 2>/dev/null; echo "@reboot bash -c 'while ! nc -z localhost 27017; do sleep 1; done && /home/eukaryote/.nvm/versions/node/v11.11.0/bin/omniboard -m localhost:27017:experiments'") | crontab -
