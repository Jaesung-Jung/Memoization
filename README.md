<p align="center">
<a href="https://github.com/swiftlang/swift-package-manager" alt="Swift Version" title="Swift Version"><img src="https://img.shields.io/badge/Swift-5.9+-F05138" /></a>
<a href="https://github.com/swiftlang/swift-package-manager" alt="Swift Package Manager" title="Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>
</p>

# Memoization
A lightweight and generic memoization utility for Swift. Supports multiple parameter functions using parameter packs.

# Requirements
Swift 5.9+

# Installation
### [Swift Package Manager](https://github.com/swiftlang/swift-package-manager)
Add this package to your Package.swift:
``` swift

let package = Package(
  name: "YourProject",
  dependencies: [
    .package(url: "https://github.com/Jaesung-Jung/Memoization.git", .upToNextMajor(from: "1.0"))
  ],
  targets: [
    .target(
      name: "YourProject",
      dependencies: [
        .product(name: "Memoization", package: "Memoization")
      ]
    )
  ]
)
```

# Usage
### Parameterless function
``` swift
let memoized = memoize {
    print("Computing…")
    return 42
}

print(memoized()) // First call: prints "Computing…"
print(memoized()) // Subsequent calls: returns cached value, no print
```

### Function with parameters
``` swift
let sum: (Int, Int) -> Int = memoize { a, b in
    print("Computing sum: \(a), \(b)")
    return a + b
}

print(sum(1, 2)) // First call with (1, 2): prints
print(sum(1, 2)) // Cache
print(sum(2, 3)) // First call with (2, 3): prints
```

### Fibonacci example
``` swift
func fibonacci(_ n: Int) -> Int {
  guard n > 1 else {
    return n
  }
  return fibonacci(n - 1) + fibonacci(n - 2)
}

let fibo = memoize(fibonacci)
let operatedValue = fibo(10)
let cacheValue = fibo(10)

print(operatedValue) // 55
print(cacheValue)    // 55
```

## License
MIT license. See [LICENSE](https://github.com/Jaesung-Jung/Memoization/blob/main/LICENSE) for details.
