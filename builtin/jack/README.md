# Jack

This pallet contains the jacks which come built into forklift.
Each subdirectory contains a `jack` script, which accepts roughly the same subcommands as `forklift` itself.
A jack is selected by the [`pallet2jack`](../common/pallet2jack) script.

# Scripts

Some of the jacks support scripts to be run at various stages of pallet management.
Consult the per-jack documentation for more information.

When a script is run, the following environment variables will be set:

* `WAREHOUSE`: The warehouse of the current pallet
* `PALLET`: The current pallet
* `VERSION`: The version of the current pallet
* `FORKLIFT`: A path to the executable `forklift` script (not the directory containing it)
* `FLBIN_DIR`: A `bin` directory into which scripts might add anything that should appear on the path