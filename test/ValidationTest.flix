use Assert.eq

enum Connection(String, String)

enum InvalidInput {
    case InvalidUserName,
    case InvalidPassword
}

def validateUser(user: String): Validation[InvalidInput, String] =
    if (8 <= String.length(user) and String.forAll(Char.isLetter, user)) Validation.Success(user)
    else Validation.Failure(Nec.singleton(InvalidInput.InvalidUserName))

def validatePassword(password: String): Validation[InvalidInput, String] =
    if (12 <= String.length(password) and String.length(password) <= 20) Validation.Success(password)
    else Validation.Failure(Nec.singleton(InvalidInput.InvalidPassword))

def connect(user: String, password: String): Validation[InvalidInput, Connection] = 
    forA (
        validatedUser     <- validateUser(user);
        validatedPassword <- validatePassword(password)
    ) yield Connection.Connection(validatedUser, validatedPassword)

@Test
def testValidation(): Bool = true