# https://github.com/pyenv/pyenv-installer
# https://github.com/pyenv/pyenv#basic-github-checkout

curl https://pyenv.run | bash

sudo bash -c "cat >/etc/profile.d/pyenv.sh" <<-'_END_'
export PATH=${HOME}/.pyenv/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
_END_

# install additional packages:
# libffi-dev for python versions 3.7.2 and up
# libsqlite3-dev for all versions?
sudo apt-get install -y \
    libffi-dev \
    libsqlite3-dev

