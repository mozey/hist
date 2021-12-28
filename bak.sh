#!/usr/bin/env bash
# WARNING Do not exit on error since this file is included in ~/.bashrc

# This script creates backups of the bash history file, see
# https://github.com/mozey/bash_hist

HOME=${HOME}
HISTFILE=${HISTFILE} # location of history file

# KEEP number of lines from tail of BASH_HIST when creating new BACKUP
KEEP=200
# BACKUP is the monthly backup file for bash history
BACKUP=${HISTFILE}.month.$(date +%Y%m)

# https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html
#
#   -s file
#     True if file exists and has a size greater than zero.
#
#   file1 -nt file2
#     True if file1 is newer (according to modification date) than file2,
#     or if file1 exists and file2 does not.
#
if [[ -s "${HISTFILE}" && "${HISTFILE}" -nt "$BACKUP" ]]; then
  # History file is newer then backup
  if [[ -f ${BACKUP} ]]; then
    # Backup file exists, update it
    cp -f "${HISTFILE}" "${BACKUP}"
  else
    # Create new backup and leave last few commands
    mv -f "${HISTFILE}" "${BACKUP}"
    tail -n${KEEP} "${BACKUP}" >"${HISTFILE}"
    # TODO reinitialize required?
    # history -r
  fi
fi
