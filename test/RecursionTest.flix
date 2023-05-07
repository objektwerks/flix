use Assert.eq
use Recursion.{factorial, fibonacci, product, sum}

@Test
def testRecursion(): Bool =
    let list = List#{1, 2, 3};
    eq( 6, factorial(3, 1) ) and
    eq( 8, fibonacci(6, 0, 1) ) and
    eq( 6, product(list, 1) ) and
    eq( 6, sum(list, 0) )

@Test
def testFactorial(): Bool = eq( 6, factorial(3, 1) )

@Test
def testFibonacci(): Bool = eq( 8, fibonacci(6, 0, 1) )

@Test
def testProduct(): Bool = eq( 6, product(List#{1, 2, 3}, 1) )