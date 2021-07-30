//
//  TodoViewController.swift
//  Todoey
//
//  Created by Raghav Sharma on 30/07/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController{
    
    @IBOutlet weak var addToDo: UIBarButtonItem!
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        addToDo.tintColor = .white
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
//            itemArray = items
//        }
        
        // Retreive data
        loadItems()
        
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()){
        do{
            itemArray = try context.fetch(request)
        }
        catch{
            print("Error in fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        // Ask title through alert view
        let alertVC = UIAlertController(title: "Enter todo item", message: "Please type in what you have to do", preferredStyle: .alert)
        
        alertVC.addTextField{ (textField) in
            textField.placeholder = "Buy apples"
        }
        
        let submitAction =  UIAlertAction(title: "Submit", style: .default, handler: {
            (alert) -> Void in
            if let title = alertVC.textFields, let todo = title[0].text{
                print(todo)
                
                if !self.isEmptyString(todo){
                    let newItem = Item(context: self.context)
                    newItem.done = false
                    newItem.title = todo
                    self.itemArray.append(newItem)
                    self.saveData()
                }
            }
            else{
                print("Enter something")
            }
        })
        
        
        alertVC.addAction(submitAction)
        present(alertVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
       
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set opposite of what it was
        //itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
        saveData()
    }
    
    
    
    func saveData(){
        do{
            try context.save()
        }
        catch{
            print("Error encoding item array")
        }
        tableView.reloadData()
    }
    
    func isEmptyString(_ string: String) -> Bool{
        if string.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            // Its an empty string
            return true
        }
        else{
            return false
        }
    }
}


//MARK: - Search bar methods
extension TodoListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        if let searchQuery = searchBar.text{
            if !isEmptyString(searchQuery){
                
                request.predicate = NSPredicate(format: "title CONTAINS %@", searchQuery)
                
                request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
                
                // Load results
                loadItems(with: request)
            }
            else{
                print("Empty")
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            tableView.reloadData()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
