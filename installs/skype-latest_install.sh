#! /bin/bash

# instructions:
# http://ubuntuhandbook.org/index.php/2017/03/install-skype-5-0-for-linux-ubuntu-16-04/
# download skype from here:
# https://www.skype.com/en/download-skype/skype-for-computer/

aptitude -y install apt-transport-https
curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skype-stable.list
aptitude update
aptitude -y install skypeforlinux

