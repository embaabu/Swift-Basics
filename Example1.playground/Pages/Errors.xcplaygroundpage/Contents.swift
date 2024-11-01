//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
print(greeting)




//function to chech the password if its strong or not
enum PasswordError: Error{
    case short
    case obvious
}

func checkPassword(_ password: String) throws -> String{
    
    
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "1234" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "Pasword is ok"
    }else if password.count < 10{
        return "password is good"
    }else{
        return "Excellent"
    }
    
}

let password = "1234567"

do{
    let result = try checkPassword(password)
    print("Password rating: \(result)")
    
}catch PasswordError.short{
    print("The password is too short please use a longer password")
    
}catch PasswordError.obvious{
    print("the passwordd to too obvious")
}catch{
    print("There was an error!!")
}
