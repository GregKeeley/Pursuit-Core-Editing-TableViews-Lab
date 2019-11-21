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
    var groceries = [GrocerieList]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
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
    
    
}
