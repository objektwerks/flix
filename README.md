Flix
----
>Flix apps and feature tests.

VScode
------
>Install Flix extension: https://marketplace.visualstudio.com/items?itemName=flix.flix

Commandline
-----------
>Setup environment ( via .bashrc, .zprofile, etc ) as:
```
export FLIX_JAR="/Users/tripletail/Library/Application Support/Code - Insiders/User/globalStorage/flix.flix/flix.jar"
function flix() {
  java -jar $FLIX_JAR
}
```
>From project root enter: **flix**

Run
---
* java -jar flix.jar src/Main.flix

Resources
---------
* [Flix Language](https://flix.dev/)