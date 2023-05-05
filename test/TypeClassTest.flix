use Assert.eq

pub class NonEmpty[a] {
    pub def nonEmpty(x: a): Bool
}

instance NonEmpty[String] {
    pub def nonEmpty(string: String): Bool = not String.isEmpty(string)
}

instance NonEmpty[List[a]] {
    pub def nonEmpty(list: List[a]): Bool = not List.isEmpty(list)
}

def nonEmpty(x: a): Bool with NonEmpty[a] = NonEmpty.nonEmpty(x)

@Test
def testTypeClass(): Bool =
    let string = "123";
    let emptyString = "";

    let list = 1 :: 2 :: 3 :: Nil;
    let emptyList: List[Int32] = Nil;

    eq( nonEmpty(string), true ) and
    eq( nonEmpty(emptyString), false ) and
    eq( nonEmpty(list), true ) and
    eq( nonEmpty(emptyList), false )