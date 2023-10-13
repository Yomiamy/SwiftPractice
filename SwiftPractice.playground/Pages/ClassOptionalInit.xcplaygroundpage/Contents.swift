//: [Previous](@previous)

import Foundation

class Baby {
    var age: Int
    var name: String
    
    init?(age: Int, name: String) {
        if age < 0 {
            return nil
        }
        
        self.age = age
        self.name = name
    }
}


let cuteBaby = Baby(age: -1, name: "hook")
//: [Next](@next)
