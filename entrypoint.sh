#!/usr/bin/env bash
set -e

if [ "$1" == 'supervisor' ]; then

    # Deactivate fswatch if needed
    if [ -z $ENABLE_WATCH ]; then
      mv /etc/supervisor/conf.d/supervisor.fswatch.conf /etc/supervisor/conf.d/supervisor.fswatch.conf.deactivated
    fi

    # Check if a script is available in /docker-entrypoint.d and source it
    for f in /docker-entrypoint.d/*; do
        case "$f" in
            *.sh)     echo "$0: running $f"; . "$f" ;;
            *)        echo "$0: ignoring $f" ;;
        esac
    done
fi

exec "$@"
