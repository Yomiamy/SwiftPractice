import Foundation
import IOSSecuritySuite

class SecurityUtils {
    
    static let shared = SecurityUtils()
    
    private init() {}
    
    func isDeviceJB() -> Bool {
        IOSSecuritySuite.amIJailbroken()
    }
}
