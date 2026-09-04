# Changelog

## 2026.09.04

### been
- Two-digit years: `$y += 1900` replaced by a 20xx default with two rules.
  Birthdays/anniversaries (`bday`, `anniv`, `annual`) are moved to the past
  if they would land in the future; other events may be up to 20 years in
  the future. `4/12/66` is still 1966, `1/1/30` is now 2030.
- New `-k` flag: ANSI color (yellow duration, green `until`, cyan `since`).
- Man page moved out of the script (`__END__` + roff diversion trick) into
  `man/been.1`; documented `-k` and the two-digit-year rule.
- New `-v` flag prints the version.
- Shebang `/usr/bin/perl`; CRLF line endings normalized to LF.
- `$version` set to `2026.09.04` (was commented out).

### search
- Merged Dan Schmidt's Windows 95 port (`-win`, `$USE_INODES`).
- Default exclusions: added `.DS_Store`, `.png .pdf .mp3 .mp4` and the
  directory skip list `.git .svn .hg node_modules` (`-dskip`).
- `$^W` was a literal `\x17` control byte in the 1996 source; written out.
- Fixed the internal default-rc heredoc: its terminator
  `--------INLINE_LITERAL_TEXT` was indented and shared a line with `}`,
  which made the script fail to compile on every Perl.
- Default compressed-file filter uses `gzip -dc` instead of `zcat`, which on
  macOS only handles `.Z`.
- Man page moved out of the script into `man/search.1`.
- Shebang `/usr/bin/perl`.

## 1996 (Jeffrey Friedl)
- `been` 961120.8, `search` 960908.11 — last versions published at
  www.wg.omron.co.jp/~jfriedl/perl/. See `original/`.
