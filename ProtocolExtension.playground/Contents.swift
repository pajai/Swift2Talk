//: Playground - noun: a place where people can play

import UIKit


// Swift 101 re protocol & class

// - protocol: like an interface in Java

// - class:  a reference type, which can extend a protocol
// - struct: a value type, which can also extend a protocol


// basic idea of a protocol extension

protocol FooProtocol {
    func someMethod() -> String
}


class Foo: FooProtocol {
    
}


extension FooProtocol {
    
    func someMethod() -> String {
        return "hi there"
    }
    
    func anotherMethod() -> String {
        return "hey guys"
    }
    
}


let f = Foo()
print(f.someMethod())
print(f.anotherMethod())


// first protocol defined: we define a method someMethod() without implementation

// a class Foo extends the protocol

// we then extend the protocol with an implementation for someMethod()
// and a new method anotherMethod()

// we can call everything as expected



// but we can do a lot more than that with protocol extension

// e.g. extend existing types and add conditions when the extension should apply

extension CollectionType where Generator.Element == Int {
    
    func sum() -> Generator.Element {
        return self.reduce(0) { (a,b) in a + b }
    }
    
}

let ints = [1,2,3,4]

// sum is a valid method on ints, since we have an array of Int
ints.sum()

let strings = ["hello", "world"]

// not allowed, sum() is only defined for collections of Int
//strings.sum()


extension CollectionType where Generator.Element: Comparable {
    
    func firstHigher(other: Self) -> Bool {
        let thisFirst  = self.first
        let otherFirst = other.first
        return thisFirst > otherFirst
    }
    
}

let intArray = [1,2,3]
let range = 1...3

[1,2,3].firstHigher([3,2,1])
[3,2,1].firstHigher([1,2,3])

(1...3).firstHigher(3...6)
(3...6).firstHigher(1...3)

// won’t compile
//[1,2,3].firstHigher(3...6)

// won't work either
// since array of int cannot be converted to array of double
//let doubleArray = [1.0, 2.0, 3.0]
//doubleArray.firstHigher(intArray)


// Rem: the keyword extension is used for a class or struct category or protocol extension
//      in our case here for a protocol extension


// Example of an category over an existing class
extension Int {
    
    var km: Int {
        return self * 1000
    }
    
    var m: Int {
        return self
    }
    
}

let distance = 5.km + 300.m
