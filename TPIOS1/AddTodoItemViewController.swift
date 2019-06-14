//
//  AddTodoItemViewController.swift
//  TPIOS1
//
//  Created by epita on 10/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var done: UIBarButtonItem!
    @IBOutlet weak var colorPicker: UIPickerView!
    var pickerLabels: [String] = [String]()
    var pickerData: [UIColor] = [UIColor]()
    var color: UIColor = .white
    var todoItem: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.colorPicker.delegate = self
        self.colorPicker.dataSource = self
        
        // Input the data into the array
        pickerLabels = ["white","red", "blue", "yellow", "orange", "green"]
        pickerData = [.white,.red, .blue, .yellow, .orange, .green]
    }
    
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
                todoItem = ToDoItem(itemName: text, color: color)
            }
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerLabels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String
    {
        color = pickerData[row]
        return pickerLabels[row]
    }
}
