use Assert.eq

def factorial(n: Int32, acc: Int32): Int32 = match n {
    case i if i < 1 => acc
    case _ => factorial(n - 1, acc * n)
}

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