//
//  HistoryTableViewController.swift
//  Conversion-Calculator
//
//  Created by Xcode User on 10/28/19.
//  Copyright © 2019 Cole Sellers. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var entries : [Conversion] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        //your code goes here
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //your code goes here
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        // your code goes here.
        
        return cell
    }

}
