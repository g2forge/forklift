# Maven

This jack is responsible for loading pallets from [Maven Central](http://maven.org).
Please note that while Java must be installed, this jack will also install maven for itself if it is not already runnable from the command line.

# Run

When running a maven pallet, the optional arguments will be appended to a command line similar to the following:

```
java -cp <ALL THE JAR DEPENDENCIES> [<YOUR ARGUMENTS>]
```

Please note that if you are using windows and cygwin, any paths you specify to Java programs should likely be windows paths.
You may need to use `cygpath -w` to translate such arguments from cygwin to windows format.
