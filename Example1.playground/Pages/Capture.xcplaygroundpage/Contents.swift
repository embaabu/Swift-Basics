//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var name: String = "swift"

let closure = { [name] in
    print(name)
    
}
closure()

print("after updating")

name = "new Obj"

closure()
//using closure that refrences a class using self we use the weak self
class Employee{
    var rollNo: Int
    var giveRollNo: (()-> Void)?
    
    init(rollNo: Int) {
        self.rollNo = rollNo
        
        giveRollNo = { [weak self] in
            print("Roll no is - \(String(describing: self?.rollNo))")
        }
    }
    deinit {
        print("roll no is \(self.rollNo) is deinitilized")
    }

    
}

var emp: Employee? = Employee(rollNo: 123)
emp?.giveRollNo?()
emp = nil

//Example of Capture

class HomeController {
    var apiManager = HomeApiManager()
    var someVariable = ""
    func someActionHappened() {
        apiManager.makeApiCall(completion: { [weak self] in
            print(self?.someVariable ?? "")
        })
    }
}

class HomeApiManager {
    var completion: (() -> Void)?
    func makeApiCall(completion: (() -> Void)?) {
        self.completion = completion
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0, execute: {
            completion?()
        })
    }
}

