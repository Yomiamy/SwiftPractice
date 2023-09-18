import SafariServices
import PlaygroundSupport

let url = URL(string: "http://www.yahoo.com.tw")
let controller = SFSafariViewController(url: url!)
PlaygroundPage.current.liveView = controller
