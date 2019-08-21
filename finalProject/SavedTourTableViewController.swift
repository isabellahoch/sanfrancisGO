//
//  SavedTourTableViewController.swift
//  finalProject
//
//  Created by Isabella Hochschild on 8/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

//class SavedTourTableViewController: UITableViewController, UISearchResultsUpdating {

class SavedTourTableViewController: UITableViewController {

    var tourStops : [TourStop] = []
    var allTourStops : [SavedTourStop] = []
    
    var filteredTableData = [String]()
    
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("i'm trying to get tour stops now")
        
        getTourStops()
        
//        resultSearchController = ({
//            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self
//            controller.dimsBackgroundDuringPresentation = false
//            controller.searchBar.sizeToFit()
//
//            tableView.tableHeaderView = controller.searchBar
//
//            return controller
//        })()
        
        // Reload the table
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allTourStops.count
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        filteredTableData.removeAll(keepingCapacity: false)
//
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        let array = (tourStops as NSArray).filtered(using: searchPredicate)
//        filteredTableData = array as! [String]
//
//        self.tableView.reloadData()
//    }
    
//    func createTourStops() {
//
//    }
    
    func getTourStops() {
        
        print("step 1.....")
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            print("and we're here now")
            
            if let coreDataTourStops = try? context.fetch(SavedTourStop.fetchRequest()) as? [SavedTourStop] {
                allTourStops = coreDataTourStops
                print("okiiii")
                print(allTourStops)
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this gives us a single ToDo
        let tourStop = allTourStops[indexPath.row]
        
        performSegue(withIdentifier: "savedTourStopsSegue", sender: tourStop)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        let tourStop = allTourStops[indexPath.row]
        
        cell.textLabel?.text = "STOP \(indexPath.row+1): \(tourStop.name!)"
        
        cell.textLabel?.font = UIFont(name:"Avenir", size:18)
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
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
    
    
    
    // FIX BELOW!!!! URGENT!!!!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let completeVC = segue.destination as? SavedTourDetailViewController {
            if let tourStop = sender as? SavedTourStop {
                completeVC.selectedTourStop = tourStop
                completeVC.previousVC = self
            }
        }
    }

}
