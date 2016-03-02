//: Playground - noun: a place where people can play

import UIKit


// Better syntax for map, filter & co


func map<T>(array: Array<T>, f: (T -> T)) -> Array<T> {
    return array.map(f)
}
func map<T>(set: Set<T>, f: (T -> T)) -> Set<T> {
    return Set(set.map(f))
}




// Swift 1.2

let a: [Int] = [1,2,3]

// here we use map as method of Array
let b = a.map{ i in i + 1 }

// here we call the globally defined map function
map([1,2,3]) { i in i + 1 }

let set = Set([1,2,3])

// does not work, there is no map method on Set
//set.map{ i in i + 1 }

// the global map function works on a Set
map(set) { i in i + 1 }

// syntax is not consistent accross collections
// some had 'map', 'filter', etc. methods,
// some others had globally defined functions



// Swift 2

// thanks to protocol extensions, everything becomes
// easier

// map & filter are functions defined on the collection protocol
// apply automatically to all sub classes

let a2: [Int] = [1,2,3]
let b2 = a2.map { i in i + 1 }

let set2 = Set([1,2,3])
let anotherSet = set2.map { i in i + 1 }

let sum = (1...100)
    .filter { i in i % 2 != 0 }
    .map    { i in i * 2 }
    .reduce(0) { $0 + $1 }

print(sum)
// prints out 5000

