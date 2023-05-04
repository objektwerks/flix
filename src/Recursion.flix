mod Recursion {
    pub def factorial(n: Int32, acc: Int32): Int32 = match n {
        case i if i < 1 => acc
        case _ => factorial(n - 1, acc * n)
    }

    pub def sum(ys: List[Int32], acc: Int32): Int32 = match ys {
        case Nil => acc
        case head :: tail => sum(tail, acc + head)
    }
}