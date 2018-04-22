# GitHub

This jack is responsible for loading pallets from both [GitHub](http://github.com) and GitHub Enterprise installations.
Note that it can dynamically detect github enterprise servers by their support of the GitHub API, allowing it to recognize them as appropriate warehouses without configuration.

# Scripts

In order to allow pallets from github to install scripts, and cleanup after themselves this jack will automatically run the following scripts, when they are found in the `.forklift` directory inside a pallet:

* `post-import` will be run from the root of the pallet, after the import is complete
* `pre-update` will be run from the root of the pallet, before any update
* `post-update` will be run from the root of the pallet, after an update is successful
* `pre-delete` will be run from the root of the pallet, before deleting the pallet
* `post-delete` will be run in a random directory, from a temporary script without access to the contents of the pallet (obviously), after the pallet has been deleted
