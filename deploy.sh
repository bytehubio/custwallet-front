#!/bin/bash

NAME="custwallet.app" && eval "$(ssh-agent -s)" || true && ssh-add ~/.ssh/${NAME}

git checkout -b main
git pull origin main

# gem install bundler
bundle

sudo systemctl stop custwallet.app
npm install

DISABLE_SPRING=1 RAILS_ENV=production bin/rake db:create
DISABLE_SPRING=1 RAILS_ENV=production bin/rake db:migrate
DISABLE_SPRING=1 RAILS_ENV=production bin/rake assets:precompile
pkill -9 -f spring

sudo systemctl start custwallet.app