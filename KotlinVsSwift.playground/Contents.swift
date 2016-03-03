//: Playground - noun: a place where people can play

import UIKit


// const & var declaration
var str = "Hello"
str += " You!"
str

let anotherStr = "Not mutable"
anotherStr.hasPrefix("Not")


// function and optional
func getMaybe(n: Int = 4) -> String? {
    if n % 2 == 0 {
        return "is even"
    }
    else {
        return nil
    }
}


let a = getMaybe(5)
let b = getMaybe(6)

// optional parameters
let c = getMaybe()


// extending an existing type
extension Int {
    func times(f: () -> ()) {
        for _ in 0..<self {
            f()
        }
    }
}


5.times{ print("hallo") }


// easy syntax for properties
class Foo {
    var size: Int = 0
}

let f = Foo()
f.size = 5
print(f.size)


// Differences:
// No ‘data’ classes
// Kotlin JVM, Swift compiled to machine code (iOS, OS X, linux as of 2.2)
