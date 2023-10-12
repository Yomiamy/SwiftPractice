//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

let textField1 = UITextField(frame: CGRect(x: 20, y: 10, width: 200, height: 50))
textField1.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1.0)

textField1.becomeFirstResponder()


let content = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
content.window?.makeKey()

content.addSubview(textField1)
PlaygroundPage.current.liveView = content
//: [Next](@next)
