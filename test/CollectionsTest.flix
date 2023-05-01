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

@Test
def testMap(): Bool =
    use Map.{sumKeys, sumValues};
    let map = Map#{1 => 1, 2 => 2, 3 => 3};
    let keysSum = sumKeys(map);
    let valuesSum = sumValues(map);
    eq( keysSum, valuesSum )