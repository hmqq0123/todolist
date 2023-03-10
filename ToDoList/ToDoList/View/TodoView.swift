import Foundation
import UIKit

extension ViewController {
    
    func setupView() {
        self.view.addSubview(todoList)
        self.view.addSubview(searchBar)
        self.view.addSubview(addWork)
        
        NSLayoutConstraint.activate([
            addWork.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addWork.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0)),
            addWork.heightAnchor.constraint(equalToConstant: 50),
            addWork.widthAnchor.constraint(equalToConstant: 100),
            addWork.topAnchor.constraint(equalTo: self.todoList.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIApplication.shared.statusBarFrame.height),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            todoList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            todoList.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIApplication.shared.statusBarFrame.height + 50),
            todoList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
