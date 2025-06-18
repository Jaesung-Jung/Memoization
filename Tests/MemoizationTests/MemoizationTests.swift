import Testing
@testable import Memoization

@Test func memoize_no_parameter() {
  var callCount = 0
  let testFunc = memoize {
    callCount += 1
    return 42
  }
  #expect(testFunc() == 42)
  #expect(testFunc() == 42)
  #expect(callCount == 1)
}

func memoize_pair_parameters() {
  var callCount = 0
  let sum: (Int, Int) -> Int = memoize { a, b in
    callCount += 1
    return a + b
  }
  #expect(sum(1, 2) == 3)
  #expect(sum(1, 2) == 3)
  #expect(sum(2, 3) == 5)
  #expect(callCount == 2)
}

func memoize_triple_parameters() {
  var callCount = 0
  let sum: (Int, Int, Int) -> Int = memoize { (a, b, c) in
    callCount += 1
    return a + b + c
  }
  #expect(sum(1, 2, 3) == 6)
  #expect(sum(4, 5, 6) == 15)
  #expect(sum(1, 2, 3) == 6)
  #expect(sum(4, 5, 6) == 15)
  #expect(callCount == 2)
}
