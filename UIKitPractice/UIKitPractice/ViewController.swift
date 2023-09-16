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
        
        imageView.image = UIImage.animatedImageNamed("giphy-", duration: 2)
        
        
    }
}

