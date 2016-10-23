#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	:
}

if [ "$0" = "${BASH_SOURCE[@]}" ]; then
	main "$@"
fi

