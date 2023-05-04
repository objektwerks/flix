Flix
----
>Flix feature tests.

VScode
------
>Install Flix extension: https://marketplace.visualstudio.com/items?itemName=flix.flix

>Embedded source file commands:
* **Run** usually works.
* **Run Tests** does not work.

Flix LSP
--------
>When a Flix source file is selected for the first time, the Flix LSP is run ( see output tab ):
```
Listen on 'localhost/127.0.0.1:8888'.
Client at '/127.0.0.1:57961' connected.
                                                                                
Flix 0.36.0 Ready! (Extension: 1.0.0) (Using /location/of/flix.jar)
```
>The Flix build-repl commandline tool is **also** started ( see terminal tab ).

Flix Jar
--------
>The ```flix.jar``` contains an/a:
1. LSP server
2. build commandline tool
3. repl commandline tool
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

>As note above in the Flix LSP section, Flix is **auto** started when a Flix source file is selected for first time in a new VSCode session.

>When the flix.toml is edited, a Flix restart dialog, reload: yes | no, is displayed.
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

Check
-----
>Currently this command fails.
* flix> :check
>Validates project source; but doesn't generate class files.

>**Note**, the Flix LSP parses and validates source after each modification ( see output tab ).

Build
-----
>Currently this command fails.
* flix> :build

Test
----
>Currently this command fails.
* flix> :test
>But this does work: java -jar $FLIX_JAR test

Run
---
>The Flix commandline tool needs a **run-main** command.
* java -jar $FLIX_JAR src/Main.flix

Package
-------
* flix> :build-jar

Execute
-------
* java -jar artifact/project.jar

Resources
---------
* [Flix Language](https://flix.dev/)
* [Flix Book](https://doc.flix.dev/introduction.html)
* [Flix Api](https://api.flix.dev/)