//
//  CustomSessionDelegate.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/11/8.
//

import UIKit
import Alamofire
import TrustKit

class CustomSessionDelegate: SessionDelegate {
    
    override func urlSession(_ session: URLSession,
                             task: URLSessionTask,
                             didReceive challenge: URLAuthenticationChallenge,
                             completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let pinning = TrustKit.sharedInstance().pinningValidator
        if pinning.handle(challenge, completionHandler: completionHandler) == false {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
