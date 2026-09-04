# tools-perl

`been` and `search`: two Unix command-line tools written by **Jeffrey Friedl**
in the 1990s, refactored to run on modern Perl.

If you are interested in the original author, see
<https://regex.info/blog/jfriedl-links/about?comments=all>.

| Tool | What it does |
|---|---|
| `been` | How long has it been since, or until, the events in `~/.been`. Handles birthdays and anniversaries. |
| `search` | `find` + `grep` in one command, with Perl regexes and sane default exclusions. |

## Install

Requires Perl 5.10 or newer. No CPAN modules.

```bash
git clone https://github.com/cdamken/tools-perl.git
cd tools-perl
sudo ./install.sh          # -> /usr/local/bin, man pages -> /usr/local/man/man1
```

## been

`~/.been`, one event per line, `<date> : <flags> : <text>`:

```
12 Apr 1966 : birthday : Jeffrey Friedl
25 Dec : : Christmas
7 May 2027 : 3m : passport expires      # shown only within 3 months
```

```
$ been
60 years, 4 months, 23 days since birthday of Jeffrey Friedl
3 months, 21 days until Christmas
```

`been -k` adds color, `been -a` shows everything, `been -v` prints the
version, `been <regex>` filters. Details: `man been`.

## search

```bash
search foo                  # lines matching, filename prefixed
search -w -bold foo         # whole words, highlighted
search -list foo            # filenames only
search -dir /etc foo        # another tree
search -all foo             # include normally-skipped files
```

Details: `man search`.

## Contents

- `bin/`, `man/`: the refactored tools and their man pages.
- `original/`: Friedl's complete 1997 collection, unmodified, from the
  [Internet Archive](http://web.archive.org/web/19970719143436/http://www.wg.omron.co.jp:80/~jfriedl/perl/index.html).
- `CHANGELOG.md`: what changed since 1996.

## License

Friedl released the originals with "Copyright 19.... ah hell, just take it."
The refactoring by Carlos Damken is under the [MIT License](LICENSE).
