use Assert.eq

def isEmpty(list: a): Bool with Empty[a] = Empty.isEmpty(list)

pub class Empty[a] {
    pub def isEmpty(x: a): Bool

    law nonnegative: forall(x: a) . Empty.isEmpty(x) == true
}

instance Empty[List[a]] {
    pub def isEmpty(list: List[a]): Bool = List.length(list) == 0
}

@Test
def testTypeClass(): Bool = true