//: Playground - noun: a place where people can play

import UIKit


// Algebraic data types


enum Exp {
    case          Number(Int)
    indirect case Op((Int,Int) -> Int, Exp, Exp)
    
    func eval() -> Int {
        switch(self) {
        case .Number(let n):
            return n
        case .Op(let op, let left, let right):
            return op(left.eval(), right.eval())
        }
    }
}

let n20 = Exp.Number(20)
let n10 = Exp.Number(10)
let n1  = Exp.Number(1)

let op1 = Exp.Op((+), n10, n20)
let op2 = Exp.Op((-), op1, n1)

op2
op2.eval()


