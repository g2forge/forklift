# Developers Guide

# Test

We have implemented unit tests using [BATS](https://github.com/bats-core/bats-core).
To run them all you may simply run [test](../test).

# Install Debugging

One of the more complex pieces of forklift to test is the [install script](../install).

## Custom Installer

If you want to test a custom or modified installer itself, this section is for you.
You have two basic options:

* Simply run the install from your local repo: `bash <(cat install)`
* Modify the `curl` command to reference the appropriate organization, repository and commit/tag/branch, as shown below:

[Usage](../#usage) shows how to use the install script for install forklift, and [example 5](../#example-5) shows how to use the it to import a pallet using forklift.
Both of these examples have the following form:

```
bash <(curl -L https://raw.githubusercontent.com/<INSTALLER_ORG>/<INSTALLER_REPO>/<INSTALLER_COMMIT>/install) <OPTIONAL FORKLIFT COMMAND>
```

Note that due to the second layer of downloads we currently do not have a way to test a custom powershell and posix install script at the same time without a little hacking.

## Custom Release

If you want to try intalling a custom release, this is the section for you.
This can be particularly helpful if you're modifying the [post-import](../.forklift/post-import) script for forklift itself.

The [install](../install) script normally downloads and installs the most recent release of forklift.
This can be changed by setting the environment variable `RELEASE_URL` when running the installer.
For example, the following command (pick on depending on OS) will install the `HEAD` of the `master` branch of forklift:

```
RELEASE_URL="https://github.com/g2forge/forklift/archive/master.zip" bash <(curl -L https://raw.githubusercontent.com/g2forge/forklift/master/install)
$env:RELEASE_URL="https://github.com/g2forge/forklift/archive/master.zip"; (New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/g2forge/forklift/master/install.ps1", "$pwd\install.ps1"); powershell -ExecutionPolicy Bypass .\install.ps1
```

To obtain a usable `RELEASE_URL` you can simply use the GitHub UI, as shown below.
Please note that the installer expects to receive a GitHub download URL for either a zipfile or tarball.
In the future we may modify it to support arbitrary URLs, but for now it needs metadata which is github specific.

![Finding a release URL](images/InstallReleaseURL.png)

# Release

1. Tag the release: `git tag -m <TAG> <TAG>` where `<TAG>` is of the form "v0.0.1"
2. [Create a release](https://github.com/g2forge/forklift/releases/new) on github using the new tag
3. Update the [`pom.xml`](pom.xml) version.
4. [Create the new milestone](https://github.com/g2forge/forklift/milestones/new)
