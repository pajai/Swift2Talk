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
let b = a.map{ $0 + 1 }

// here we call the globally defined map function
map([1,2,3]) { $0 + 1 }

let set = Set([1,2,3])

// does not work, there is no map method on Set
//set.map{ $0 + 1 }

// the global map function works on a Set
map(set) { $0 + 1 }

// syntax is not consistent accross collections
// some had 'map', 'filter', etc. methods,
// some others had globally defined functions



// Swift 2

// thanks to protocol extensions, everything becomes
// easier

// map & filter are functions defined on the collection protocol
// apply automatically to all sub classes

let a2: [Int] = [1,2,3]
let b2 = a2.map{ $0 + 1 }

let set2 = Set([1,2,3])
let anotherSet = set2.map{ $0 + 1 }

let sum = (1...100)
    .filter { $0 % 2 != 0 }
    .map    { $0 * 2 }
    .reduce(0) { $0 + $1 }

print(sum)
// prints out 5000

