use Assert.eq

@Test
def testList(): Bool =
    use List.sum;
    let list = (1 :: 2 :: 3 :: Nil);
    eq( list |> sum, 6 )

@Test
def testSet(): Bool =
    use Set.sum;
    let set = Set#{1, 2, 3};
    eq( set |> sum, 6 )