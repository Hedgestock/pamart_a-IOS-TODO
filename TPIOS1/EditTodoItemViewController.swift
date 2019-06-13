//
//  EditTodoItemViewController.swift
//  TPIOS1
//
//  Created by epita on 10/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class EditTodoItemViewController: UIViewController {

    @IBOutlet weak var TodoItemName: UITextField!
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    var todoItem: ToDoItem?
    var currIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TodoItemName.text = todoItem?.itemName
        
        
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let sender = sender as? UIBarButtonItem, sender == DoneButton {
            if let text = TodoItemName.text, text.count > 0 {
                todoItem?.itemName = text;
            }
        }
    }
    
    

}
