//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let systemImage = UIImage(systemName: "circle.fill")
let systemImageView = UIImageView(image: systemImage)
systemImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
systemImageView.contentMode = .scaleAspectFill
PlaygroundPage.current.liveView = systemImageView

//: [Next](@next)
