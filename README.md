oliver
======

[![Gem Version](https://badge.fury.io/rb/oliver.svg)](http://badge.fury.io/rb/oliver)

oliver manages your local GitHub projects
in a simple YAML file.

> "Like podfiles for Git repos."
-- [@istx25](https://github.com/istx25)

Installation
------------

You can install oliver through [RubyGems](https://rubygems.org/gems/oliver)

```bash
$ gem install oliver
```

Documentation
----

### Example

Create the base `.Olivefile.yml`

```bash
$ cd projects
$ olive init
$ $EDITOR .Olivefile.yml
```
and then add whatever you'd like to the
YAML file

```yaml
---
repos:
  trommel:
    - "oliver"
    - "textymous"
  istx25:
    - "Fluorescent"
    - "dotfiles"
  misc:
    - "trommel/calkoolator"
---
```

- Remember to use spaces for indentation, not tabs.
- `Misc` is preferred syntax for use
when there's only one repo by an author in
your YAML file.

### Initializing the root

```bash
$ olive init [-d|--directory] [directory name (defaulted to 'olives')]
```

### Clones/Remove repos based on YAML file

Clones repos listed in the YAML file and
removes ones saved locally that aren't found
in the file

```bash
$ olive install
```

### List tracked repos

List all of the repos that are being tracked

```bash
$ olive list
```

### Update (`git pull`) each repo

Essentially run `git pull` in each
individual repo

```bash
$ olive update
```

Notes
-----

- Arguments after the actual arguments will be ignored, for example:

```bash
# everything after "repo_name" will be ignored
$ olive init -d repo_name here are more arguments
```

Extras
------

oliver uses [rainbow](https://github.com/sickill/rainbow), a gem for colouring the Terminal prompt.
If you want to use it, just prepend `colour=on` to any olive command.

To-Do
-----

- [ ] Remake the help/info thing to be slimmer & look better
- [ ] Fix bugs with..
    - [ ] `update` (tons)
    - [ ] `install` (not as many)
    - [ ] `list` (hardly any, I think)

Ideas
-----
Refer to [ideas.md](https://github.com/trommel/oliver/blob/master/IDEAS.md).

Contribution
------------
Refer to [contribution.md](https://github.com/trommel/oliver/blob/master/spec/CONTRIBUTING.md).

Licensing
---------
Refer to [LICENSE](https://github.com/trommel/oliver/blob/master/spec/LICENSE).
