# Forklift

A general purpose pallet (package) manager suitable for multi-language development.

Forklift, like npm or maven, can import and cache [pallets](doc#glossary) from various warehouses.
In addition to the [forklift standard](doc#standard), the basic implementation is in bash, making it suitable for use with any development tooling or languages.
Common use cases include abstracting common code from BASH scripts, and creating user-installable JARs.

For more information about forklift, please [read the docs](doc).

# Usage

* **Install forklift**
  * POSIX operating systems: `bash <(curl -L https://raw.githubusercontent.com/g2forge/forklift/master/install)`
  * Windows operating systems: `$env:INSTALL_URL="https://raw.githubusercontent.com/g2forge/forklift/master/install"; (New-Object System.Net.WebClient).DownloadFile("$env:INSTALL_URL.ps1", "$pwd\install.ps1"); powershell -ExecutionPolicy Bypass .\install.ps1`
* Run a command from a pallet: `forklift run <warehouse> <pallet> <version> <command-with-arguments>`
* Upgrade forklift: `forklift upgrade`, will check for a new version of forklift itself and upgrade if appropriate
* Uninstall forklift: `forklift uninstall` (will also clear out all cached and temporary data)

For more commands, please see the command line help by running `forklift --help`.

## Example 1

To run [BATS](https://github.com/sstephenson/bats) on `tests.bats` one might run:

```
forklift run com.github bats-core/bats-core v1.1.0 bin/bats tests.bats
```

This will import the [`bats-core/bats-core`](https://github.com/bats-core/bats-core) pallet from github if it has not already been imported.
Then it will run the `bin/bats` script in that pallet with the aruments `tests.bats`. 
Note that version `v1.1.0` is the latest [release](https://github.com/bats-core/bats-core/releases) at the time of this writing.

## Example 2

To get the OS distribution forklift is running on:

```
forklift run builtin common current osinfo --distro
```

This example shows the use of the `builtin` warehouse which references pallets in in the [builtin](builtin) directory.
Note that the only version supported by the `builtin` warehouse is `current` denoting whatever version the currently running forklift install is.
If you want to run a script from another version of forklift you can do so through the `com.github` warehouse, of course.

## Example 3

To run [bulldozer catalog](https://github.com/g2forge/bulldozer/blob/master/bd-build/src/main/java/com/g2forge/bulldozer/build/Catalog.java) on your project:

```
 forklift run org.maven com.g2forge.bulldozer:bd-build 0.0.2 catalog <PATH TO PROJECT>
```

This examples shows the use of the `maven` warehouse which allows one to reference JARs (and any other maven artifacts) as pallets.
For more information about running commands from maven pallets (artifacts), please read the [maven jack documentation](builtin/jack/maven/README.md).

## Example 4

To install one or more OS packages:

```
forklift run builtin common current install <PACKAGES>
```

This examples shows off one of the internal functions of forklift: the ability to install operating system level packages across operating systems.
This is particularly useful on Cygwin where this is no native command-line package installer.

You may be interested in the [fl-clicommon](https://github.com/g2forge/fl-clicommon) pallet which takes advantage of this to install commonly needed command line tools.

## Example 5

Forklift can be used to create self-installing pallets (GitHub repositories or Maven JARs for example).
The below code (pick one depending on OS) will install forklift and then use it to run any forklift command.

```
bash <(curl -L https://raw.githubusercontent.com/g2forge/forklift/master/install) <ANY FORKLIFT COMMAND>
$env:INSTALL_URL="https://raw.githubusercontent.com/g2forge/forklift/master/install"; (New-Object System.Net.WebClient).DownloadFile("$env:INSTALL_URL.ps1", "$pwd\install.ps1"); powershell -ExecutionPolicy Bypass .\install.ps1 <ANY FORKLIFT COMMAND>
```

You can replace `<ANY FORKLIFT COMMAND>` with `import <warehouse> <pallet> <version>`, and add a `post-import` script to your pallet.
As an example, please see [fl-clicommon](https://github.com/g2forge/fl-clicommon) and [winpty](https://github.com/g2forge/winpty).
You may also want to read the documentation on how to add forklift scripts to your pallet for [GitHub](builtin/jack/github#scripts) or [Maven](builtin/jack/maven#scripts).

## Example 6

To run a command, or return the same results from a cache:

```
forklift run builtin cache current cache <ANY COMMAND>
```

This will use the [`cache`](builtin/cache) script built into forklift to either run your command, or return the same stdout, stderr and exit code.
Please see the documentation for more about how cache entries are keyed.

# Legal

Copyright Greg Gibeling 2018-2019, licensed under the [Apache 2.0](LICENSE) license.

# Contributing

Issues and pull requests are welcome on [github.com/g2forge/forklift](https://github.com/g2forge/forklift).
You may wish to read the [developers guide](doc/Developers.md) before you start trying to modify things.
