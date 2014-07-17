oliver
======

oliver manages your local GitHub
repositories for you with a simple oliverFile.

installation
------------

oliver is a CLI that you can install
through [RubyGems](https://rubygems.org)

```bash
$ gem install oliver
```

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
  |----- src/
  |----- bin/
  |----- lib/
  |----- README.md
  |
  |- git_project_2/
  |----- src/
  |----- bin/
  |----- lib/
  |----- README.md
  |
  |- git_project_3/
  |----- src/
  |----- bin/
  |----- lib/
  |----- README.md
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

the thing that differentiates oliver with
typical things (no examples..) is that
it gives you access to the directory from
anywhere.. which you could easily do with a public
shell variable.

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

the `olive` command will be what you use
when working with oliver, similar to how
bundler uses the `bundle` command.

### start tracking a repo

this will add it to the tracking list

```bash
$ olive add repo-name/
```
### stop tracking a repo

this will remove it from the tracking list
and locally delete the repo

```bash
$ olive remove repo-name/
```

### list tracked repos

list all of the repos that're being tracked

```bash
$ oliver list
```

### update (`git pull`) each repo

essentially `cd` into each individual
repo and run `git pull`

```bash
$ oliver update
```

extras
======

oliver uses [rainbow](https://github.com/sickill/rainbow),
a sick gem / library for making Terminal all colourful and stuff.

it's pretty cool, but if you don't like it, just
append `colour=off` to any statement

don't forget to spell *"colour"* **the proper way**.

testing
=======

refer to [TESTING.md](https://github.com/trommel/oliver/blob/master/spec/TESTING.md).

l3g4l 0bl1g4t10n$
=================

is there even a clear idea to steal?

this is my "idea". please don't steal it.
