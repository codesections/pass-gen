# pass-gen

`pass-gen` generates secure, pronounceable passphrases that can be used on their own, copied to a GUI password manager, or piped directly into a password manager that accepts standard input.

Password security is important.  But imagine you need to log into your email account from a computer at the library.  Which password would you rather type in: `{!]&Sk)r"ss|$K40:]PP''3k-` or `skirt?UNSTEADY?legend?SUPERJET?livable?DINGBAT?507`?  What if I told you that the second one is just as secure as the first?

Anytime you might need to type in a password, or read a password out to someone else, or use a password on a device that doesn't have your password manager installed—that is, anytime at all—you would be better off using a securely generated passphrase.

Of course, that doesn't mean that you **shouldn't** use a password manager for those times when you _don't_ need to type your password in.  So, ideally you'd want a password generator that plays well with your password manager.  In the Unix tradition, the best way for one tool to play well with another is to produce plain-text standard output.

pass-gen does exactly that.  Use it to generate secure, pronounceable passphrases and then pipe them on to any other tool that accepts standard input. 

pass-gen is:

* **Secure** — pass-gen uses lengthy wordlists, secure random number generation, and sane defaults to ensure that all generated passphrases are cryptographically impregnable.  With default settings, the average entropy of a pass-gen generated passphrase is 532 bits.  Even if an attacker had full knowledge of the wordlist and generation algorithm, the default settings produce a minimum entropy of 93 bits.
* **Customizable** — The best way to avoid attackers knowing how you generated a password is to generate it in a different way than anyone else.  Although pass-gen is fully secure without any configuration, you can fully customize the password-generation process, either through command-line options or via a configuration file.  This customization includes the ability to use any of the dozens of built-in wordlists, or to create your own custom wordlist.
* **Dependency-free** — Password generation should be lightweight and portable; you never know when you might need a new password.  To that end, pass-gen does not require installing Python, Perl, NodeJs, Rust, or any other runtime.  Nor does it require compilation or depend on unusual tools.  If you can run a Bash script (hint: if you are on Linux, Mac, or Windows 10, you can run Bash), you can run pass-gen. 

## Installation 
To install pass-gen, run the following command in your terminal:

```
git clone https://gitlab.com/codesections/pass-gen.git && \
cd pass-gen && \
sudo ./install.sh
```



If you ever need to uninstall, run the following command from the pass-gen directory:

```
sudo ./unistall.sh
```

## Usage
See the manual page for full details (after installing pass-gen, run `man pass-gen`) or run `pass-gen --help` for shorter information. 

**basic usage**:

```
$ pass-gen 
Generated passphrase copied to clipboard.  Will clear in 45 seconds.
```

```
$ pass-gen -e
Generated passphrase copied to clipboard.  Will clear in 45 seconds.
OUTTHINK-barman-AFTERMOST-liqueur-LANDLORD-jovial-134
```

**advanced usage**:

```
$ pass-gen --padding-before 2 --padding-after 1 --length 7 -e 
Generated passphrase copied to clipboard.  Will clear in 45 seconds.
34OUTBREAK^caucus^PROBLEM^attempt^CARLESS^outsell^CORRECT^8
```

**Usage with _pass_, the standard Unix password manager**:

```
$ pass-gen -e | pass add -e USERNAME
Generated passphrase copied to clipboard.  Will clear in 45 seconds.
[master 8563f73] Add given password for USERNAME to store.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 USERNAME.gpg
```

If you do not wish to pass command-line options to pass-gen, you may optionally create a ~/.passgenrc file to specify default values different from the built-in defaults. 

**Example ~/.passgenrc configuration file**;

```
word-list=~/pass-gen/wordlists/Beale_wordlist
echo-password
padding-after=1
padding-before=1
character-list=~/pass-gen/character-lists/ASCII_symbol_list
```

## Alternatives to pass-gen
There are many alternative passphrase generators.  I believe they all have some issues, which is why I wrote pass-gen.  However, in the interest of full disclosure, I list them all below. 

* Built-in password generators bundled with password managers (such as pass, 1Password, KeePassXC, etc.).  These password generators typically either do not support passphrases at all, or do not support easy customization of generated passphrases, leaving them potentially more vulnerable to brute-force attacks. 
* **hsxkpasswd** — an extremely good password generator written in Perl.  This is the password generator I used before writing pass-gen, and it served as an inspiration for many of pass-gen's features.  It suffers from only two flaws: first, it is less secure by default (because it uses a smaller wordlist unless configured to use a longer one).  As a result, its default configuration results in only 52 bits of entropy against an attacker with full knowledge of how the password was generated.  The standard (paranoid) recommendation is to ensure 72 bits of entropy; pass-gen produces passwords with 93 bits of entropy by default.  Second and more fundamentally, hsxkpasswd is written in Perl, and thus requires a full Perl runtime to be installed. 
* **node-xkcd-password** — A password generator written in NodeJs.  Less customizable.  Requires a NodeJs runtime.
* **PWgen** — Windows only.

## Bug reports and contributing 

pass-gen is under active development (see the roadmap, below) and would welcome new contributors.  pass-gen is currently co-hosted on both GitLab and GitHub, so please feel free to file issues, make pull requests, or otherwise contribute through either site.  Also feel free to submit bug reports or patches via email, either to pass-gen@codesections.com or to daniel@codesections.com.

## Roadmap

Planned future features:

* Encrypted configuration file
* Support for using multiple wordlist files in the same passphrase
* Additional built-in wordlist files (especially non-English files)
* Additional error handling
* Optionally providing a Makefile in addition to an install.sh script

