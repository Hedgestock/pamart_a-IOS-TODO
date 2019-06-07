//
//  TODOListTableViewController.swift
//  TPIOS1
//
//  Created by epita on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TODOListTableViewController: UITableViewController {

    var toDoItems = [ToDoItem]()
    
    @IBAction func setEdit(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        if let source = segue.source as? AddTodoItemViewController {
            if let item = source.todoItem {
                toDoItems.append(item)
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        if indexPath.row < toDoItems.count {
            let todoItem = toDoItems[indexPath.row]
            cell.textLabel?.text = todoItem.itemName
            cell.backgroundColor = .blue
            if todoItem.completed {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row < toDoItems.count {
            let todoItem = toDoItems[indexPath.row]
            todoItem.completed = !todoItem.completed
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedObject = toDoItems[fromIndexPath.row]
        toDoItems.remove(at: fromIndexPath.row)
        toDoItems.insert(movedObject, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
