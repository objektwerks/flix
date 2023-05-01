def main(): Unit \ IO =
    let env = "Environment:";
    let args = Environment.getArgs();
    println("${env} ${args}");

    let greeting = "Greeting:";
    match args {
        case Nil => "${greeting} Hello, Flix!"
        case head :: _ => "${greeting} Hello, ${head}!"
    } |> println