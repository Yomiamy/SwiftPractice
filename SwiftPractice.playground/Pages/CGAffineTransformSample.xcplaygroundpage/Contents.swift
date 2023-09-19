//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100)))
label.text = "TEST"
label.font = UIFont.systemFont(ofSize: 20.0)
label.transform = CGAffineTransform(rotationAngle: .pi)

PlaygroundPage.current.liveView = label

//: [Next](@next)
