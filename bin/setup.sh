#!/bin/bash

set -e

for var in B2_ACCOUNT_ID B2_ACCOUNT_KEY RESTIC_PASSWORD RESTIC_REPOSITORY; do
	eval [[ -z \${$var+1} ]] && {
		>&2 echo "ERROR: Missing required environment variable: $var"
		exit 1
	}
done

if ! restic unlock; then
	restic init
fi
