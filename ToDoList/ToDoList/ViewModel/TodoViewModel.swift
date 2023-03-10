import Foundation

class TodoViewModel {
    
    var todoList = [TaskDetail]()
    
    func getTodoList() -> [TaskDetail] {
        guard let url = Bundle.main.url(forResource: "TodoData", withExtension: "json") else {return [TaskDetail.empty]}
        
        if let data = try? Data(contentsOf: url) {
            let todoList = try? JSONDecoder().decode(Todo.self, from: data)
            self.todoList = todoList!.results
        }
        
        return self.todoList
    }
    
    func numberOfRowsInSection() -> Int {
        return todoList.count
    }
}
