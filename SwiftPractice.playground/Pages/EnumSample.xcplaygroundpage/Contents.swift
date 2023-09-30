//: [Previous](@previous)

import Foundation

// ====== Type Enum ======
enum Pet:String {
    //    case dog = "小狗", cat = "小貓" , rabbit = "小兔"
    case dog = "小狗"
    case cat = "小貓"
    case rabbit = "小兔"
}

var myPet: Pet = .rabbit

switch myPet {
case .dog:
    print("pet is dog, rawValue = \(myPet.rawValue)")
case .cat:
    print("pet is cat, rawValue = \(myPet.rawValue)")
case .rabbit:
    print("pet is rabbit, rawValue = \(myPet.rawValue)")
}

// ====== Enum Associated Value ======

enum Status {
    case onTime
    case delayed(minute: Int, second: Int)
//    case delayed(Int, Int)
}

let todayStatus = Status.delayed(minute: 10, second: 20)
// let todayStatus = Status.delayed(10, 20)

switch todayStatus {
case .onTime:
    print("加薪一百萬")
case .delayed(let minute, let second):
    if minute > 20, second > 20 {
        print("東西收一收, 明天不用來了")
    } else {
        print("扣薪一百萬")
    }
}
