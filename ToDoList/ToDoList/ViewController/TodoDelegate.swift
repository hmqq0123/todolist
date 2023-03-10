import Foundation
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: ListItemTableViewCell.identifier, for: indexPath) as! ListItemTableViewCell
        
        let detailItem = resultsSearch[indexPath.row]
        cell.setData(data: detailItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.resultsSearch.remove(at: indexPath.row)
        self.todoArr.remove(at: indexPath.row)
        self.todoList.deleteRows(at: [indexPath], with: .fade)
        self.todoList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.resultsSearch.remove(at: indexPath.row)
            self.todoArr.remove(at: indexPath.row)
            self.todoList.deleteRows(at: [indexPath], with: .fade)
            self.todoList.reloadData()
            completionHandler(true)
        }
        delete.backgroundColor = .systemRed
        // swipe
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
}
