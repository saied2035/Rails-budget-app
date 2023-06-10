#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle curl --create-dirs -o $HOME/.postgresql/root.crt <%= ENV['CONNECT_DATABASE'] %>