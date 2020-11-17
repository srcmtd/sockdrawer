# :socks: sockdrawer

Sockdrawer is an alias identity manager for Red Teams, OSINT collectors,
journalists, and privacy-conscious people. Its name comes from the term
_[sockpuppet](https://en.wikipedia.org/wiki/Sockpuppet_\(Internet\))_.

## Setup

* Ruby 2.7.2
* Rails 6
* PostgreSQL 13

### Docker and Compose

```
docker-compose up -d
docker-compose exec web rails db:migrate RAILS_ENV=development
open http://localhost:3000
```

### Ubuntu/Debian

```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
\curl -sSL https://get.rvm.io | bash

source /etc/profile.d/rvm.sh
rvm install 2.7.2
rvm use 2.7.2 --default
gem install bundler

sudo apt update
sudo apt-get install -y webpack npm vim bash-completion wget curl postgresql-13 postgresql-client-13 npm nodejs yarn libpq-dev

sudo su - postgres
psql
CREATE USER {USERNAME HERE} SUPERUSER; #change username to match your env

cd sockdrawer-main
mkdir -p node_modules/.bin
cp ./bin/webpack* node_modules/.bin/

yarn config set ignore-engines true
./bin/setup

bundle exec rails webpacker:install
bundle exec rails server
```
