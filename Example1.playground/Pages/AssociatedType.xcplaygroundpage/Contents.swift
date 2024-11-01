//: [Previous](@previous)

import Foundation

// associated types is used for protoals to define place holder name for the type that is used as part of protocal

/*
 Associated types are a powerful feature in Swift that let you define placeholders within a protocol. They are especially useful when creating protocols that work with generic types, where the specific type used can be decided later when the protocol is adopted by a class, struct, or enum.
 */

protocol Shape{
    associatedtype Area
    mutating func calculateArea() -> Area
}

struct Square: Shape{
    var side: Int
    typealias Area = Int
    
    mutating func calculateArea() -> Area{
        return side * side
    }
}

var sq = Square(side: 32)

print(sq.calculateArea())


struct Circle: Shape{
    var radius: Double
    typealias Area = Double
    
    mutating func calculateArea() -> Area{
        return Double.pi * radius * radius
    }
}
var c1 = Circle(radius: 12)

print(c1.calculateArea())


//Example 2
protocol Container{
    associatedtype itemType
    var items: [itemType] { get set }
    mutating func addItem(_ item: itemType)
    
//    mutating func removeItem(_ item: itemType) -> Bool
}

extension Container{
    mutating func addItem(_ item: itemType){
        items.append(item)
    }

}

struct NameDatabase: Container {
    typealias itemType = String
    var items = [itemType]()
}
