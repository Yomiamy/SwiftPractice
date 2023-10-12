//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let winnie = UIImage(named: "winnie_2")
let winnieImageView = UIImageView(image: winnie)
winnieImageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200))
winnieImageView.backgroundColor = UIColor(red: 10/255, green: 186/255, blue: 181/255, alpha: 1)
winnieImageView.contentMode = .scaleAspectFill


PlaygroundPage.current.liveView = winnieImageView

//: [Next](@next)
