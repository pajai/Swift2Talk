//: Playground - noun: a place where people can play

import UIKit



class Person {
    var name: String?
    var age: Int?
}


// Swift 1 without guard statement

// 2 nested if
// at the end we test if one of the two property was nil

func printOutPerson(p: Person) {
    if let name = p.name {
        if let age = p.age {
            print("My name is \(name) and I am \(age) years old")
        }
    }
        
    if p.name == nil || p.age == nil {
        // do smth in case we cannot print the name and age
    }
}


// Swift 1.2 without guard statement

// if let can be chained

func printOutPersonSec(p: Person) {
    if let name = p.name,
       let age = p.age {
            print("My name is \(name) and I am \(age) years old")
    }
    else {
        // do smth in case we cannot print the name and age
    }
}


// Swift 2 with guard statement

// early exit if I cannot grab the variable I want

// less code nesting, more readable

func printOutWithGuard(p: Person) {
    guard let name = p.name,
          let age = p.age else { /* age or name not set */ return }
    
    print("My name is \(name) and I am \(age) years old")
}