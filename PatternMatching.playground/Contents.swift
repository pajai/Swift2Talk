//: Playground - noun: a place where people can play

import UIKit


// Extension of pattern matching in Swift 2


enum MyType {
    case Nb(Int)
    case Str(String)
    case Unknown
}

let a: MyType = .Nb(5)



// extension for 'if' statement

if case .Nb(let v) = a {
    print(v)
}

if case let .Nb(v) = a {
    print(v)
}


// extension for 'for' statement

let coll: [MyType] = [.Nb(1), .Nb(2), .Str("john"), .Unknown]


for myType in coll {
    print(myType)
}


for case let .Str(s) in coll {
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
