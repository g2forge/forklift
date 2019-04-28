# Cache

This pallet contains a [`cache`](cache) script, which be used to memoize/cache the results of a bash command.
Simply run `cache <your command>` or `cache --help` for more information.

By default this script will use a per-user cache under the `~/.forklift` directory.
You can override this by setting a `CACHE_ROOT` environment variable.

# Keys

The script determines command equivalence by creating an SHA1 sum over the command line arguments and current working directory.
It does not take into account any environment variables, any values read from standard in, or any network status (for example).
This means that interactive programs run this way may behave unexpectedly the second time as they will not actually be run.
This also means that if your command's results depend on environment variables, you will need to take when using the cache.
