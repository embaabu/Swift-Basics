//: [Previous](@previous)

import Foundation


//default initializers -- Provided automatically when all properties of a class or structure have default values, and when you haven’t provided any custom initializers.
class Student1{
    var name: String = "Kato"
    var rollNum: Int = 23
    
    init(name: String, rollNum: Int) {
        self.name = name
        self.rollNum = rollNum
    }
    
}

let s1 = Student1(name: "Mike", rollNum: 1)

print(s1)

// 2. memberwise initializer -- Automatically generated by Swift for structures (not classes) when all stored properties have default values or are defined without an initial value.
struct Employee{
    var name: String
    var empId: Int
    
}
let employee1 = Employee(name: "KAKA", empId: 007)

let employee2 = Employee(name: "Mike", empId: 21)


//Convinience initalizer -- Additional, secondary initializers in classes, which must eventually call a designated initializer. They provide an easier or shorter way to initialize an instance in specific use cases.

class Book{
    var title: String
    var pageCount: Int
    var genre: String
    
    init(title: String, pageCount: Int, genre: String) {
        self.title = title
        self.pageCount = pageCount
        self.genre = genre
    }
    convenience init() {
        self.init(title: "Unknown Title", pageCount: 0, genre: "Unknown genre")
    }
}
//being able to create a book object with empty parameters
let newBook = Book()


//class student
class Student{
    var name: String
    var rollNum: Int
    
    init(name: String, rollNum: Int) {
        self.name = name
        self.rollNum = rollNum
    }
    
    convenience init(){
        self.init(name:"kato" , rollNum:23)
    }
    convenience init(name: String){
        self.init(name: name , rollNum:23)
    }
    
    
}
let student1 = Student()
print(student1.name)
let student3 = Student(name: "mike", rollNum: 123)
let student4 = Student(name: "Kyle")


//4th Failable initializer -- the initializer can fail

class Temperature{
    var celcius: Double
    
    init? (celcius: Double) {
        if celcius < -273.15 {
            return nil
        }
        self.celcius = celcius
    }
}
let temp = Temperature(celcius: -300)

print(temp)




//5 required initializer
//class teacher
class Teacher{
    var dep: String
    var noOfSubject: Int
    
    init(dep: String, noOfSubject: Int) {
        self.dep = dep
        self.noOfSubject = noOfSubject
    }
}

class SportTeacher: Teacher{
    var favGame = String
    
    init(favGame: String.Type = String) {
        self.favGame = favGame
        super.init(dep: dep, noOfSubject: noOfSubject)
    }
    
    required init(dep: String, noOfSubject: Int, favGame: String) {
        self.favGame = favGame
        super.init(dep: dep, noOfSubject: noOfSubject)
    }
    
}

let st = SportTeacher(dep: "Phisics", noOfSubject: 4)

