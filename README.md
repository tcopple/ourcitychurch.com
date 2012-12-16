Process to get application running with Vagrant.

bundle install
librarian-chef install

mkdir data-bags
mkdir roles

vagrant up

vagrant ssh
cd src
bundle install
bundle exec rails s
