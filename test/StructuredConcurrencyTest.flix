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
    let (license, flix) = region rc {
        let (licenseSender, licenseReceiver) = Channel.buffered(rc, 1);
        let (flixSender, flixReceiver) = Channel.buffered(rc, 1);
        spawn Channel.send( fileLineCount("./LICENSE"), licenseSender ) @ rc;
        spawn Channel.send( fileLineCount("./flix.toml"), flixSender ) @ rc;
        (Channel.recv(licenseReceiver), Channel.recv(flixReceiver))
    };
    eq( license, 201 ) and eq( flix, 7 )