oliver
======

[![Gem Version](https://badge.fury.io/rb/oliver.svg)](http://badge.fury.io/rb/oliver)

oliver manages your local GitHub
repositories for you with a simple `.Olivefile.yml`.

> "like podfiles, but for git repositories"
-- [@istx25](https://github.com/istx25)

installation
------------

oliver is a CLI that you can install
through [RubyGems](https://rubygems.org/gems/oliver)

```bash
$ gem install oliver
```

now, [skip the shit in this readme](https://github.com/trommel/oliver#docs)

what the heck
-------------

users can then `git clone` a list of repos, easily,
and delete tracked repos as well.

think of this as a directory full of repos (that contain
  `.git` directories) that can be tracked.

it's 1:05 AM right now, so this is probably just
a silly idea that doesn't actually make any sense.


idea
----

managing an area where you keep local (cloned)
Git repos is kind of annoying, and since everybody's
making scripts and stuff to manage files, I thought
"hey, why not make one for managing local git repos?"

the plan is that the user is to have a single
directory (stored wherever they want) that contains
all of the different git repos they've cloned.

for example (I might just make a "physical"
demonstration of this in this repo):

```
main_directory/
  |- git_project_1/
  |----- bin/
  |----- lib/
  |----- README.md
  |----- .git/
  |
  |- git_project_2/
  |----- bin/
  |----- lib/
  |----- README.md
  |----- .git/
  |
  |- git_project_3/
  |----- bin/
  |----- lib/
  |----- README.md
  |----- .git/
```

and then, if you want to see
all of the directories that
you're tracking, you can run
`oliver list`.

you're probably thinking:
*"can't I just run `ls` inside the directory
and it'll do the same thing?"*, **and the
answer to your question is _yes_**.

I have no idea what I'm doing.

~~the thing that differentiates oliver with
typical things (no examples..) is that
it gives you access to the directory from
anywhere.. which you could easily do with a public
shell variable.~~

> I have no idea what I'm doing.


things I'm thinking so far
--------------------------

I'm not totally sure how this
is going to work. here's what I do know:

repos will be tracked and be kept in a list.
users can add a repo to the list, remove the repo,
view repos on the list and update the repo (essentially
  run `git pull` on each individual repo).

docs
----

### setup the repo

create the base `.Olivefile.yml`

```bash
$ olive init
```

(and in the `.Olivefile.yml`)

```yaml
---
repos:
  trommel:
    - "oliver"
    - "textymous"
  istx25:
    - "Fluorescent"
    - "dotfiles"
  misc: # use the misc category for old syntax. these don't really work, yet
    - "trommel/calkoolator"
---

# use 3 spaces for indentation, not tabs! :P
# I spent, like, an hour trying to fix a non-existent bug because of this
# smh so hard
# by the way, this is YAML, for anyone interested
# then again, you could just look at the code and determine that yourself
```

you can also initialize the repo
with a folder, if you want to skip a couple
of steps (things surrounded by '[]' means
that they're optional)

```bash
$ olive init [-d|--directory] [directory name (defaulted to 'olives')]
```

### install and/or remove listed repos

```bash
$ olive install
```

### clone and start tracking a repo

this will add it to the tracking list

```bash
$ olive add username/repo
```
### remove (delete) and stop tracking a repo

this will remove it from the tracking list
and locally delete the repo

```bash
$ olive remove username/repo
```

### list tracked repos

list all of the repos that're being tracked

```bash
$ olive list
```

### update (`git pull`) each repo

essentially `cd` into each individual
repo and run `git pull`

```bash
$ olive update
```

extras
------

oliver uses [rainbow](https://github.com/sickill/rainbow),
a sick gem / library for making Terminal all colourful and stuff.

it's pretty cool, but if you don't like it, just
append `colour=off` to any statement

don't forget to spell *"colour"* **the proper way**.

things to remember
==================

- run everything with `olive`, not `oliver`. "oliver" is the name
of the project, `olive` is the name of the CLI.

- if you want to clone a repo from somewhere other than GitHub (GitHub
  is defaulted), just use the full git URL instead of the simple
  `username/repo-name`, for example `git://projects.josh.com/oliver.git`.

- arguments after the actual arguments will be ignored, i.e.:

```bash
# everything after -d will be ignored
$ olive init -d hey here are more arguments
```

branches
========

(there may or may not be an unstable branch at the moment.
I'm constantly adding it and deleting it. i won't push gems
from the unstable branch, only from master.)

I kept fixing bugs and then I would frantically
push the fixes because I was worried people, if anyone actually
uses oliver, would experience problems with it if I didn't push
the fix immediately. the problem, obviously, with this
is that I didn't catch other things I needed to fix, and now I have,
like, a billion commits, even though most of them are just me changing
the version variable.

anyways, there's an [unstable](https://github.com/trommel/oliver/tree/unstable)
branch, if you want to check it out.
the official gem that's hosted on rubygems, though, is
the gem of the master branch, and that's how it's going to stay.

also, the unstable branch probably maybe won't work.

there also might be a "clean" branch, which is basically a (possibly) outdated
version of oliver that'll backup your directories when you run `olive install`
(if the repo isn't on the list of repos to track). the master branch
is now considered "unsafe", meaning that it will simply delete the repo
if it's not on the list when `olive install` is run.

this is probably maybe a bad idea, but it's a lot easier to maintain.
if you don't like this, fix it, and make it work properly :)

ideas
-----

refer to
[IDEAS.md](https://github.com/trommel/oliver/blob/master/LICENSE).

versions
--------

for some reason, I was using things like "1.5" as oliver's
version for a bit, even though oliver isn't even finished (to
  even the help menu), so if you check the previous gem versions,
the newest gem version is probably (maybe) smaller / below
previous gem versions. this was me being silly and not thinking.

as of right now (July 18, 2014, 6:19 PM), oliver's version
is 0.1.5, and it will continue to build off from there.

sorry about doing that silly thing.

reference (mostly for me but kind of helpful if you don't want to go looking through code shit)
--------------------------------------------

`FileManager::YAML['repos']` is where you can reference the repos in the `.Olivefile.yml`

you can use this by `require`ing `file_manager.rb` and then using modules and stuff

for example,

```ruby
require_relative '../file_manager'

FileManager::YAML['repos'].map |username, repos| do
  puts username
  repos.each do |repo|
    puts repo
  end
end
```

etcetera, etcetera

to do
-----

there's no checkmarked things right now because i just made this list, please
don't think i'm some unproductive asshole who does nothing all day or something
idk 

- [ ] remake the help/info thing to be slimmer and look better
- [ ] get `add` working
- [ ] get `remove` working
- [ ] fix bugs with `update` (tons)
- [ ] fix bugs with `install` (not as many)
- [ ] fix bugs with `list` (hardly any, afaik)

known bugs
----------

- for some reason, cloning private
repos isn't working right now.
I don't know why. Oliver uses standard
git, so this shouldn't be an issue.

testing
-------

refer to
[TESTING.md](https://github.com/trommel/oliver/blob/master/spec/TESTING.md).

contribution
------------

refer to
[CONTRIBUTING.md](https://github.com/trommel/oliver/blob/master/spec/CONTRIBUTING.md).

if you think this is cool
-------------------------

I hate dropping a link for donations,
but a dude's gotta eat.

[![Support via Gittip](https://rawgithub.com/twolfson/gittip-badge/0.2.0/dist/gittip.png)](https://www.gittip.com/trommel)


licensing
---------

refer to
[LICENSE](https://github.com/trommel/oliver/blob/master/spec/LICENSE).
