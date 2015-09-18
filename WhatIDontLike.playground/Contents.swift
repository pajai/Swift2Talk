//: Playground - noun: a place where people can play

import UIKit

let str = "hello world"

str[str.startIndex...advance(str.startIndex, 4)]
str[advance(str.startIndex, 6)..<str.endIndex]

extension String {
    
    subscript(range: Range<Int>) -> String {
        let startIndex = range.startIndex
        let endIndex = range.endIndex - 1
        let start = startIndex < 0 ? advance(self.endIndex, startIndex) : advance(self.startIndex, startIndex)
        let end   = endIndex < 0   ? advance(self.endIndex, endIndex)   : advance(self.startIndex, endIndex)
        let newRange = (start)...(end)
        return self.substringWithRange(newRange)
    }
    
}

//let r = (-4)...(-1)
//r.startIndex
//r.endIndex


let str2 = "foobar"
//str2.substringWithRange(advance(str2.startIndex,1)...advance(str2.startIndex, 4))

"hello world"[0...4]
"hello world"[6...10]
"hello world"[(-5)...(-1)]
//"hello world"[((-1)...1)]

"abc"
((-1)...1)


((-1)...(0))
let range = ((-1)...(0)).reverse()
let startIndex = range.startIndex
let endIndex = range.endIndex - 1
//let start = startIndex < 0 ? advance(str.endIndex, startIndex) : advance(str.startIndex, startIndex)
//let end   = endIndex < 0   ? advance(str.endIndex, endIndex)   : advance(str.startIndex, endIndex)
//let newRange = (start)...(end)
//str.substringWithRange(newRange)

