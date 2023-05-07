use Assert.eq
use Recursion.{factorial, fibonacci, product, sum}

@Test
def testIfElse(): Bool =
    let number = 2;
    let result = if (Int32.mod(number, 2) == 0) true else false;
    eq( true, result )

@Test
def testRecursion(): Bool =
    let list = List#{1, 2, 3};
    eq( 6, factorial(3, 1) ) and
    eq( 8, fibonacci(6, 0, 1) ) and
    eq( 6, product(list, 1) ) and
    eq( 6, sum(list, 0) )

@Test
def testForeachYield(): Bool =
    let list = List#{1, 2, 3};
    let result: List[Int32] = foreach(number <- list) yield number + 1;
    eq( List#{2, 3, 4}, result )

@Test
def testMonadicForYield(): Bool =
    let list1 = 1 :: 2 :: Nil;
    let list2 = 1 :: 2 :: Nil;
    let result: List[(Int32, Int32)] = forM (x <- list1; y <- list2) yield (x, y);
    let expected = (1, 1) :: (1, 2) :: (2, 1) :: (2, 2) :: Nil;
    eq( expected, result )

@Test
def testMonadicForYieldWithGuard(): Bool =
    let list1 = 1 :: 2 :: Nil;
    let list2 = 1 :: 2 :: Nil;
    let result: List[(Int32, Int32)] = forM (x <- list1; y <- list2; if x < y) yield (x, y);
    let expected = (1, 2) :: Nil;
    eq( expected, result )

@Test
def testApplicativeForYield(): Bool =
    let optionX = Some(1);
    let optionY = Some(2);
    let result = forA(x <- optionX; y <- optionY) yield x + y;
    eq( Some(3), result )

@Test
def testOption(): Bool =
    // Scala: val result = List("1", "2", "3", "four").flatMap(_.toIntOption).sum
    let result = List.filterMap(s -> Int32.fromString(s), List#{"1", "2", "3", "four"}) |> List.sum;
    let anotherResult = List.sumWith(s -> Int32.fromString(s) |> Option.getWithDefault(0), List#{"1", "2", "3", "four"});
    eq( result, 6 ) and eq( anotherResult, 6 )

@Test
def testResult(): Bool \ IO =
    let file = "./LICENSE";
    let result = 
        for (
            lines <- File.readLines(file) |> Result.mapErr(_ -> "Failed to read: ${file}")
        ) yield {
            let totalLines = List.length(lines);
            let totalWords = List.sumWith(numberOfWords, lines);
            (totalLines, totalWords)
        };
    match result {
        case Ok((lines, words)) => eq( lines, 201 ) and eq( words, 1581 )
        case Err(message) => debug(message); false
    }

def numberOfWords(s: String): Int32 = s |> String.words |> List.length