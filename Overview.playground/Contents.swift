//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class FibCalc {
    
    var cache: [Int:Int] = [:]
    
    func fibonacci(n: Int) -> Int {
        if cache[n] != nil {
            return cache[n]!
        }
        
        if n == 0 || n == 1 {
            cache[n] = n
            return n
        }
        else {
            let v = fibonacci(n - 1) + fibonacci(n - 2)
            cache[n] = v
            return v
        }
    }
    
}


let fib = FibCalc()

let seq = (0...20).map{ i in fib.fibonacci(i) }

print(seq)
