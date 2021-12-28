#!/usr/bin/env bash
set -eu                   # exit on error or undefined variable
bash -c 'set -o pipefail' # return code of first cmd to fail in a pipeline

# Combine monthly history files into yearly file

HOME=${HOME}
HISTFILE="${HOME}/.zsh_history" # location of history file

# BACKUP is the yearly backup file for bash history,
# it also records the month when the year end was done
BACKUP=${HISTFILE}.year.$(date +%Y%m)

if [[ ! -e ${BACKUP} ]]; then
  # BACKUP does not exist
  echo "${BACKUP}"
  for f in "${HOME}"/.zsh_history.month.*; do
    if [[ -e ${f} ]]; then
      cat "${f}" >>"${BACKUP}"
      rm "${f}"
      echo "${f}"
    fi
  done
fi
