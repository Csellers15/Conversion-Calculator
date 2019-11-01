//
//  HistoryTableViewController.swift
//  Conversion-Calculator
//
//  Created by Xcode User on 10/28/19.
//  Copyright © 2019 Cole Sellers. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var entries : [Conversion]?
    var historyDelegate:HistoryTableViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortIntoSections(entries: self.entries!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    var tableViewData: [(sectionHeader: String, entries: [Conversion])]? {
           didSet {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }

       func sortIntoSections(entries: [Conversion]) {
           
           var tmpEntries : Dictionary<String,[Conversion]> = [:]
           var tmpData: [(sectionHeader: String, entries: [Conversion])] = []
           
           // partition into sections
           for entry in entries {
               let shortDate = entry.timestamp.short
               if var bucket = tmpEntries[shortDate] {
                   bucket.append(entry)
                   tmpEntries[shortDate] = bucket
               } else {
                   tmpEntries[shortDate] = [entry]
               }
           }
           
           // breakout into our preferred array format
           let keys = tmpEntries.keys
           for key in keys {
               if let val = tmpEntries[key] {
                   tmpData.append((sectionHeader: key, entries: val))
               }
           }

           // sort by increasing date.
           tmpData.sort { (v1, v2) -> Bool in
               if v1.sectionHeader < v2.sectionHeader {
                   return true
               } else {
                   return false
               }
           }
           
           self.tableViewData = tmpData
       }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // use the historyDelegate to report back entry selected to the calculator scene
           if let del = self.historyDelegate {
               let conv = entries![indexPath.row]
               del.selectEntry(entry: conv)
           }
           
           // this pops back to the main calculator
           _ = self.navigationController?.popViewController(animated: true)
       }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        //your code goes here
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entry = self.entries{
            return entry.count
        } else {
             return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        if let entry = self.entries?[indexPath.row]{
            cell.textLabel?.text = String(entry.toVal) + entry.toUnits + "=" + String(entry.fromVal) + entry.fromUnits
            cell.detailTextLabel?.text = entry.mode.rawValue
        }
        
        return cell
    }
}

protocol HistoryTableViewControllerDelegate {
     func selectEntry(entry: Conversion)
 }
