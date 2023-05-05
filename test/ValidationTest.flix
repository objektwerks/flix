use Assert.eq
use Validation.{Failure, Success}

enum Connection(String, String) with Eq, ToString

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

@Test
def testValidation(): Bool =
    let fred = connect("Fred", "12345678");
    let barney = connect("Barney", "1234567");

    debug( fred );
    debug( Validation.toResult(fred) );
    // Unable to unify the types 'Connection' and 'Nec[InvalidInput]'.
    /*
    match Validation.toResult(fred) {
        case Ok(connection) => debug(connection)
        case Err(error) => debug(error)
    }; */

    debug( barney );
    debug( Validation.toResult(barney) );
    // Unable to unify the types 'Connection' and 'Nec[InvalidInput]'.
    /*
    match Validation.toResult(barney) {
        case Ok(connection) => debug(connection)
        case Err(error) => debug(error)
    }; */

    // What's the best way to work with a Validation[E, T]?
    true