//
//  CustomStaticCellTableViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/11.
//

import UIKit

class CustomStaticCellTableViewController: UITableViewController {

    var mNextPageVC: UIViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mNextPageVC = storyboard?.instantiateViewController(withIdentifier: "Page2")
        mNextPageVC?.hidesBottomBarWhenPushed = true
        
        // self.navigationController?.navigationBar.isHidden = true
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.mNextPageVC!, animated: true)
    }
    
    
}
