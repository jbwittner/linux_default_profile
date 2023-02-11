echo "STEP 1 (START) - Install / Update ZSH"
apt install zsh -f
echo "STEP 1 (END) - Install / Update ZSH"

echo "STEP 2 (START) - Install / Update oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "STEP 2 (END) - Install / Update oh-my-zsh"

echo "STEP 3 (START) - Copy ZSH configuration"
cp -f .zshrc ~/.zshrc
echo "STEP 3 (END) - Copy ZSH configuration"

echo "STEP 3 (START) - Copy git configuration"
cp -f .gitconfig ~/.gitconfig
echo "STEP 3 (END) - Copy git configuration"

echo "STEP 4 (START) - Copy npm configuration"
cp .npmrc ~/.npmrc
echo "STEP 4 (END) - Copy npm configuration"

echo "STEP 5 (START) - Copy maven configuration"
mkdir -p ~/.m2
cp settings.xml ~/.m2/settings.xml
echo "STEP 5 (END) - Copy maven configuration"