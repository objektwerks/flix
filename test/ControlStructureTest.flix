use Assert.eq

def sum(ys: List[Int32], acc: Int32): Int32 = match ys {
    case Nil => acc
    case head :: tail => sum(tail, acc + head)
}

@Test
def testIfElse(): Bool =
    let number = 2;
    let result = if (Int32.mod(number, 2) == 0) true else false;
    eq( result, true )

@Test
def testRecursion(): Bool =
    let list = List#{1, 2, 3};
    eq( sum(list, 0), 6 )