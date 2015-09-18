//: Playground - noun: a place where people can play

import UIKit


// example of a value type: an Int

func doSomething(var n: Int) {
    n++
}

let n = 1
doSomething(n)
n



// example of a reference type

class Foo: CustomStringConvertible {
    
    var nb: Int
    
    init(nb: Int) {
        self.nb = nb
    }

    var description: String {
        return "Foo{\(nb)}"
    }
}

func doSmthWithFoo(f: Foo) {
    f.nb += 1
}

let f = Foo(nb: 10)
doSmthWithFoo(f)
f


// can we have a value type with a complex type?


// Yes we can



struct Person: CustomStringConvertible {
    var age: Int
    let name: String
    
    var description: String {
        return "Person{\(name), \(age)}"
    }
}


var p1 = Person(age: 20, name: "john")
var p2 = Person(age: 21, name: "alan")
var p3 = Person(age: 22, name: "helen")


func ageMustDouble(var p: Person) {
    p.age = p.age * 2
    p
}

ageMustDouble(p1)
p1

