mod Connection {
    use Validation.{Failure, Success}

    pub enum Connection(String, String) with Eq, Order, ToString

    pub enum InvalidInput with Eq, Order, ToString {
        case InvalidUser,
        case InvalidPin
    }

    pub def validateUser(user: String): Validation[InvalidInput, String] =
        if ( String.length(user) > 4 and String.forAll(Char.isLetter, user) ) Success(user)
        else Failure(Nec.singleton(InvalidInput.InvalidUser))

    pub def validatePin(pin: String): Validation[InvalidInput, String] =
        if ( String.length(pin) == 7 ) Success(pin)
        else Failure(Nec.singleton(InvalidInput.InvalidPin))

    pub def connect(user: String, pin: String): Validation[InvalidInput, Connection] = 
        forA (
            validatedUser <- validateUser(user);
            validatedPin  <- validatePin(pin)
        ) yield Connection.Connection(validatedUser, validatedPin)

    pub def handleConnection(message: String, connection: Connection): Unit \ IO = println("${message} ${connection}")

    pub def handleInvalidInput(message: String, invalidInput: Nec[InvalidInput]): Unit \ IO = println("${message} ${invalidInput}")
}