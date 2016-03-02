//: Playground - noun: a place where people can play

import Cocoa







enum MyType {
    case Nb(Int)
    case Str(String)
    case Unknown
}

let a = MyType.Nb(5)

if case .Nb(let v) = a {
    print(v)
}


let coll: [MyType] = [.Nb(1), .Nb(2), .Str("john"), .Unknown]


for case let .Str(s) in coll {
    print(s)
}

for member in coll {
    print(member)
}

let nbs = [5, 42, 442]

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


