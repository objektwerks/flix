mod Recursion {
    pub def factorial(n: Int32, acc: Int32): Int32 = match n {
        case i if i < 1 => acc
        case _ => factorial(n - 1, acc * n)
    }

    pub def fibonacci(n: Int32, a: Int32, b: Int32): Int32 = match n {
      case 0 => a
      case _ => fibonacci(n - 1, b, a + b)
    }

    pub def sum(ys: List[Int32], acc: Int32): Int32 = match ys {
        case Nil => acc
        case head :: tail => sum(tail, acc + head)
    }
}