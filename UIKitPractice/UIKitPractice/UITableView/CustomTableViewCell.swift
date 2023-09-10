//
//  CustomTableViewCell.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/10.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mContent: UILabel!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
