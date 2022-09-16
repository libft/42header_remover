#!/bin/bash

set -e

git diff --cached --name-only --diff-filter=ACM -- '*.c' '*.h' | xargs -L1 sh hook/script/42header-remover.sh
