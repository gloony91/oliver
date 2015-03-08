oliver
======

[![Gem Version](https://badge.fury.io/rb/oliver.svg)](http://badge.fury.io/rb/oliver)

oliver manages your local GitHub projects in one simple file. It's like
[CocoaPod's](http://cocoapods.org/) "podfiles", but for your Git repos.

Installation
------------

You can install oliver through [RubyGems](https://rubygems.org/gems/oliver)

```bash
$ gem install oliver
```

Documentation
----

### Example

Create the base `.oliver`

```bash
$ cd projects
$ olive init
$ $EDITOR .oliver
```
and then add whatever you'd like to the file (write in JSON)

```json
{
	"trommel": [
		"oliver",
		"textymous"
	],
	"istx25": [
		"Fluorescent",
		"dotfiles"
	],
	"misc": [
		"https://exampleserver.com/repo"
	]
}
```

- Use `Misc` for URLs that aren't hosted on GitHub

### Initializing the root

```bash
$ olive init
```

### Clones/Remove repos based on `.olive`

Clones repos listedy and
removes ones saved locally that aren't found
in the file. Careful removing directories from the list because
[Olive will delete them without a second thought](#to-do).

```bash
$ olive install
```

### List tracked repos

List all of the repos that are being tracked

```bash
$ olive list
```

The + (plus sign) next to the repo shows that it'll be cloned on the next
`olive install`. The # (pound sign) next to the repo
means it'll remain unaffected.

### Update (`git pull`) each repo

Essentially run `git pull` in each
individual repo

```bash
$ olive update
```

To-Do
-----

- [ ] Add `.settings` file for better customization and easier options usage
- [ ] In `.settings`, give option to enable a "safe barrier", essentially
Oliver will prompt you before it removes any directory
- [x] Remake the help/info thing to be slimmer & look better
- [x] Expand repo support to Git in general, not just GitHub
- [ ] Add support to `olive list` so that it'll list repos that're already cloned but not on the list (so the user knows that it's being removed on the next `olive install`)
- [ ] Clean up the mess that is [`commands.rb`](https://github.com/trommel/oliver/blob/cleanup/lib/oliver/commands.rb)

Ideas
-----
Refer to [ideas.md](IDEAS.md).

Contribution
------------
Refer to [contribution.md](CONTRIBUTING.md).

Licensing
---------
Refer to [LICENSE](LICENSE).
