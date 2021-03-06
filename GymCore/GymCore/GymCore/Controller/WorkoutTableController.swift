//
//  WorkoutTableController.swift
//  GymCore
//
//  Created by Teodor Radu on 07.05.2022.
//

import Foundation
import UIKit
import RealmSwift

class WorkoutTableController: UITableViewController {

    
    var itemArray = [Item]()
    
    let defaults = UserDefaults()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        let items = realm.objects(Item.self)
        itemArray = Array(items)
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Exercise", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            	
            
    
            
            let tmpItem = Item()
            tmpItem.title = textField.text!
            tmpItem.checked = false
            
            self.itemArray.append(tmpItem)
            self.addToRealm(item: tmpItem)
        
            
            self.tableView.reloadData()
        }
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
           
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
    }
    
    
    func addToRealm(item: Item)
    {
        do{
            try realm.write{
                realm.add(item)}
            
        } catch {
                print("Eroare dura")
            }
        }
    
}

