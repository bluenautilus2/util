#!/bin/bash
date > /tmp/brew-update-upgrade
/opt/homebrew/bin/brew update --quiet 
/opt/homebrew/bin/brew upgrade --quiet
