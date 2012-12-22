Process to get application running with Vagrant.

bundle install
librarian-chef install

mkdir data-bags
mkdir roles

vagrant up

vagrant ssh
sudo usermod -a -G rvm vagrant
cd src
bundle install
rails g mongoid:config
rails s
