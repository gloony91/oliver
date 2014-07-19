ideas
=====

ideas that should or have already been implemented.

implement
=========

- [ ] add verbose mode (`--verbose`) so things like `olive install` will have output like

```bash
olive/ already exists.
dotfiles was cloned.
```

etc, etc. otherwise, this should be defaulted to silent.

implemented
===========

[Douglas](https://twitter.com/istx25) gave me this cool
idea that [CocoaPods](https://github.com/CocoaPods/CocoaPods) uses, where
you can run

```bash
$ olive install
```

it can not only install the repos on the list, but remove the repos
that have been installed locally but are no longer on the list.
this way, if you want to delete a bunch of repositories, you can simply
remove them from the list and run

```bash
$ olive install
```

I spent, like, 50 minutes on this and I can't figure out a good way
to do it, though, so.. yeah

I'll add it as soon as I can figure it out.

another idea was making the backup directory
hidden (`.backup`)
