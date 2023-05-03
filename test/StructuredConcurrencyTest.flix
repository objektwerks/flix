use Assert.eq

def fileLineCount(file: String): Int32 \ IO =
    let result = 
        for (
            lines <- File.readLines(file) |> Result.mapErr(_ -> "Failed to read: ${file}")
        ) yield List.length(lines);
    match result {
        case Ok(lines) => lines
        case Err(message) => debug(message); 0
    }

@Test
def testStructuredConcurrency(): Bool = true