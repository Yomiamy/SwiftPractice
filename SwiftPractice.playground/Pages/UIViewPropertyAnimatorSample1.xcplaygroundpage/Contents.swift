//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit


let dogView = UIImageView(image: UIImage(named: "dog1.jpg"))
dogView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
dogView.contentMode = .scaleAspectFit
dogView.backgroundColor = UIColor.clear

UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0) {
    dogView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    
}

PlaygroundPage.current.liveView = dogView

//: [Next](@next)
