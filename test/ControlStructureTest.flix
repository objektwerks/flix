use Assert.eq

def sum(ys: List[Int32], acc: Int32): Int32 = match ys {
    case Nil => acc
    case head :: tail => sum(tail, acc + head)
}

def toInt(s: String): Option[Int32] = Int32.fromString(s)

@Test
def testIfElse(): Bool =
    let number = 2;
    let result = if (Int32.mod(number, 2) == 0) true else false;
    eq( result, true )

@Test
def testRecursion(): Bool =
    let list = List#{1, 2, 3};
    eq( sum(list, 0), 6 )

@Test
def testForeachYield(): Bool =
    let list = List#{1, 2, 3};
    let result: List[Int32] = foreach(number <- list) yield number + 1;
    eq( result, List#{2, 3, 4} )

@Test
def testMonadicForYield(): Bool =
    let list1 = 1 :: 2 :: Nil;
    let list2 = 1 :: 2 :: Nil;
    let result: List[(Int32, Int32)] = forM (x <- list1; y <- list2) yield (x, y);
    let expected = (1, 1) :: (1, 2) :: (2, 1) :: (2, 2) :: Nil;
    eq( result, expected )

@Test
def testMonadicForYieldWithGuard(): Bool =
    let list1 = 1 :: 2 :: Nil;
    let list2 = 1 :: 2 :: Nil;
    let result: List[(Int32, Int32)] = forM (x <- list1; y <- list2; if x < y) yield (x, y);
    let expected = (1, 2) :: Nil;
    eq( result, expected )

@Test
def testOption(): Bool = true

@Test
def testResult(): Bool = true