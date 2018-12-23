#!/usr/bin/env bash

# for anaconda2
cd /opt/anaconda2/5.0.1
# update conda
./bin/conda update -n root conda
# update packages to the latest version
./bin/conda update --all


# for anaconda3
cd /opt/anaconda3/5.0.1
# update conda
./bin/conda update -n root conda
# update packages to the latest version
./bin/conda update --all
