//: Playground - noun: a place where people can play

import UIKit

//struct Vector2d: CustomStringConvertible {
//    
//    var x: Int
//    var y: Int
//
//    var description: String {
//        return "Vector2d(x: \(x), y: \(y))"
//    }
//}
//
//extension Vector2d {
//    
//    
//}
//
//prefix func - (v: Vector2d) -> Vector2d {
//    return Vector2d(x: -v.x, y: -v.y)
//}
//
//postfix func ++ (v: Vector2d) -> Vector2d {
//    return Vector2d(x: v.x + 1, y: v.y + 1)
//}
//
//
//let v = Vector2d(x: 10, y: 10)
//-v
//v++
//
//
//
//let a = [1,2,3,4]
//
//switch(a) {
//case let ar where ar.count == 1:
//    print("single element")
//case let ar where ar.count > 1:
//    print("more than 1 elem")
//default:
//    print("0 elem")
//}
//
//
//// algebraic data types
//
////enum Exp {
////    case Number(Int)
////    indirect case Plus(Exp, Exp)
////    indirect case Minus(Exp, Exp)
////}
//
//
//
//
//
///* for with pattern matching */
//
//
//enum MyType {
//    case Nb(Int)
//    case Str(String)
//    case Unknown
//}
//
//let coll: [MyType] = [.Nb(1), .Nb(2), .Str("john"), .Unknown]
//for case let MyType.Str(s) in coll {
//    print(s)
//}
//
//// will print out only "john"
//
//
//let nbs = [5,42,442]
//
//for nb in nbs {
//    if case 1...10 = nb {
//        print("\(nb) in [1,10]")
//    }
//    else if case 100...1000 = nb {
//        print("\(nb) in [100,1000]")
//    }
//    else {
//        print("\(nb) not in a defined interval")
//    }
//}


///* map, filter & co */
//
////do {
//
//// Swift 2
//
//let a: [Int] = [1,2,3]
//let b = a.map{ $0 + 1 }
//
//let set = Set([1,2,3])
//let anotherSet = set.map{ $0 + 1 }
//
//let sum = (1...100)
//    .filter { $0 % 2 != 0 }
//    .map    { $0 * 2 }
//    .reduce(0) { $0 + $1 }
//
//print(sum)
//
////}
//
//
//let r: Range<Int> = 1...10
//
//
//
///* protocol */
//
//// basic idea of a protocol extension
//
//protocol FooProtocol {
//    
//    func someMethod() -> String
//
//}
//
//extension FooProtocol {
//    
//    func someMethod() -> String {
//        return "hi there"
//    }
//    
//    func anotherMethod() -> String {
//        return "hey guys"
//    }
//
//}
//
//class Foo: FooProtocol {
//    
//}
//
//let f = Foo()
//print(f.someMethod())
//print(f.anotherMethod())
//
//
//
//extension CollectionType where Generator.Element == Int {
//    
//    func sum() -> Generator.Element {
//        return self.reduce(0) { (a,b) in a + b }
//    }
//    
//}
//
//let ints = [1,2,3,4]
//ints.sum()
//
//let strings = ["hello", "world"]
////strings.sum()



//let t: Printable

extension CollectionType where Generator.Element: Comparable {
 
    func firstIsHigherThan(other: Self) -> Bool {
        let thisFirst  = self.first
        let otherFirst = other.first
        return thisFirst > otherFirst
    }
    
}

[1,2,3].firstIsHigherThan([3,2,1])
[3,2,1].firstIsHigherThan([1,2,3])

(1...3).firstIsHigherThan(3...6)
(3...6).firstIsHigherThan(1...3)

//[1,2,3].firstIsHigherThan(3...6)




/* for ... in with filtering */

let nbs = [5,42,442,4442]

for nb in nbs where nb >= 10 && nb <= 1000 {
    print(nb)
}

for case (10...1000) in nbs {
    print("hello")
}



/* pyramid of doom */

// Swift 2: let chaining inside an if
let a: Int? = 5, b: Int? = 6, name: String? = "john"
if  let a = a,
    let b = b,
    let name = name
    where a < b && name.hasPrefix("jo") {
        print("do something with \(a), \(b) and \(name)")
}




/* early access with guard */

class Person {
    var name: String?
    var age: Int?
}


// without guard statement

func printOutPerson(p: Person) {
    if let name = p.name,
       let age = p.age {
        print("My name is \(name) and I am \(age) years old")
    }
    else {
        // do smth in case we cannot print the name and age
    }
}


// with guard statement

func printOutWithGuard(p: Person) {
    guard let name = p.name,
          let age = p.age else { /* age & name not set */ return }
    
    print("My name is \(name) and I am \(age) years old")
}


let p = Person()
p.name = "john"
p.age = 8
printOutPerson(p)
printOutWithGuard(p)


/* error handling with try / catch */

//let string: String = "hallo"
//string.characters.count

func stringByReplacingFoo(str: String) -> String? {
    do {
        let regex = try NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)
        
        return regex.stringByReplacingMatchesInString(str, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, str.characters.count), withTemplate: "bar")

    }
    catch {
        print("an error occured during string replacement: \(error)")
        return nil
    }
}

enum RegexGeneration: Int, ErrorType {
    case regularExpressionHosed = 2048
}

func stringByReplacingFoo2(str: String) -> String? {
    do {
        let regex = try NSRegularExpression(pattern: "(foo)+",
                          options: .CaseInsensitive)
        
        let range = NSMakeRange(0, str.characters.count)
        return regex.stringByReplacingMatchesInString(str,
                       options: .ReportCompletion,
                       range: range,
                       withTemplate: "bar")
        
    }
    catch {
        print("an error occured: \(error)")
        return nil
    }
}


func stringByReplacingFooBis(str: String) -> String? {
    let regex = try! NSRegularExpression(
                       pattern: "(foo)+",
                       options: .CaseInsensitive)
    
    let range = NSMakeRange(0, str.characters.count)
    return regex.stringByReplacingMatchesInString(str,
                   options: .ReportCompletion,
                   range: range,
                   withTemplate: "bar")
}


let str = stringByReplacingFooBis("foo hello foofoo world")
//str
