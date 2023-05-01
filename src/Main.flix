def main(): Unit \ IO =
    let args = Environment.getArgs();
    let env = "Environment:";
    let greeting = "Greeting:";
    println("${env} ${args}");
    match args {
        case Nil => println("${greeting} Hello, Flix!")
        case head :: _ => println("${greeting} Hello, ${head}!")
    }