Flix
----
>Flix apps and feature tests.

VScode
------
>Install Flix extension: https://marketplace.visualstudio.com/items?itemName=flix.flix

>Embedded source file commands:
* **Run** usually works.
* **Run Tests** does not work.

Commandline
-----------
>Setup environment ( via .bashrc, .zprofile, etc ) as:
```
export FLIX_JAR="/location/of/flix.jar"
function flix() {
  java -jar $FLIX_JAR
}
```
>From project root enter command: **flix**
```
Found `flix.toml'. Checking dependencies...
Resolving Flix dependencies...
Downloading Flix dependencies...
Resolving Maven dependencies...
  Running Maven dependency resolver.
Dependency resolution completed.
     __   _   _
    / _| | | (_)            Welcome to Flix 0.35.0
   | |_  | |  _  __  __
   |  _| | | | | \ \/ /     Enter an expression to have it evaluated.
   | |   | | | |  >  <      Type ':help' for more information.
   |_|   |_| |_| /_/\_\     Type ':quit' or press 'ctrl + d' to exit.
      
flix> :h                                                                        
  Command       Arguments     Purpose

  :reload :r                  Recompiles every source file.
  :doc :d       <fqn>         Displays documentation for <fqn>.
  :init                       Creates a new project in the current directory.
  :check :c                   Checks the current project for errors.
  :build :b                   Builds (i.e. compiles) the current project.
  :build-jar :jar             Builds a jar-file from the current project.
  :build-pkg :pkg             Builds a fpkg-file from the current project.
  :benchmark :bench           Runs the benchmarks for the current project.
  :test :t                    Runs the tests for the current project.
  :quit :q                    Terminates the Flix shell.
  :help :h :?                 Shows this helpful information.

flix>
```
>Most commands currently fail with this message: ***Package commands are currently not available from the shell***

Build
-----
>Currently this command fails.
* flix> :build

Run
---
>The Flix build tool / repl needs a **run-main** command.
* java -jar $FLIX_JAR src/Main.flix

Resources
---------
* [Flix Language](https://flix.dev/)
* [Flix Book](https://doc.flix.dev/introduction.html)
* [Flix Api](https://api.flix.dev/)