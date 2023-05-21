use Assert.eq
use Recursion.factorial

@Test
def testParYield(): Bool =
    let result =
        par (
            x <- factorial(3, 1);
            y <- factorial(6, 1))
        yield x + y;
    eq( 726, result )