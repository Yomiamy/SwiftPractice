//
//  TableViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/10.
//

import Foundation
import UIKit

class CustomTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
//        self.tableView.estimatedRowHeight = UITableView.automaticDimension
//        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
    
    // MARK: - DataDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") else {
            fatalError("No cell inited")
        }
        
        return cell
    }
}
