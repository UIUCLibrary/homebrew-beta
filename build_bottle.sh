#!/usr/bin/env bash
(cd /usr/local/Homebrew && git stash && git clean -d -f)
ln -s $PWD "$(brew --repo uiuclibrary/test)"
trap "rm $(brew --repo uiuclibrary/test)" EXIT
brew test-bot --debug --verbose --tap uiuclibrary/test --root-url=https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/ --only-formulae "$(brew --repo uiuclibrary/test)/$1"
