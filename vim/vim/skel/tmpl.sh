#!/usr/bin/env sh

# N.B. This MUST be the first thing to execute or else sourcing check won't
# work.
_SOURCETEST=$_

main() {
	:
}

if [ "$_SOURCETEST" != "$0" ]; then
	main
fi
