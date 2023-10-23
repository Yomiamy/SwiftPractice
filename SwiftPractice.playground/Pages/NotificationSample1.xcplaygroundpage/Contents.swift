//: [Previous](@previous)

import Foundation

let STATUS_NOTIFICATION:String = "STATUS_NOTIFICATION"

class Receiver {
    
    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleStatusNotification),
                                               name: NSNotification.Name(STATUS_NOTIFICATION),
                                               object: nil)
    }
    
    @objc func handleStatusNotification() {
        print("\(#function), receive notification...")
    }
}

let receiver = Receiver()


// NotificationCenter.default.post(Notification(name: Notification.Name(STATUS_NOTIFICATION)))
// NotificationCenter.default.post(name: Notification.Name(STATUS_NOTIFICATION), object: nil)
NotificationCenter.default.post(name: Notification.Name(STATUS_NOTIFICATION), object: nil, userInfo: nil)

