use Assert.eq
use Color.{Color, valueOf}
use Person.{Person, toString}

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
    eq( 6, one + two + three )

@Test
def testEnum(): Bool =
    let red = Color.Red(1);
    let white = Color.White(2);
    let blue = Color.Blue(3);
    eq( 2, valueOf(red) ) and
    eq( 4, valueOf(white) ) and
    eq( 6, valueOf(blue) )

@Test
def testTypeAlias(): Bool =
    let person = { first = "Fred", last = "Flintstone", age = 30 };
    eq( "first: Fred, last: Flintstone, age: 30", toString(person) )

@Test
def testPerson(): Bool =
    let person = Person.Person( { first = "Fred", last = "Flintstone", age = 28 } );
    let Person.Person(personCopy) = person;
    debug(personCopy);
    eq( "Fred", personCopy.first ) and
    eq( "Flintstone", personCopy.last ) and
    eq( 28, personCopy.age )