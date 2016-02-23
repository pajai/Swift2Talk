//: Playground - noun: a place where people can play

import UIKit


//* ---          Error Handling          ---*/

// Error Handling with Swift 1.0 & 1.2

//func stringByReplacingFoo(str: String) -> String? {
//    var error: NSError? = nil
//    let regex = NSRegularExpression(pattern: "(foo)+", options: NSRegularExpressionOptions.CaseInsensitive, error:&error)
//    
//    if (error != nil) {
//        print("an error occured during string replacement: \(error!)")
//        return nil
//    }
//    
//    return regex!.stringByReplacingMatchesInString(str, options: NSMatchingOptions.allZeros, range: NSMakeRange(0, count(str)), withTemplate: "bar")
//}



// Swift 2

// Constructor has no inout error param
// but need a try
//let a = NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)


// with a try! a has still a non-optional type
// if an error happen, we get a crash
let a1 = try! NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)


// with a try? we get an optional result
let a2 = try? NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)



func stringByReplacingPattern(pattern: String, withStr: String) -> String? {
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        
        return regex.stringByReplacingMatchesInString(withStr, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, withStr.characters.count), withTemplate: "bar")
        
    }
    catch {
        print("an error occured during string replacement: \(error)")
        return nil
    }
}


stringByReplacingPattern("foo", withStr: "a man goes into a foo")
stringByReplacingPattern("+foo", withStr: "a man goes into a foo")



// equivalent to the previous function but more compact
func stringByReplacingFooThird(str: String) -> String? {
    let regex = try? NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)
    
    return regex?.stringByReplacingMatchesInString(str, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, str.characters.count), withTemplate: "bar")
}



// we can execute a statement at the end of the block with 'defer'
// equivalent to the previous function but more compact

func closeFile() {
    print("Close file baby!")
}

func stringByReplacingFooFourth(pattern: String, str: String) -> String? {
    defer { closeFile() }
    
    let regex = try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    
    return regex?.stringByReplacingMatchesInString(str, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, str.characters.count), withTemplate: "bar")
}

stringByReplacingFooFourth("foo", str: "a man enter into a foo")
stringByReplacingFooFourth("+foo", str: "a man enter into a foo")


// if there is more than 1 defer
// - they all get executed in the inverse order on leaving the current block


// TODO
// Perhaps have a case with a custom Error + a matching of different errors in the catch
