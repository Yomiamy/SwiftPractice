//: [Previous](@previous)

import Foundation

class Square {
    var width: Double = 0
    var area: Double {
        get {
            width * width
        }
        
        set {
           width = sqrt(newValue)
        }
    }
    
    var doubleWidth: Double {
        // only get
        2 * width
    }
}


let bigSqre = Square()
bigSqre.width = 10
sqrt(10)
print(bigSqre.width)

bigSqre.doubleWidth

