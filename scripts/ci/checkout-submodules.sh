#!/bin/bash
set -euo pipefail

echo "## Fetch submodules"
source /mnt/software/Modules/current/init/bash
module load git

# Bamboo's checkout of unanimity doesn't set the "origin" remote to
# something meaningful, which means we can't resolve the relative
# submodules.  Override the remote here.
git remote set-url origin ssh://git@bitbucket.nanofluidics.com:7999/sat/blasr.git

rm -rf pbbam libcpp
git submodule update --init
git submodule foreach git pull origin develop
