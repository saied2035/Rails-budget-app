#!/usr/bin/env bash
# exit on error
set -o errexit

echo "start path" &&

echo $PATH &&

echo "end path" &&

export RUBY_VERSION=3.1.2 && 
export BUNDLE_GEMFILE=$RENDER_SRC_ROOTGemfile &&
set_ruby_env $(fetch_or_build "3.1.2") &&
/opt/render/project/rubies/ruby-3.1.2/bin/gem update --system &&
/opt/render/project/rubies/ruby-3.1.2/bin/bundle config set --local deployment 'true'
/opt/render/project/rubies/ruby-3.1.2/bin/bundle install &&
bundle exec rake assets:precompile &&
bundle exec rake assets:clean &&
bundle exec rake db:migrate