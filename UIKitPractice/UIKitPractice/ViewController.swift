//
//  ViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/5.
//

import UIKit
import IOSSecuritySuite
import AVFAudio


class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    private let strArray = ["StrA", "StrB", "StrC", "StrD"]
    private let synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "\(CusomTableViewCell2.self)", bundle: nil), forCellReuseIdentifier: "\(CusomTableViewCell2.self)")
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        strArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\("\(CusomTableViewCell2.self)")") as? CusomTableViewCell2 else {
            fatalError("No cell initialized")
        }
        
        cell.lbItem.text = strArray[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100.0
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let utterance = AVSpeechUtterance(string: strArray[indexPath.row])
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        synthesizer.speak(utterance)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

