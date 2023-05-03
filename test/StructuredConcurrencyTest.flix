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
    region rc {
        // let (sender, receiver) = Channel.unbuffered(rc);
        spawn fileLineCount("./LICENSE") @ rc;
        spawn fileLineCount("./README.md") @ rc
    };
    // eq( license, 201 ) and eq( readme, 109)
    true