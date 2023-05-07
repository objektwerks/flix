use Assert.eq

type alias XyzRecord = {x = Int32, y = Int32, z = Int32}

mod XyzRecord {
    pub def sum(xyz: XyzRecord ): Int32 = xyz.x + xyz.y + xyz.z
}

@Test
def testList(): Bool =
    use List.sum;
    let list = List#{1, 2, 3};
    eq( 6, list |> sum )

@Test
def testSet(): Bool =
    use Set.sum;
    let set = Set#{1, 2, 3};
    eq( 6, set |> sum )

@Test
def testMap(): Bool =
    use Map.{get, insert, sumKeys, sumValues};
    let map = Map#{1 => 1, 2 => 2, 3 => 3};
    let keysSum = sumKeys(map);
    let valuesSum = sumValues(map);
    let modifiedMap = insert(4, 4, map);
    eq( valuesSum, keysSum ) and
    eq( Some(1), get(1, map) ) and
    eq( Some(4), get(4, modifiedMap) )

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
    let record = { x = 1: Int32, y = 2: Int32, z = 3: Int32 };
    let xyzRecord: XyzRecord  = { x = 1, y = 2, z = 3 };
    eq( record.x + record.y + record.z, 6 ) and eq( XyzRecord.sum(xyzRecord), 6 )