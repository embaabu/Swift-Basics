import UIKit
//usin optional in swift

//creating the class person
class Person{
    var name: String
    var age: Int
    var car: String?
    //initializer
    init(name: String, age: Int, car: String?=nil) {
        self.name = name
        self.age = age
        self.car = car
    }
    //function to increment the age
    func increment (){
        self.age += 1
    }
    
}
//creating the object of the class
let p1 = Person(name: "Edwin", age: 12, car: "BMW")
//p1.car = "BMW"
//calling the function to increment the age
p1.increment()
print(p1.age)
// we can use optional binding to condtitionally bind the wrapped value
if let unwrappedString = p1.car {
    print(unwrappedString)

}else{
    print("Optional is nil")
}




