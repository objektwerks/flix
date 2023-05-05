use Assert.eq

pub class Empty[a] {
    pub def isEmpty(x: a): Bool
}

instance Empty[String] {
    pub def isEmpty(string: String): Bool = String.length(string) == 0
}

instance Empty[List[a]] {
    pub def isEmpty(list: List[a]): Bool = List.length(list) == 0
}

def isEmpty(x: a): Bool with Empty[a] = Empty.isEmpty(x)

@Test
def testTypeClass(): Bool =
    let string = "123";
    let emptyString = "";

    let list = 1 :: 2 :: 3 :: Nil;
    let emptyList: List[Int32] = Nil;

    eq( isEmpty(string), false ) and
    eq( isEmpty(emptyString), true ) and
    eq( isEmpty(list), false ) and
    eq( isEmpty(emptyList), true )