Flix
----
>Flix feature tests.

Review
------
>Flix in an FP language that runs on the JVM. See [Flix Language](https://flix.dev/) for details.

>Flix could improve in the following areas:
1. **Build Tool** - finish implementing commands; and add **:run** command.
2. **Java Interop** - finish implementing imports and simplify.
3. **Record** - enhance with Eq, ToString and pattern matching, akin to a Scala case class, Kotlin data class or Java record.
4. **Worksheets** - consider building worksheets for fast prototyping.
5. **Semicolons** - consider removing semicolons, favoring a true expression-oriented language.

VScode
------
>Install Flix extension: https://marketplace.visualstudio.com/items?itemName=flix.flix

1. Command Pallete > flix
2. Embedded source file commands:
    * **Run** usually works.
    * **Run Tests** does not work.

Flix
----
>When a Flix source file is selected for the first time, the Flix LSP server is started ( see output tab ):
```
Listen on 'localhost/127.0.0.1:8888'.
Client at '/127.0.0.1:57961' connected.
                                                                                
Flix 0.36.0 Ready! (Extension: 1.0.0) (Using /location/of/flix.jar)
```
>The Flix build-repl commandline tool is **also** started ( see terminal tab ).

```
Found `flix.toml'. Checking dependencies...
Resolving Flix dependencies...
Downloading Flix dependencies...
Resolving Maven dependencies...
  Running Maven dependency resolver.
Dependency resolution completed.
     __   _   _
    / _| | | (_)            Welcome to Flix 0.36.0
   | |_  | |  _  __  __
   |  _| | | | | \ \/ /     Enter an expression to have it evaluated.
   | |   | | | |  >  <      Type ':help' for more information.
   |_|   |_| |_| /_/\_\     Type ':quit' or press 'ctrl + d' to exit.
```
> flix> :help
```
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
>Currently most commands fail with this message: ***Package commands are currently not available from the shell***

>**Note:** When the flix.toml is edited, a Flix restart dialog, reload: yes | no, is displayed.

Flix Jar
--------
>The ```flix.jar``` contains an/a:
1. LSP server
2. build-repl commandline tool
>The repl can execute expressions such as: ```List.filterMap(s -> Int32.fromString(s), List#{"1", "2", "3", "four"}) |> List.sum```.
>But ```let x = 1``` expressions fail.

>For **manual** Flix startup, edit an environment file ( such as .bashrc, .zprofile, etc ) as follows:
```
export FLIX_JAR="/location/of/flix.jar"
function flix() {
  java -jar $FLIX_JAR
}
```
>Then, from the project root directory, enter: **flix** and return. Note the output and terminal tabs.

Check
-----
>Validates project sources; but doesn't generate class files.
* flix> :check

>**Note**, the Flix LSP parses and validates source after each modification ( see output tab ).

Test
----
>Currently this command completes but doesn't run any tests.
* flix> :test
>But this works: java -jar $FLIX_JAR test

Build
-----
* flix> :build

Run
---
>Flix needs a **:run** command.
* java -jar $FLIX_JAR src/Main.flix

Pkg
---
* flix> :pkg
> See: artifact/flix.fpkg

Jar
---
* flix> :jar
> See: artifact/flix.jar

Execute
-------
* java -jar artifact/flix.jar

Resources
---------
* [Flix Language](https://flix.dev/)
* [Flix Book](https://doc.flix.dev/introduction.html)
* [Flix Api](https://api.flix.dev/)