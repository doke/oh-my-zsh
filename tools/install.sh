if [ -d ~/.oh-my-zsh ]
then
  echo "You already have Oh My Zsh installed. You'll need to remove ~/.oh-my-zsh if you want to install"
  exit
fi

echo "Cloning Oh My Zsh..."
/usr/bin/env git clone git://github.com/doke/oh-my-zsh.git ~/.oh-my-zsh

echo "Looking for an existing zsh config..."
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "Found ~/.zshrc. Backing up to ~/.zshrc.pre-oh-my-zsh";
  cp ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
  rm ~/.zshrc;
fi

echo "Using the Oh My Zsh template file and adding it to ~/.zshrc"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "Copying your current PATH and adding it to the end of ~/.zshrc for you."
echo "export PATH=$PATH" >> ~/.zshrc

echo "Time to change your default shell to zsh!"
ZSH=`which zsh`
chsh -s $ZSH

echo "Hooray! Oh My Zsh has been installed."
$ZSH
source ~/.zshrc
