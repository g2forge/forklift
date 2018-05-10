# Install

This pallet contains the [`install`](install) and [`uninstall`](uninstall) scripts for forklift itself.

# Install

The steps involved in an installation are:

1. The [phase1 `install`](../../install) script
	1. Obtain forklift if it's not already installed
	2. Use forklift to import itself
2. The [phase2 `install`](install) script
	1. Determine if this version is an upgrade, and quit if it is not
	2. Create a `bin` directory for the `forklift` command, and a `README.md` to go with it
	3. Add the `bin` directory to the path through `~/.bash_profile`

# Uninstall

To uninstall forklift, the [`uninstall`](uninstall) script actually creates a temporary script to delete the forklift cache, and remove itself from the path.
It them forks to execute that script, so that deletion is not prevented by trying to delete the very script doing the deleting.

# Testing

While the [phase1 `install`](../../install) script supports `--development` installation, that is for testing forklift, not for testing the installer.
To test the installer you should instead run the following command to import and then install the version of forklift from the specified organization and repository.

```
forklift run com.github <ORGANIZATION>/<REPOSITORY> <TAG_OR_BRANCH> builtin/install/install
```
