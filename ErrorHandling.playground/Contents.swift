//: Playground - noun: a place where people can play

import UIKit


//* ---          Error Handling          ---*/

// Error Handling with Swift 1.0 & 1.2

//var error: NSError? = nil
//let regex = NSRegularExpression(pattern: "(foo)+", options: NSRegularExpressionOptions.CaseInsensitive, error:&error)
//
//if (error != nil) {
//    print("an error occured during string replacement: \(error!)")
//}



// Swift 2

// Constructor has no inout error param
// but need a try

let a = try NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)


// with a try! a has still a non-optional type
// if an error happen, we get a crash

let a1 = try! NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)


// with a try? we get an optional result

let a2 = try? NSRegularExpression(pattern: "(foo)+", options: .CaseInsensitive)


// proper catch if we want to intercept or rethrow the error

func regexForString(pattern: String) -> NSRegularExpression? {
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        
        return regex
    }
    catch {
        print("an error occured: \(error)")
        return nil
    }
}


// equivalent to the previous function but more compact
func regexForStringSecond(pattern: String) -> NSRegularExpression? {
    
    return try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    
}


// we can execute a statement at the end of the block with 'defer'
// equivalent to the previous function but more compact

func openFile(n: Int) {
    print("Open file man! \(n)")
}

func closeFile(n: Int) {
    print("Close file baby! \(n)")
}

func doYourJob() {
    var n = 0
    
    openFile(n++)
    defer { closeFile(n++) }
    
    print("I am a happy file \(n++)")
}

doYourJob()


// if there is more than 1 defer
// - they all get executed in the inverse order on leaving the current block


// custom error + defer useful even if we throw an error
enum MyError: ErrorType {
    case WaterLow(String)
}

func doYourJobThrow() throws {
    var n = 10
    
    openFile(n++)
    defer { closeFile(n++) }
    
    print("I am a happy file \(n++)")
    throw MyError.WaterLow("something happened!")
    
    print("Never reached")
}

try doYourJobThrow()
