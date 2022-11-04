#!/bin/bash

# Wrapper for the formatter that passes action args and processes the output.
# Required args:
# - Path to base directory.
# - File include glob pattern.
# - Whether to fail on file changes.

if [[ $# -ne 3 ]]; then
  echo 'Exactly three parameters (base dir path, input file pattern, fail on changes) required.'
  exit 1
fi

base_path=$1
include_pattern=$2
fail_on_changes=$3

cd "/github/workspace/$base_path" || exit 2
changed_files_before=$(git status --short)

/opt/idea/bin/format.sh -m $include_pattern -r .

changed_files_after=$(git status --short)
changed_files=$(diff <(echo "$changed_files_before") <(echo "$changed_files_after"))
changed_files_count=$(($(echo "$changed_files" | wc --lines) - 1))

echo "$changed_files"
echo "files-changed=$changed_files_count" >> $GITHUB_OUTPUT

if [[ "$fail_on_changes" == 'true' ]]; then
  if [[ $changed_files_count -gt 0 ]]; then
    echo 'Failing, because these files changed:'
    exit 1
  fi
fi