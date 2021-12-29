# https://github.com/tfutils/tfenv/

git clone https://github.com/tfutils/tfenv.git ~/.tfenv

sudo bash -c "cat >/etc/profile.d/tfenv.sh" <<-'_END_'
export PATH=${HOME}/.tfenv/bin:$PATH
_END_

