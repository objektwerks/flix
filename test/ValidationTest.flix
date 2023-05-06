use Assert.eq
use Validation.{Failure, Success}

enum Connection with Eq, ToString {
    case Connection({user = String, pin = String})
}

enum InvalidInput with Eq, ToString {
    case InvalidUser,
    case InvalidPin
}

def validateUser(user: String): Validation[InvalidInput, String] =
    if ( String.length(user) > 4 and String.forAll(Char.isLetter, user) ) Success(user)
    else Failure(Nec.singleton(InvalidInput.InvalidUser))

def validatePin(pin: String): Validation[InvalidInput, String] =
    if ( String.length(pin) == 7 ) Success(pin)
    else Failure(Nec.singleton(InvalidInput.InvalidPin))

def connect(user: String, pin: String): Validation[InvalidInput, Connection] = 
    forA (
        validatedUser <- validateUser(user);
        validatedPin  <- validatePin(pin)
    ) yield Connection.Connection(validatedUser, validatedPin)

def handleConnection(message: String, connection: Connection): Unit \ IO = println("${message} ${connection}")

def handleInvalidInput(message: String, invalidInput: Nec[InvalidInput]): Unit \ IO = println("${message} ${invalidInput}")

@Test
def testValidation(): Bool \ IO =
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