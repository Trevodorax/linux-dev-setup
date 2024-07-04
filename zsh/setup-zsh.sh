# === basic zsh === #
cd zsh

sudo apt install zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp haribo.zsh-theme ~/.oh-my-zsh/custom/themes/

cp .zshrc ~/.zshrc

source ~/.zshrc

cd -
