#!/usr/bin/env bash
# vim :filetype=bash

export CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export HOME_DIR="${XDG_DATA_HOME-${HOME}/.local/share}/tmux"
export PLUGINS_DIR="${HOME_DIR}"
export DEBUG_OPT=""
APP_NAME="Tmux"


plugins_script_path="${CURRENT_DIR}/scripts/plugins.sh"

counter=1

new-command() {
    tmux set -s command-alias[$((1000 + ${counter}))] "$1"="run-shell '$2'"
    counter=$(( counter + 1))
}

new-command "${APP_NAME}Install" "${plugins_script_path}"
new-command "${APP_NAME}Update" "${plugins_script_path} update"

source ${plugins_script_path} && plugins
