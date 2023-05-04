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
def testStructuredConcurrency(): Bool \ IO =
    let lineCount = region rc {
        let (sender, receiver) = Channel.unbuffered(rc);
        spawn Channel.send( fileLineCount("./LICENSE"), sender ) @ rc;
        Channel.recv(receiver)
    };
    eq( lineCount, 201 )