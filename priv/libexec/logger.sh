#!/bin/bash --posix

set -e

IS_TTY=false
if [ -t 1 ]; then
    if which tput >/dev/null; then
        IS_TTY=true
    fi
fi

if [ "$IS_TTY" = "true" ]; then
    txtrst=$(tput sgr0)             # Reset
    txtbld=$(tput bold)             # Bold
    bldred=${txtbld}$(tput setaf 1) # Red
    bldgrn=${txtbld}$(tput setaf 2) # Green
    bldylw=${txtbld}$(tput setaf 3) # Yellow
else
    txtrst=
    txtbld=
    bldred=
    bldgrn=
    bldylw=
fi

# Log an error message in red and exit with a non-zero status
fail() {
    printf "${bldred}%s${txtrst}\n" "${*}"
    exit 1
}

# Log an informational message in yellow
notice() {
    printf "${bldylw}%s${txtrst}\n" "${*}"
}

# Log a success message in green
success() {
    printf "${bldgrn}%s${txtrst}\n" "${*}"
}
