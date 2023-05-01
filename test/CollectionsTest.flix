use Assert.eq
use List.sum

@Test
def list(): Bool = eq( (1 :: 2 :: 3 :: Nil) |> sum, 6 )