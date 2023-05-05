use Assert.eq
use InvalidInput.{InvalidUser, InvalidPassword}
use Connection.{Connection}
use Validation.{Failure, Success}

enum Connection(String, String)

enum InvalidInput {
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
    ) yield Connection(validatedUser, validatedPassword)

@Test
def testValidation(): Bool =
    let failure = Failure(Nec#{InvalidUser, InvalidPassword});
    let success = Success( Connection("luckyluke", "password12356789") );

    eq( failure, connect("Lucky Luke", "Ratata") ) and
    eq( success, connect("luckyluke", "password12356789") )