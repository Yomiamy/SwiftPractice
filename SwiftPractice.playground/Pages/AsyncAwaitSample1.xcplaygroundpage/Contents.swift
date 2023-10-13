import UIKit

struct PostData: Codable {
    let id: Int
    let title: String
}


let url = URL(string: "https://my-json-server.typicode.com/Yomiamy/FakeJsonServer/posts")


print("Task.init... \(Thread.current)")
Task.init {
    sleep(5)
    
    print("Task.init... \(Thread.current)")
    let (data, response) = try await URLSession.shared.data(from: url!)
    
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        print("API failed")
        fatalError("API failed")
    }
    
    //print("httpResponse.status = \(httpResponse.statusCode)")
    //print("data = \(String(data: data, encoding: .utf8)!)")
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    do {
        let postDataAry: [PostData] = try decoder.decode([PostData].self, from: data)
        //print("postDataAry:\n \(postDataAry.map({ data -> String in "\(data.id) : \(data.title)"}).joined(separator: "\n"))")
    } catch {
        //print("error = \(error)")
    }
}

print("end...\(Thread.current)")


