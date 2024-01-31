#!/bin/bash

# Ubuntu setup
#sudo apt-get install -y gperf cmake ninja-build
#pip3 install wheel future pyelftools

# MacOS (ARM) setup
brew install gsed
brew install gawk
brew install gperf
brew install ninja
brew install ccache
python -m pip install --upgrade pip
pip install wheel future pyelftools
