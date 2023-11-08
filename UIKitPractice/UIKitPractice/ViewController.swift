//
//  ViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/5.
//

import UIKit
import Alamofire
import TrustKit

class ViewController: UIViewController{
    
    
    // MARK: - Alamofire 5.0.0, Certificate Pinning從本地憑證檔案讀取
    public func fetchCertificates(in bundle: Bundle = Bundle.main) -> [SecCertificate] {
        var certificates: [SecCertificate] = []
        
        let paths = Set([".cer", ".CER", ".crt", ".CRT", ".der", ".DER"].map { fileExtension in
            bundle.paths(forResourcesOfType: fileExtension, inDirectory: nil)
        }.joined())
        
        for path in paths {
            if  let certificateData = try? Data(contentsOf: URL(fileURLWithPath: path)) as CFData,
                let certificate = SecCertificateCreateWithData(nil, certificateData) {
                certificates.append(certificate)
            }
        }
        
        return certificates
    }
    
    private func testPinning1() {
        print("testApi")
        
        // 不需任何憑證狀態
        //  private let pinnedCertificates:[String:PinnedCertificatesTrustEvaluator] = [:]
        // 綁定本地任何憑證狀態
        let pinnedCertificates = [
            "www.google.com.tw":
                PinnedCertificatesTrustEvaluator(certificates: self.fetchCertificates(),
                                                 acceptSelfSignedCertificates: false,
                                                 performDefaultValidation: true,
                                                 validateHost: true)
        ]
        let serverTrustPolicy = ServerTrustManager(
            allHostsMustBeEvaluated: false,
            evaluators: pinnedCertificates
        )
        
        let session = Session(serverTrustManager: serverTrustPolicy)
        
        session.request("https://www.google.com.tw", method: .get)
            .responseString { response in
                switch response.result {
                case .success:
                    print(response.value)
                case .failure(let error):
                    print(error.errorDescription)
                }
                // session在function執行完後沒被retain需要呼叫
                session.session.invalidateAndCancel()
            }
        
    }
    
    // MARK: - Alamofire 5.0.0, Public Key Hash Pinning從public key hash綁定
    private func testPinning2() {
        let session: Session = {
            //let interceptor = SPNetworkInterceptor()
            
            let configuration = URLSessionConfiguration.af.default
            configuration.urlCache = nil
            
            let sessionDelegate = CustomSessionDelegate()
            // domain 移除 https://
            // 設定 TrustKit 的配置, 每個domain的kTSKPublicKeyHashes至少要放兩組
            
            let trustKitConfig = [
                kTSKSwizzleNetworkDelegates: false,
                kTSKPinnedDomains: [
                    "www.github.com": [
                        kTSKEnforcePinning: true,
                        kTSKIncludeSubdomains: true,
                        kTSKDisableDefaultReportUri: true,
                        kTSKPublicKeyHashes: [
                            "jSd+RbSAB3215SSioJKeyfdEFELVT/xz+Fwod2ypqtE=",
                            "YH8+l6PDvIo1Q5o6varvw2edPgfyJFY5fHuSlsVdvdc="
                        ],
                    ]
                ]
            ] as [String : Any]
            
//            interceptor: interceptor,
            TrustKit.initSharedInstance(withConfiguration: trustKitConfig)
            let afSession = Session(configuration: configuration,
                                    delegate: sessionDelegate,
                                    cachedResponseHandler: ResponseCacher(behavior: .doNotCache))
            
            
            return afSession
        }()
        
        session.request("https://www.github.com", method: .get)
            .responseString { response in
                switch response.result {
                case .success:
                    print(response.value)
                case .failure(let error):
                    print(error.errorDescription)
                }
                // session在function執行完後沒被retain需要呼叫
                session.session.invalidateAndCancel()
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.testPinning1()
        self.testPinning2()
    }
    
}

