#!/bin/sh
# Install been and search plus their man pages.
#   sudo ./install.sh            -> /usr/local
#   PREFIX=$HOME/.local ./install.sh
set -eu
PREFIX="${PREFIX:-/usr/local}"
BIN="$PREFIX/bin"
MAN="$PREFIX/man/man1"
[ -d "$PREFIX/share/man" ] && [ ! -d "$PREFIX/man" ] && MAN="$PREFIX/share/man/man1"
cd "$(dirname "$0")"
command -v perl >/dev/null 2>&1 || { echo "perl not found" >&2; exit 1; }
perl -c bin/been   >/dev/null
perl -c bin/search >/dev/null
mkdir -p "$BIN" "$MAN"
install -m 755 bin/been bin/search "$BIN/"
install -m 644 man/been.1 man/search.1 "$MAN/"
echo "installed: $BIN/been $BIN/search"
echo "man pages: $MAN/been.1 $MAN/search.1"
echo "tip: alias been='been -k'"
