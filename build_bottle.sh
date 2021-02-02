#!/usr/bin/env bash
(cd /usr/local/Homebrew && git stash && git clean -d -f)
ln -s $PWD "$(brew --repo uiuclibrary/build)"
trap "rm $(brew --repo uiuclibrary/build)" EXIT
brew test-bot --debug --verbose --tap uiuclibrary/build --root-url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ --only-formulae "$(brew --repo uiuclibrary/build)/$1"
