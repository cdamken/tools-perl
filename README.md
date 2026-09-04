# tools-perl

Two small, sharp Unix utilities, `been` and `search`, kept alive and running
on modern Perl.

## Written by Jeffrey Friedl

**These tools were written by Jeffrey Friedl**, not by us. He wrote them
between 1991 and 1996 while working at Omron in Kyoto, Japan, and gave them
away on his homepage with the license line
*"Copyright 19.... ah hell, just take it."*

Most people know his book without knowing his name: he is the author of
[*Mastering Regular Expressions*](https://regex.info/book.html) (O'Reilly,
1997), the book that taught a generation of programmers what a regex actually
does. Before that he was already writing tools like these, and they were good
enough that we have run them every single day for thirty years. `been` still
greets us at login with the birthdays coming up. `search` is still the
find-plus-grep we reach for first.

**Thank you, Jeffrey.** Everything that is good about these programs is yours.
The bugs introduced since are ours.

His original Omron page is gone. The complete 1997 collection, exactly as he
published it, is preserved in [`original/`](original/) from the
[Wayback Machine](http://web.archive.org/web/19970719143436/http://www.wg.omron.co.jp:80/~jfriedl/perl/index.html).
He writes today at [regex.info](https://regex.info/blog/).

## The tools

| Tool | What it does | Original |
|---|---|---|
| **`been`** | "How long has it been since ___ (or until ___)?" Reads a plain-text file of dates and prints durations, with special handling for birthdays and anniversaries. | 1992–1996 |
| **`search`** | `find` + `grep` in one command, with Perl regexes, sane default exclusions (binaries, `.git`, `node_modules`…), color highlighting and a full man page. | 1994–1996 |

## Install

Requires Perl 5.10 or newer (any Linux or macOS has it). No CPAN modules.

```bash
git clone https://github.com/cdamken/tools-perl.git
cd tools-perl
sudo ./install.sh          # -> /usr/local/bin, man pages -> /usr/local/man/man1
```

Or copy by hand: `bin/been` and `bin/search` go anywhere in your `$PATH`,
`man/*.1` go into a `man1/` directory on your `$MANPATH`.

## been

Create `~/.been` with one event per line, `<date> : <flags> : <text>`:

```
12 Apr 1966 : birthday : Jeffrey Friedl
30 Apr 1961 : anniversary : Mom & Dad
25 Dec : : Christmas
7 May 2027 : 3m : passport expires      # shown only within 3 months
10 May 1933 : 0d : Omron founded         # archived: shown only with -a
```

```
$ been
60 years, 4 months, 23 days since birthday of Jeffrey Friedl
3 months, 21 days until Christmas
```

- `been -k` colors the output (yellow span, green *until*, cyan *since*).
  A good line for your shell login file: `alias been='been -k'`.
- `been -a` shows everything, including archived `0d` lines.
- `been passport` treats non-file arguments as case-insensitive regexes.
- `been -c` emits `~/calendar` format for `calendar(1)`.
- Dates: `April 12, 1966`, `4/12/66`, `12-Apr-66`, `66.4.12`, `12 Apr 66`,
  and Japanese era years like `S41.4.12`. Full details: `man been`.

## search

```bash
search portfolio                 # lines matching, filename prefixed
search -w -bold portfolio        # whole words, highlighted
search -list portfolio           # filenames only
search -nice "function index"    # grouped by file
search -dir /etc -dir ~/src ssh  # several trees
search -all foo                  # include normally-skipped files
search -why -list foo            # explain every skipped file
search -showrc                   # show active exclusion rules
```

Several regexes are OR-ed: `search foo bar 'baz+'`. Exit status is 0 if
something was found, 1 if nothing, 2 on error. Exclusions live in
`~/.search`; without one, a built-in default skips binaries, `.o`, `.gz`,
images, PDFs, `.git`, `.svn`, `.hg` and `node_modules`. Full details:
`man search`.

## What changed since 1996

See [CHANGELOG.md](CHANGELOG.md). In short:

**been** — two-digit years default to 20xx (birthdays and anniversaries are
kept in the past, other events at most 20 years in the future); `-k` ANSI
color; man page split out of the script into `man/been.1`; runs clean
under `perl -w` on 5.30+.

**search** — Dan Schmidt's Windows port merged (`-win`); default exclusions
extended for today's trees; the `$^W` literal control character fixed; a
heredoc terminator fixed that stopped the script from compiling at all;
man page split out into `man/search.1`.

The other programs in Friedl's collection (`webget`, `sdiff`, `a2ps`,
`transgif`, `texi2troff`, `trans`, the romaji/kana converters and the Perl 4
libraries) are preserved untouched in `original/`. Most no longer compile on
Perl 5.22+ (`defined(@array)` became a fatal error) and all have modern
replacements, so they are not maintained here.

## License

Jeffrey Friedl released the originals with *"ah hell, just take it."*
Modifications by Carlos Damken are under the [MIT License](LICENSE).
If you are Jeffrey Friedl and want anything changed here, open an issue and
it will be done.
