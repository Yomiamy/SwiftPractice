//: [Previous](@previous)

import Foundation

var repeatCount = 0

// 啟動循環Timer每秒一次
Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    repeatCount += 1
    print("repeatCount = \(repeatCount)")
    
    if(repeatCount >= 10) {
        // 停止Timer
        timer.invalidate()
    }
}

//: [Next](@next)
