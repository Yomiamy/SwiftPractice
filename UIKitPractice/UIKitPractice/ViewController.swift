//
//  ViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/5.
//

import UIKit
import IOSSecuritySuite


class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onTapImageView(_ sender: Any) {
        print("onTapImageView")
        self.selectPhoto()
    }
    
    func selectPhoto() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
            
        }
        
        self.imageView.image = image
        dismiss(animated: true)
    }
}

