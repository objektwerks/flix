use Assert.eq
use List.sum

@Test
def list(): Bool = {
    let xs = 1 :: 2 :: 3 :: Nil;

    eq( sum(xs), 6 )
}