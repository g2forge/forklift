# Forklift

A general purpose pallet (package) manager suitable for multi-language development.

Forklift, like npm or maven, can import and cache [pallets](#glossary) from various warehouses.
In addition to the [forklift standard](#standard), the basic implementation is in bash, making it suitable for use with any development tooling or languages.
One common use case is to abstract out common code from BASH scripts.

# Usage

* **Install forklift**: `curl -L https://raw.githubusercontent.com/g2forge/forklift/master/install | bash`
* Run a command from a pallet: `forklift run <warehouse> <pallet> <version> <command-with-arguments>`
* Upgrade forklift: `forklift upgrade`, will check for a new version of forklift itself and upgrade if appropriate
* Uninstall forklift: `forklift uninstall` (will also clear out all cached and temporary data)

For more commands, please see the command line help by running `forklift --help`.

## Example 1

To run [BATS](https://github.com/sstephenson/bats) on `tests.bats` one might run:

```
forklift run com.github sstephenson/bats v0.4.0 bin/bats tests.bats
```

This will import the [`sstephenson/bats`](https://github.com/sstephenson/bats) pallet from github if it has not already been imported.
Then it will run the `bin/bats` script in that pallet with the aruments `tests.bats`. 
Note that version `v0.4.0` is the latest [release](https://github.com/sstephenson/bats/releases) at the time of this writing.

## Example 2

To get the OS distribution forklift is running on:

```
forklift run builtin common current osinfo --distro
```

This example shows the use of the `builtin` warehouse which references pallets in in the [builtin](builtin) directory.
Note that the only version supported by the `builtin` warehouse is `current` denoting whatever version the currently running forklift install is.
If you want to run a script from another version of forklift you can do so through the `com.github` warehouse, of course.

# Pallet Specifications

Each pallet is identified by a combination of a warehouse, pallet and version specifiers.
The warehouse specifier must be a reversed DNS name (e.g. `com.g2forge`) matching the server hosting the warehouse.
The format of the pallet and version specifiers depend on the jack, but POSIX paths and [semantic versions](https://semver.org/) are common.

Currently supported warehouses:

* [`com.github`](builtin/jack/github/README.md): the pallet specifier must be of the form `<organization-or-user>/<repository>` and the version specifier must be `<branch-or-tag-or-commit>`
* GitHub enterprise: the warehouse specifier must name a running [GitHub Enterprise server](https://enterprise.github.com) (as determined by querying the API) and the pallet and version identifiers the same as for `com.github`.
* [`builtin`](builtin/jack/builtin/README.md): a special case of a warehouse specifier not being a reversed DNS name. The builtin warehouse is used to run scripts from within forklift itself, critically helpful for bootstraping forklift

# Glossary

* "forklift" A program for moving pallets of files around a network.
* "pallet": A group of files "exported" from a "warehouse".
* "export": A declaration that a specific "warehouse" is able to provide a "pallet" of files to a "customer".
* "import": A request by a "customer" to "import" a "pallet" of files.
* "customer": An "importer" of "pallets"
* "warehouse": An "exporter" of "pallets"
* "jack": A small program, a plugin to forklift, which is used to move "pallets" from a "warehouse" to a "customer"

# Legal

Copyright Greg Gibeling 2018, licensed under the [Apache 2.0](LICENSE) license.

# Standard

Coming soon...

# Contributing

Issues and pull requests are welcome on [github.com/g2forge/forklift](https://github.com/g2forge/forklift).

## Release

1. Tag the release: `git tag -m <TAG> <TAG>` where `<TAG>` is of the form "v0.0.1"
2. [Create a release](https://github.com/g2forge/forklift/releases/new) on github using the new tag
3. Update the [`pom.xml`](pom.xml) version.
4. [Create the new milestone](https://github.com/g2forge/forklift/milestones/new)
