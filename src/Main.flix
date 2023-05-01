def main(): Unit \ IO =
    let args = Environment.getArgs();
    let env = "Environment:";
    println("${env} ${args}");
    
    let greeting = "Greeting:";
    match args {
        case Nil => println("${greeting} Hello, Flix!")
        case head :: _ => println("${greeting} Hello, ${head}!")
    }