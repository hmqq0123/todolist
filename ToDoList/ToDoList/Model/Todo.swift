import Foundation

struct Todo: Decodable {
    
    var results: [TaskDetail]
}

struct TaskDetail: Decodable {
    
    private var id: String
    private var title: String
    private var description: String
    
    init(id: String, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
    
    static var empty: Self {
       return TaskDetail(id: "", title: "", description: "")
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getDes() -> String {
        return self.description
    }
}
