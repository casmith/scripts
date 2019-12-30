mkdir -p ~/bin
mkdir -p ~/work

sudo apt update
sudo apt -y upgrade
sudo apt install -y git zsh vim whois

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install sdk
curl -s "https://get.sdkman.io" | bash
source "/home/clay/.sdkman/bin/sdkman-init.sh"

# install java, etc. 
sdk i gradle
sdk i java

# install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm i stable

#install rvm/ruby
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby-2.6

#install php
sudo apt install -y mariadb-server php

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"\
php -r "if (hash_file('sha384', 'composer-setup.php') === 'baf1608c33254d00611ac1705c1d9958c817a1a33bce370c0595974b342601bd80b92a3f46067da89e3b06bff421f182') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=../bin --filename=composer
rm composer-setup.php
