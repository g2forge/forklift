# Install

This directory contains the [`post-import`](post-import) and [`post-delete`](post-delete) scripts for forklift itself.

# Post Import

The steps involved in an installation are:

1. The [phase1 `install`](../install) script
	1. Obtain forklift if it's not already installed
	2. Use forklift to import itself
2. The [phase2 `post-import`](post-import) script
	1. Determine if this version is an upgrade, and quit if it is not
	2. Create a `bin` directory for the `forklift` command, and a `README.md` to go with it
	3. Add the `bin` directory to the path through `~/.bash_profile`

# Post Delete

To uninstall forklift, the [`post-delete`](post-delete) deletes the entire `.forklift` directory and removes forklift from the path.

# Testing

While the [phase1 `install`](../install) script supports `--development` installation, that is for testing forklift, not for testing the installer.
To test the installer you should instead run the following command to import and then install the version of forklift from the specified organization and repository.

```
forklift import com.github <ORGANIZATION>/<REPOSITORY> <TAG_OR_BRANCH>
```
