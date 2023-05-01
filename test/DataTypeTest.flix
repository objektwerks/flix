use Assert.eq

enum Color {
    case Red(Int32)
    case White(Int32)
    case Blue(Int32)
}

def valueOf(color: Color): Int32 = match color {
    case Color.Red(i) => i * 2
    case Color.White(i) => i * 2
    case Color.Blue(i) => i * 2
}

type alias First = String
type alias Last = String
type alias Age = Int32

@Test
def testTuple(): Bool =
    let tuple = (1, 2, 3);
    let (one, two, three) = tuple;
    eq( one + two + three, 6 )

@Test
def testEnum(): Bool =
    let red = Color.Red(1);
    let white = Color.White(2);
    let blue = Color.Blue(3);
    eq( valueOf(red), 2 ) and
    eq( valueOf(white), 4 ) and
    eq( valueOf(blue), 6 )