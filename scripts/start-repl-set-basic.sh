#!/bin/bash
set -e
set -x

pushd "${DRIVERS_TOOLS}/.evergreen/docker"

# Can run from master once DRIVERS-3280 is resolved.
git checkout 36dd90cc38c3d36cab20944faf6eb0e896bc0cc5

TOPOLOGY=replica_set ./run-server.sh

popd
