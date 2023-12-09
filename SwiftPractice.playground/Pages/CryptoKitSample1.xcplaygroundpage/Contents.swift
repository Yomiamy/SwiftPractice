//: [Previous](@previous)

import Foundation
import CryptoKit

// ===  Usage: AES
func encryptAESData(data: Data, key: SymmetricKey) throws -> Data {
    let sealedBox = try AES.GCM.seal(data, using: key)
    return sealedBox.combined!
}

func decryptAESData(ciphertext: Data, key: SymmetricKey) throws -> Data {
    let sealedBox = try AES.GCM.SealedBox(combined: ciphertext)
    return try AES.GCM.open(sealedBox, using: key)
}

let inputData = "Sensitive data".data(using: .utf8)!
let key = SymmetricKey(size: .bits256)

let encryptedData = try encryptAESData(data: inputData, key: key)

let decryptedData = try decryptAESData(ciphertext: encryptedData, key: key)
let decryptedString = String(data: decryptedData, encoding: .utf8)
print(decryptedString ?? "") // Output: Sensitive data


func hashData(data: Data) -> String {
    let hashedData = SHA256.hash(data: data)
    let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
    return hashString
}

// ===  Usage: Hash
let inputData2 = "Hello, Crypto!".data(using: .utf8)!
let hashedString = hashData(data: inputData2)
print(hashedString) // Output: 4c776e56ac9ef79641470704e02b57e41a3e395d1c5eece8a6a8d1be10e2f0f0


// ===  Usage: RSA
//func encryptData(data: Data, publicKey: SecKey) throws -> Data {
//    return try RSA.encrypt(data, using: .init(publicKey: publicKey, padding: .PKCS1))
//}
//
//func decryptData(ciphertext: Data, privateKey: SecKey) throws -> Data {
//    return try RSA.decrypt(ciphertext, using: .init(privateKey: privateKey, padding: .PKCS1))
//}
//
//// Usage:
//let inputData = "Sensitive data".data(using: .utf8)!
//let (privateKey, publicKey) = try RSA.KeyPair.generate(keySize: 2048)
//let encryptedData = try encryptData(data: inputData, publicKey: publicKey)
//let decryptedData = try decryptData(ciphertext: encryptedData, privateKey: privateKey)
//let decryptedString = String(data: decryptedData, encoding: .utf8)
//print(decryptedString ?? "") // Output: Sensitive data

//: [Next](@next)
