# Jeffrey's Perl Stuff (1997 snapshot)

Unmodified contents of `jeffrey.perl.tar.gz` as generated on 07.02.1997 and
retrieved from the Internet Archive on 04.09.2026:

http://web.archive.org/web/19970719143436/http://www.wg.omron.co.jp:80/~jfriedl/perl/index.html

| File | Version | Description (Friedl's own words) |
|---|---|---|
| `been` | 961120.8 | Reports the time since or until user-specified events |
| `search` | 960908.11 | A combo of find and grep, do a 'grep' on a whole directory tree |
| `webget` | 961120.32 | Fetches a URL (HTTP, FTP), proxy, redirects, auth, update-if-modified |
| `inlined/webget` | | Same, with `network.pl` and `www.pl` inlined |
| `sdiff` | 911001.1 | Show DIFFerences: highlights a diff for human viewing |
| `a2ps`, `a2ps.1` | 960205.5 | Text to pretty PostScript |
| `transgif` | 960330.8 | Normal GIF to transparent-background GIF |
| `texi2troff` | 960205.011 | Texinfo to troff, sort of |
| `trans`, `trans.el` | 960412.8 | Japanese/English dictionary lookup with Emacs interface |
| `romaji2kana.pl`, `kana2romaji.pl` | | Romaji / kana conversion |
| `network.pl`, `www.pl` | 970124.11 / 961205.24 | Internet connections, URLs, HTTP sessions, proxies |
| `readline.pl`, `perl_readline.man` | 940817.008 | Command-line editing library |
| `timespan.pl`, `package_as.pl`, `gif.pl` | | Small libraries |

Status on Perl 5.30+: `been`, `sdiff`, `webget` (main script), `gif.pl`,
`kana2romaji.pl`, `network.pl`, `romaji2kana.pl`, `timespan.pl` pass `perl -c`.
The rest fail on `defined(@array)` / `defined(%hash)`, fatal since Perl 5.22,
or (search) a literal control character. Maintained versions of `been` and
`search` are in `../bin/`.
