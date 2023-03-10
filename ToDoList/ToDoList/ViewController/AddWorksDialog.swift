//
//  AddWorksDialog.swift
//  ToDoList
//
//  Created by QuangVL on 10/03/2023.
//

import Foundation
import UIKit

extension ViewController {
    
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         cancelTitle:String? = "Cancel",
                         inputTitlePlaceholder:String? = nil,
                         inputDescriptionPlaceholder:String? = nil,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = inputTitlePlaceholder
            textField.autocapitalizationType = .sentences
        }
        
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = inputDescriptionPlaceholder
            textField.autocapitalizationType = .sentences
        }
        
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let titleTF =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            
            guard let descriptionTF =  alert.textFields?[1] else {
                actionHandler?(nil)
                return
            }
            
            guard
                let title = titleTF.text,
                let descript = descriptionTF.text else {return}
            
            let detail = TaskDetail(id: "nil", title: title, description: descript)
            self.todoArr.insert(detail, at: 0)
            self.resultsSearch.insert(detail, at: 0)
            self.todoList.reloadData()
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.present(alert, animated: true, completion: nil)
    }
}
