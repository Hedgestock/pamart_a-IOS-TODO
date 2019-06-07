//
//  AddTodoItemViewController.swift
//  TPIOS1
//
//  Created by epita on 10/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {


    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var done: UIBarButtonItem!
    var todoItem: ToDoItem?
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let sender = sender as? UIBarButtonItem, sender == done {
            if let text = textField.text, text.count > 0 {
                todoItem = ToDoItem(itemName: text)
            }
        }
    }
}
