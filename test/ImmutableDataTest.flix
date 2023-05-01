use Assert.eq

@Test
def testList(): Bool =
    use List.sum;
    let list = List#{1, 2, 3};
    eq( list |> sum, 6 )

@Test
def testSet(): Bool =
    use Set.sum;
    let set = Set#{1, 2, 3};
    eq( set |> sum, 6 )

@Test
def testMap(): Bool =
    use Map.{get, insert, sumKeys, sumValues};
    let map = Map#{1 => 1, 2 => 2, 3 => 3};
    let keysSum = sumKeys(map);
    let valuesSum = sumValues(map);
    let modifiedMap = insert(4, 4, map);
    eq( keysSum, valuesSum ) and
    eq( get(1, map), Some(1) ) and
    eq( get(4, modifiedMap), Some(4) )

@Test
def testVector(): Bool =
    use Vector.sum;
    let vector = Vector#{1, 2, 3};
    eq( vector |> sum, 6 )

@Test
def testChain(): Bool =
    use Chain.sum;
    let chain = Chain.cons(1, Chain.empty());
    eq( chain |> sum, 1 )

@Test
def testRecord(): Bool =
    let record = { x = 1, y = 2, z = 3 };
    eq( record.x + record.y + record.z, 6 )