//: Playground - noun: a place where people can play

import UIKit

//* ---          Error Handling          ---*/

func validatePassword(password: String, error: NSErrorPointer){
    if(password.characters.count < 5) {
        if(error != nil){
            error.memory = NSError(domain: "com.zuehlke.swifttest", code: 100, userInfo: [
                NSLocalizedDescriptionKey: "To less characters"
                ])
        }
    }
}


func savePassword(password: String) -> Bool {
    return true
}

/* Solution */
func savePasswordImplemented(password: String) -> Bool {
    
    var theError: NSError?
    validatePassword(password, error: &theError)
    
    if let error = theError {
        print(error)
        return false
    }
    
    return true
}


/* SWIFT 2.0 */
enum PasswordError : ErrorType {
    case TooLessCharacters
}

func validatePassword(password: String) throws {
    if(password.characters.count < 5) {
        throw PasswordError.TooLessCharacters
    }
}

func savePasswordWithDoCatch(password: String) -> Bool {
    
    do {
        try validatePassword(password)
    }
    catch PasswordError.TooLessCharacters {
        print("there were to less characters")
    }
    catch {
        print(error)
    }
    
    
    return true
}
savePasswordWithDoCatch("asd")


/* create savePassword-function that doesn't handle the error */
func savePasswordDontCare(password: String) -> Bool {
    let success = try? validatePassword(password)
    
    if success == nil {
        return false
    }
    
    return true
}

if savePasswordDontCare("abc") {
    print("password successfully saved")
} else {
    print("password could not be saved")
}



//* ---          guard          ---*/


func savePasswordDoesntCareWithGuard(password: String) -> Bool {
    let success = try? validatePassword(password)
    
    guard success == nil else {
        return false
    }
    
    return true
}



//* ---          defer          ---*/

class DatabaseConnection {
    func open() {
        print ("open DB connection")
    }
    
    func close () {
        print ("close DB Connection")
    }
    
    func write(data: String) {
        print ("saving data: \(data) to DB")
    }
    
    func cleanUp() {
        print ("cleanUp DB Resources")
    }
}


class PersistanceService {
    static var databaseConnection = DatabaseConnection()
    
    static func save(password: String) {
        databaseConnection.open()
        databaseConnection.write(password)
        databaseConnection.close()
        databaseConnection.cleanUp()
    }
}



class PersistanceServiceWithDefer {
    static var databaseConnection = DatabaseConnection()
    
    static func save(password: String) {
        databaseConnection.open()
        
        defer {
            databaseConnection.close()
        }
        
        defer {
            databaseConnection.cleanUp()
        }
        
        databaseConnection.write(password)
    }
}


PersistanceServiceWithDefer.save("xyz123")

