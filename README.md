oliver
======

[![Dependency Status](http://img.shields.io/gemnasium/probablyjosh/oliver.svg)](https://gemnasium.com/probablyjosh/oliver)
[![Gem Version](http://img.shields.io/gem/v/oliver.svg)](https://rubygems.org/gems/oliver)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://probablyjosh.mit-license.org)


oliver manages your local GitHub projects in one simple file. It's like
[CocoaPods'](http://cocoapods.org/) "podfiles", but for your Git repos.

Installation
------------

You can install oliver through [RubyGems](https://rubygems.org/gems/oliver)

```bash
$ gem install oliver
```

Documentation
----

### Example

Create the base `.oliver` file

```bash
cd projects/
oliver init

vim .oliver
```
and then add whatever you'd like to the file. Write in JSON, and format it
with the username as the key and the repos in an array as the value of the user,
like so.

```json
{
	"trmml": [
		"oliver",
		"textymous"
	],
	"madebybright": [
		"Nimble",
		"woke",
		"madebybright.github.io"
	]
}
```

### Initializing the root

Creates the base `.oliver` file

```bash
$ oliver init
$ less .oliver
```

```json
{
  "trmmls": [
    "oliver"
  ]
}
```

### Clone/Remove repos based on `.olive`

Clones the listed repos and removes any local repo that isn't
listed in `.olive`. Be careful removing directories from the list because
[Olive will delete them without a second thought](#to-do).

```bash
oliver install
```

### List tracked repos

List all of the repos that are being tracked

```bash
oliver list
```

The + (plus sign) next to the repo shows that it'll be cloned on the next
`olive install`. The # (pound sign) next to the repo
means it'll remain unaffected. I'm running into some bugs here with oddly
formatted repo names. Add this to [to-do](#to-do).

### Pull/Update repos

`git pull` each repo.

```bash
oliver pull || olive update # Either work, who cares
```

To-Do
-----

- [x] Remake the help/info thing to be slimmer & look better
- [x] Expand repo support to Git in general, not just GitHub
- [ ] Add `.settings` file for better customization and easier options usage
- [ ] In `.settings`, give option to enable a "safe barrier", essentially
Oliver will prompt you before it removes any directory
- [ ] Add support to `olive list` so that it'll list repos that're already cloned but not on the list (so the user knows that it's being removed on the next `olive install`)
- [ ] Clean up the mess that is [`commands.rb`](https://github.com/probablyjosh/oliver/blob/cleanup/lib/oliver/commands.rb)
- [ ] Convert the argument parsing to [Clamp](https://github.com/mdub/clamp)

Ideas
-----
Refer to [IDEAS.md](IDEAS.md).

Contribution
------------
Refer to [CONTRIBUTING.md](CONTRIBUTING.md).

Licensing
---------
Refer to [LICENSE](LICENSE).
