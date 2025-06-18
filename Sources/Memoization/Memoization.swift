//
//  Copyright © 2025 Jaesung Jung. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

/// Memoizes a function that takes no arguments and returns a value, caching the result after the first call.
///
/// - Parameter f: A function that takes no arguments and returns a value of type `U`.
/// - Returns: A memoized version of the function `f`, which returns the same cache result after the first call.
///
/// ```
/// let expensiveComputation: () -> Int = {
///     print("Computing...")
///     return 42
/// }
/// let memoizedComputation = memoize(expensiveComputation)
///
/// let result1 = memoizedComputation()  // Prints "Computing..." and returns 42
/// let result2 = memoizedComputation()  // Returns cache value 42 without printing
/// ```
@inlinable public func memoize<U>(_ f: @escaping () -> U) -> () -> U {
  var memo: U?
  return {
    if let r = memo {
      return r
    }
    let r = f()
    memo = r
    return r
  }
}

/// Memoizes a function that takes no arguments and returns a value, caching the result after the first call.
///
/// - Parameter f: A function that takes no arguments and returns a value of type `U`.
/// - Returns: A memoized version of the function `f`, which returns the same cache result after the first call.
///
/// ```
/// func fibonacci(_ n: Int) -> Int {
///   guard n > 1 else {
///     return n
///   }
///   return fibonacci(n - 1) + fibonacci(n - 2)
/// }
///
/// let fibo = memoize(fibonacci)
/// let operatedValue = fibo(10)
/// let cacheValue = fibo(10)
///
/// print(operatedValue) // 55
/// print(cacheValue)   // 55
/// ```
@inlinable public func memoize<each T: Hashable, U>(_ f: @escaping (repeat each T) -> U) -> (repeat each T) -> U {
  var memo: [Int: U] = [:]
  return { (pack: repeat each T) -> U in
    var hasher = Hasher()
    for p in repeat each pack {
      hasher.combine(p)
    }

    let hash = hasher.finalize()
    if let result = memo[hash] {
      return result
    }
    let result = f(repeat each pack)
    memo[hash] = result
    return result
  }
}
