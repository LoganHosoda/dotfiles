This directory contains the files necessary to run Kanata,
which is a keyboard extenstion layer service.

In it contains mappings that allows me to use various symbols
on the homerow so that I no longer need to reach with my pinky,
which was causing a great amount of pain.

First download kanata

yay -S kanata-bin

Then copy the kanata.kbd file to the directory:

mkdir -p ~/.config/kanata
cp kanata.kbd ~/.config/kanata/kanata.kbd

Then copy the service file and add it to as a systemd service

sudo cp kanata.service /etc/systemd/system/

Last, enable the service and confirm it's working:

sudo systemctl daemon-reload
sudo systemctl enable kanata.service
sudo systemctl start kanata.service
sudo systemctl status kanata.service

After everything, the service should now be up and running,
which allows Caps-Lock to be used as an extension layer modifier!
