oliver
======

[![Dependency Status](http://img.shields.io/gemnasium/probablyjosh/oliver.svg)](https://gemnasium.com/probablyjosh/oliver)
[![Gem Version](http://img.shields.io/gem/v/oliver.svg)](https://rubygems.org/gems/oliver)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://probablyjosh.mit-license.org)

oliver keeps track of your git repos in one simple dotfile, making it easy to keep track of the projects you're working on.

> "[CocoaPods](http://cocoapods.org/) for your git repos."

Installation
------------

You can install oliver through [RubyGems](https://rubygems.org/gems/oliver)

```bash
$ gem install oliver
```

Syntax
-------

Write in JSON, and format `.oliver` with the GitHub username as the key and the repos in an array as the value.

```json
{
	"trmml": [
		"oliver", "textymous"
	],
	"madebybright": [
		"Nimble", "madebybright.github.io"
	]
}
```

Documentation
-------------

### `oliver init [username=repos]`

Create an `.oliver` with the optional addition of username(s) and repo(s). The following will create a file with one user (trmml) and three repos belonging to that user (oliver, cameron, wobble)

```bash
oliver init trmml=oliver,cameron,wobble

less .oliver
```

```json
{
  "trmml": [
    "textymous",
    "oliver"
  ],
  "madebybright": [
    "nimble"
  ]
}
```

### `oliver update`

Updates the local repos to match `.oliver`. Any repo that exists in `.oliver` that doesn't exist locally will be cloned, and any repo that exists locally but not in `.oliver` will be removed.

```
oliver update # ==> Cloning trmml/oliver
```

### `oliver list`

List all tracked repos.

```bash
oliver list # - oliver, wobble, nimble, raven
```

### `oliver pull`

Essentially `git pull` each repo.

```bash
oliver pull
```

Licensing
---------
[MIT](LICENSE).
