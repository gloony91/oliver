ideas
=====

ideas that should or have already been implemented.

- [x] ~~make the backup directory hidden (`.backup`)~~

- [x] add silent mode (`--silent`) so commands will hide output

- [x] when running `olive list`, list the repos that are currently in the directory against
the repos that are currently being tracked. repos that are in both (the `Olivefile` and the current directory)
should be listed as green (using rainbow), and directories that are only found in one of the two options
will be listed as red.

- [x] [Douglas](https://twitter.com/istx25) gave me this cool
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

~~I spent, like, 50 minutes on this and I can't figure out a good way
to do it, though, so.. yeah~~

~~I'll add it as soon as I can figure it out.~~

- [ ] when deleting repos check if everything's been pushed and only
delete without prompting the user first if everything has. if there's still shit
that hasn't been pushed ask the user and double check if they wanted
to do all that work for nothin'
