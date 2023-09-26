//: [Previous](@previous)

import Foundation

class Hero {
    var name = "Tom" {
        willSet(newName) {
            print("Name will from \(name) to \(newName)")
        }
        didSet(oldName) {
            print("Name has been from \(oldName) to \(name)")
        }
    }
   
}


let bestHero = Hero()
bestHero.name = "Mary"
