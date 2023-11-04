import Foundation
import PlaygroundSupport
import UIKit


let dogView = UIImageView(image: UIImage(named: "dog2.jpg"))
dogView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
dogView.contentMode = .scaleAspectFit
dogView.backgroundColor = UIColor.clear

UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0) {
    dogView.transform = CGAffineTransform(translationX: 0.0, y: 30.0)
} completion: { _ in
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0) {
        dogView.transform = dogView.transform.scaledBy(x: 1.5, y: 1.5)
    }
}

PlaygroundPage.current.liveView = dogView
