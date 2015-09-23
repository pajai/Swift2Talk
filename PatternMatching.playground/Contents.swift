//: Playground - noun: a place where people can play

import UIKit



/* for with pattern matching */


enum MyType {
    case Nb(Int)
    case Str(String)
    case Unknown
}

let a = MyType.Nb(5)


// extract value
// - pattern matching switch
// - pattern matching if case


if case MyType.Nb(let v) = a {
    print(v)
}

if case let MyType.Nb(v) = a {
    print(v)
}


let b = MyType.Str("hello")


let coll: [MyType] = [.Nb(1), .Nb(2), .Str("john"), .Unknown]


for case let MyType.Str(s) in coll {
    print(s)
}


// will print out only "john"


/* if with pattern matching */


let nbs = [5,42,442]

for nb in nbs {
    if case 1...10 = nb {
        print("\(nb) in [1,10]")
    }
    else if case 100...1000 = nb {
        print("\(nb) in [100,1000]")
    }
    else {
        print("\(nb) not in a defined interval")
    }
}
