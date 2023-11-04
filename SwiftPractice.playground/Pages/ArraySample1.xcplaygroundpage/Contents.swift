//: [Previous](@previous)

import Foundation

var studentGrades = [90, 80, 70, 55, 95]

// default: 小 -> 大
studentGrades.sort()
print(studentGrades)


// 大 -> 小
studentGrades.sort(by: { d1, d2 in
    d1 >= d2
})
print(studentGrades)

//: [Next](@next)
