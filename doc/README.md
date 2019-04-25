# Forklift

# Standard

Coming soon...

# Glossary

* "forklift" A program for moving pallets of files around a network.
* "pallet": A group of files "exported" from a "warehouse".
* "export": A declaration that a specific "warehouse" is able to provide a "pallet" of files to a "customer".
* "import": A request by a "customer" to "import" a "pallet" of files.
* "customer": An "importer" of "pallets"
* "warehouse": An "exporter" of "pallets"
* "jack": A small program, a plugin to forklift, which is used to move "pallets" from a "warehouse" to a "customer"

# Pallet Specifications

Each pallet is identified by a combination of a warehouse, pallet and version specifiers.
The warehouse specifier must be a reversed DNS name (e.g. `com.g2forge`) matching the server hosting the warehouse.
The format of the pallet and version specifiers depend on the jack, but POSIX paths and [semantic versions](https://semver.org/) are common.

Currently supported warehouses:

* [`com.github`](builtin/jack/github/README.md): the pallet specifier must be of the form `<organization-or-user>/<repository>` and the version specifier must be `<branch-or-tag-or-commit>`
* GitHub enterprise: the warehouse specifier must name a running [GitHub Enterprise server](https://enterprise.github.com) (as determined by querying the API) and the pallet and version identifiers the same as for `com.github`.
* [`org.maven`](builtin/jack/maven/README.md): the pallet specifier must be of the form `<group>:<artifact>`.
* [`builtin`](builtin/jack/builtin/README.md): a special case of a warehouse specifier not being a reversed DNS name. The builtin warehouse is used to run scripts from within forklift itself, critically helpful for bootstraping forklift

# Developers

Please see the [Developers Guide](Developers.md).
