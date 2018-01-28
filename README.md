# Forklift

A general purpose pallet (package) manager suitable for multi-language development.

# Usage

1. Install forklift: `curl XXX > sudo bash`
2. Run a command from a pallet `forklift run <palletspec> <command-with-arguments>`

# Pallet Specifications

Each pallet is identified by a combination of a warehouse identifier, pallet identifier and version.
The warehouse identifier must be a reversed DNS name (e.g. `com.g2forge`) matching the server hosting the warehouse.
The format of the pallet identifier and version depend on the warehouse, but POSIX paths and [semantic versions](https://semver.org/) are common.

# Glossary

* "forklift" A program for moving pallets of files around a network.
* "pallet": A group of files "exported" from a "warehouse".
* "export": A declaration that a specific "warehouse" is able to provide a "pallet" of files to a "customer".
* "import": A request by a "customer" to "import" a "pallet" of files.
* "customer": An "importer" of "pallets"
* "warehouse": An "exporter" of "pallets"
* "jack": A small program, a plugint to forklift, which is used to move "pallets" from a "warehouse" to a "customer"
