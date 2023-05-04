use Assert.eq
use Recursion.factorial

@Test
def testPar(): Bool =
    let (first, second) = par (factorial(3, 1), factorial(6, 1));
    eq( first, 6 ) and eq( second, 720)

@Test
def testParYield(): Bool =
    let result =
        par (
            x <- factorial(3, 1);
            y <- factorial(6, 1))
        yield x + y;
    eq( result, 726)