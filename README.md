# This project is used for demo and experiments with JAVA 11

## Run and package "Hello world example"
```
java --module-path=target/modules --module light/impl.Hello
jLink --module-path=target/modules --add-modules light --output mySimpleApp --launcher myApp=light/impl.Hello
jLink --no-header-files --no-man-pages --strip-debug --compress=1 --module-path=target/modules --add-modules light --output mySimpleLightApp --launcher myApp=light/impl.Hello
```

check rt.jar size vs. mySimpleApp size and see difference for nr. of modules used
```
java --list-modules
./java --list-modules
```

## Run and package "Change wallpaper" module
```
java --module-path=target/modules --module local/impl.ChangeWallpaper C:\Pictures\DSC_2472.jpg
jLink --module-path=target/modules --add-modules local,com.sun.jna,com.sun.jna.platform --output myApp --launcher myApp=local/impl.ChangeWallpaper
```

> For **jLink** to work with com.sun.jna library we need to transform with **jdeps --generate-module-info**,
> please check \changewallpaper\bash\run.sh

## Experiment with the Java Shell tool (JShell)
https://docs.oracle.com/javase/9/jshell/introduction-jshell.htm#JSHEL-GUID-630F27C8-1195-4989-9F6B-2C51D46F52C8

jshell