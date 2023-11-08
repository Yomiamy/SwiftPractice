//
//  ViewController.swift
//  UIKitPractice
//
//  Created by YomiRY on 2023/9/5.
//

import UIKit
import Alamofire

class ViewController: UIViewController{
    
    //    private var certificates: [SecCertificate] = []
    //    private let url: String = "https://www.google.com.tw"
    //
    
    //    func validateCert(url: String) {
    //        let conf = URLSessionConfiguration.default
    //        conf.timeoutIntervalForRequest = 60  //set timeout
    //        let alamoFireManager = Alamofire.SessionManager(configuration: conf)
    //
    //        alamoFireManager.request(url).validate().responseData { response in
    //            switch response.result {
    //            case .success(let data):
    //                if let serverTrust = response.serverTrust,
    //                   let serverCertificate = serverTrust.serverCertificates?.first {
    //                    // 从服务器获取证书成功
    //                    // serverCertificate 将包含服务器的证书
    //                    print("Successfully obtained server certificate")
    //
    //                    // 在这里可以获取证书的数据并继续下面的步骤
    //                } else {
    //                    print("Failed to obtain server certificate")
    //                }
    //            case .failure(let error):
    //                print("Request error: \(error)")
    //            }
    //        }
    //    }
    
    //    private func startTestApi() {
    //
    //        let conf = URLSessionConfiguration.default
    //        conf.timeoutIntervalForRequest = 60  //set timeout
    //        let alamoFireManager = Alamofire.SessionManager(configuration: conf)
    //
    //        alamoFireManager.download(url).responseData { response in
    //            switch response.result {
    //            case .success(let data):
    //                if let certificateData = data as? Data {
    //                    if let certificate = SecCertificateCreateWithData(kCFAllocatorDefault, certificateData as CFData) {
    //                        // 附加從url取得的 'certificate' 到certifica
    //                        self.certificates.append(certificate)
    //                        print("Successfully created the certificate: \(certificate)")
    //
    //                        self.testApi()
    //                    } else {
    //                        print("Failed to create the certificate")
    //                    }
    //                } else {
    //                    print("Invalid certificate data")
    //                }
    //            case .failure(let error):
    //                print("Failed to download certificate: \(error)")
    //            }
    //        }
    //    }
    
    //    func startTestApi() {
    //        let session = URLSession.shared
    //
    //        let task = session.dataTask(with: URL(string: url)!) { data, response, error in
    //            if let error = error {
    //                print("Request error: \(error)")
    //            } else if let data = data, let response = response as? HTTPURLResponse {
    //                response.server
    //                if let serverTrust = response.serverTrust, let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
    //                    let commonName = SecCertificateCopySubjectSummary(serverCertificate) as String
    //
    //                    if commonName.contains(url) {
    //                        // 证书的通用名称与目标域名匹配
    //                        // 获取服务器证书数据
    //                        if let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data? {
    //                            // 创建 SecCertificate 对象
    //                            if let certificate = SecCertificateCreateWithData(nil, serverCertificateData as CFData) {
    //                                // 你现在可以使用 'certificate' 对象来处理证书了
    //                                // 这个证书可以用于配置 URLSession 的验证，或者其他需要证书的网络请求
    //                                print("Successfully created the certificate: \(certificate)")
    //                            } else {
    //                                print("Failed to create the certificate")
    //                            }
    //                        } else {
    //                            print("Failed to get server certificate data")
    //                        }
    //                    } else {
    //                        print("Certificate common name does not match the domain")
    //                    }
    //                } else {
    //                    print("Failed to obtain server certificate")
    //                }
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
    // MARK: - Alamofire 4.0.0
    //    private func testApi() {
    //        print("testApi")
    //
    ////        ServerTrustPolicy.certificates()
    ////        certificates
    //        let serverTrustPolicy:ServerTrustPolicy = ServerTrustPolicy.pinCertificates(
    //            certificates:  ServerTrustPolicy.certificates(),
    //            validateCertificateChain: true,
    //            validateHost: true)
    //
    //        let serverTrustPolicies:[String: ServerTrustPolicy] = [
    //            "www.google.com.tw" : serverTrustPolicy
    //        ]
    //
    //        let conf = URLSessionConfiguration.default
    //        conf.timeoutIntervalForRequest = 60  //set timeout
    //
    //        let alamoFireManager = Alamofire.SessionManager(configuration: conf,
    //                                                        serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
    //        alamoFireManager.request("https://www.google.com.tw", method: .get)
    //            .responseString { response in
    //                print("\(response)")
    //                alamoFireManager.session.invalidateAndCancel()
    //            } // Alamofire.post
    //    }
    
    
    
    // MARK: - Alamofire 5.0.0
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
    
    private func testApi() {
        print("testApi")
        
         // 不需任何憑證狀態
        //    private let pinnedCertificates:[String:PinnedCertificatesTrustEvaluator] = [:]
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
                print("\(response.result)")
                session.session.invalidateAndCancel()
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testApi()
    }
    
}

