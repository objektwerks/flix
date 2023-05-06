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

def toString(person: { first = First, last = Last, age = Age } ): String =
    "${person.first}, ${person.last}, ${person.age}"

enum Person {
    case Person({first = First, last = Last, age = Age})
}

instance Eq[Person] {
    pub def eq(px: Person, py: Person): Bool =
        let Person.Person(pa) = px;
        let Person.Person(pb) = py;
        pa.first == pb.first and pa.last == pb.last and pa.age == pb.age
}

instance ToString[Person] {
    pub def toString(p: Person): String =
        let Person.Person(pa) = p;
        "first: ${pa.first} last: ${pa.last} age: ${pa.age}"
}

def matchByType(target: a): String = typematch target {
    case _: Int32   => "Int32"
    case _: String  => "String"
    case _: _       => "Unknown"
}

@Test
def testTypematch(): Bool =
    eq( "Int32", matchByType(1) ) and 
    eq( "String", matchByType("1") ) and
    eq( "Unknown", matchByType('a') )

@Test
def testLazy(): Bool =
    let x: Lazy[Int32] = lazy (1 + 2);
    let y: Int32 = force x;
    eq( 3, y)

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

@Test
def testTypeAlias(): Bool =
    let person = { first = "Fred", last = "Flintstone", age = 30 };
    eq( toString(person), "Fred, Flintstone, 30" )

@Test
def testPerson(): Bool =
    let person = Person.Person( { first = "Fred", last = "Flintstone", age = 28 } );
    let Person.Person(personCopy) = person;
    debug(personCopy);
    eq( "Fred", personCopy.first ) and
    eq( "Flintstone", personCopy.last ) and
    eq( 28, personCopy.age )