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
	"repos": {
		"trommel": [
			"oliver",
			"textymous"
		],
		"istx25": [
			"Fluorescent",
			"dotfiles"
		],
		"misc": [
			"github/hub"
		]
	}
}
```

- You can use `Misc` if you only want one repo by a user. You'll also have to use it if you're specifying a repo that's not on GitHub (I'll fix this at some point).

### Initializing the root

```bash
$ olive init -d [project name]
```

### Clones/Remove repos based on `.olive`

Clones repos listedy and
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

To-Do
-----

- [x] Remake the help/info thing to be slimmer & look better
- [ ] Expand support to any Git, not just GitHub

Ideas
-----
Refer to [ideas.md](IDEAS.md).

Contribution
------------
Refer to [contribution.md](ONTRIBUTING.md).

Licensing
---------
Refer to [LICENSE](LICENSE).
