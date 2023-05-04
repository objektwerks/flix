use Assert.eq

def isEmpty(x: a): Bool with Empty[a] = Empty.isEmpty(x)

pub class Empty[a] {
    pub def isEmpty(x: a): Bool
}

instance Empty[List[a]] {
    pub def isEmpty(list: List[a]): Bool = List.length(list) == 0
}

@Test
def testTypeClass(): Bool = eq( isEmpty(Nil), true )