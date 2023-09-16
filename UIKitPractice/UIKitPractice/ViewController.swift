//
//  ViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/5.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
        
    }
    
    
    func initView() {
        
        let imageView = UIImageView(frame: CGRect(
            origin: CGPoint(x: 20, y: 20),
            size: CGSize(width: 100, height: 100)))
        self.view.addSubview(imageView)
        
        imageView.animationImages = {
            var images = [UIImage]()
            
            for i in 0...10 {
                images.append(UIImage(named: "giphy-\(i)")!)
            }
            
            return images
        } ()
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 2
        imageView.image = imageView.animationImages?.first
        imageView.startAnimating()
    }
}

