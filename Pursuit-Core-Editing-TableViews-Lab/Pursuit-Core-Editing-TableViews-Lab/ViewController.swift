//
//  ViewController.swift
//  Pursuit-Core-Editing-TableViews-Lab
//
//  Created by Gregory Keeley on 11/21/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var groceryTextField: UITextField!
    @IBOutlet weak var submitGroceryButton: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    var groceries = [GroceryList]() {
        didSet {
            tableView.reloadData()
        }
    }
    var isEditingTableView = false {
        didSet {
            tableView.isEditing = isEditingTableView
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        groceries = GroceryList.groceries
    }
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        isEditingTableView.toggle()
    }
    

}


//MARK: Extensions
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groceries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        let grocery = groceries[indexPath.row]
        cell.textLabel?.text = grocery.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let groceryToMove = groceries[sourceIndexPath.row]
        groceries.remove(at: sourceIndexPath.row)
        groceries.insert(groceryToMove, at: destinationIndexPath.row)
    }
}
