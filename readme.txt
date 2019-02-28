java --module-path=target/modules --module light/impl.Hello
jLink --module-path=target/modules --add-modules light --output mySimpleApp --launcher myApp=light/impl.Hello
jLink --no-header-files --no-man-pages --strip-debug --compress=1 --module-path=target/modules --add-modules light --output mySimpleLightApp --launcher myApp=light/impl.Hello

check rt.jar size vs. mySimpleApp size
java --list-modules
./java --list-modules

java --module-path=target/modules --module local/impl.ChangeWallpaper C:\Pictures\DSC_2472.jpg
jLink --module-path=target/modules --add-modules local,com.sun.jna,com.sun.jna.platform --output myApp --launcher myApp=local/impl.ChangeWallpaper


jshell