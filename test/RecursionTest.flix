use Assert.eq
use Recursion.{factorial, fibonacci, product, reverse, sum}

@Test
def testFactorial(): Bool = eq( 6, factorial(3, 1) )

@Test
def testFibonacci(): Bool = eq( 8, fibonacci(6, 0, 1) )

@Test
def testProduct(): Bool = eq( 6, product(List#{1, 2, 3}, 1) )

@Test
def testSun(): Bool = eq( 6, sum(List#{1, 2, 3}, 0) )

@Test
def testReverse(): Bool = eq( List#{1, 2, 3}, reverse(List#{3, 2, 1}, Nil) )