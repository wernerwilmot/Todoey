//
//  ViewController.swift
//  Todoey
//
//  Created by Werner Wilmot on 2018/05/24.
//  Copyright © 2018 Werner Wilmot. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos","Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tableview Datasource Methods
    
    //Declare numberOfRowsInSection here:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
        
    }
 
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
        //hide highlighting after cell is clicked
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add new items to tableview
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoy Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user click the add item button on UIAlert
            //add added text to tableView
            //itemArray.append(textField.text ?? "New Item") // This give default value of "new Item' when left blank
            
            if textField.text?.isEmpty ?? true {
                let alert = UIAlertController(title: "Empty textfield", message: "Please fill in text box", preferredStyle: .alert)
                let reloadField = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                })
                alert.addAction(reloadField)
                self.present(alert, animated: true, completion: nil)
        
            } else {
                self.itemArray.append(textField.text!)
                self.tableView.reloadData()

            }
        
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

    }
}

