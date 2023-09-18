import Foundation

let now = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年MM月dd日"
let dateString = dateFormatter.string(from: now)
