@Test
def testValidation(): Bool \ IO =
    use Assert.eq;
    use Connection.{connect, handleConnection, handleInvalidInput};

    let fred = connect("Fred", "12345678");
    debug( fred );
    match Validation.toResult(fred) {
        case Ok(connection) => handleConnection("Valid fred:", connection)
        case Err(invalidInput) => handleInvalidInput("Invalid fred:", invalidInput)
    };

    let barney = connect("Barney", "1234567");
    debug( barney );
    match Validation.toResult(barney) {
        case Ok(connection) => handleConnection("Valid barney:", connection)
        case Err(invalidInput) => handleInvalidInput("Invalid barney:", invalidInput)
    };

    eq( true, Result.isErr(Validation.toResult(fred)) ) and
    eq( true, Result.isOk(Validation.toResult(barney)) )