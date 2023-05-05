use Assert.eq
use Validation.{Failure, Success}

enum Connection(String, String) with Eq, ToString

enum InvalidInput with Eq, ToString {
    case InvalidUser,
    case InvalidPassword
}

def validateUser(user: String): Validation[InvalidInput, String] =
    if (8 <= String.length(user) and String.forAll(Char.isLetter, user)) Success(user)
    else Failure(Nec.singleton(InvalidInput.InvalidUser))

def validatePassword(password: String): Validation[InvalidInput, String] =
    if (12 <= String.length(password) and String.length(password) <= 20) Success(password)
    else Failure(Nec.singleton(InvalidInput.InvalidPassword))

def connect(user: String, password: String): Validation[InvalidInput, Connection] = 
    forA (
        validatedUser     <- validateUser(user);
        validatedPassword <- validatePassword(password)
    ) yield Connection.Connection(validatedUser, validatedPassword)

@Test
def testValidation(): Bool =
    let failure = connect("Lucky Luke", "Ratata");
    let success = connect("luckyluke", "password12356789");

    debug( failure );
    debug( success );

    true