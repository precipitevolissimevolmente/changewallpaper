java --module-path=target/modules --module light/impl.Hello
jLink --module-path=target/modules --add-modules light --output mySimpleApp --launcher myApp=light/impl.Hello



java --module-path=target/modules --module local/impl.ChangeWallpaper
jLink --module-path modules --add-modules local --add-modules com.sun.jna --add-modules com.sun.jna.platform --output myApp --launcher myApp=local/impl.ChangeWallpaper

jdeps --module-path modules --add-modules com.sun.jna --add-modules com.sun.jna.platform --list-deps local-1.0-SNAPSHOT.jar