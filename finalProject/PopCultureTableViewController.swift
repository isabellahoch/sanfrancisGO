//
//  PopCultureTableViewController.swift
//  finalProject
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PopCultureTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var tourStops : [TourStop] = []
    
    var filteredTableData = [String]()
    
    var resultSearchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTourStops()
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
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
        return tourStops.count
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (tourStops as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
    }
    
    func createTourStops() {
        createTourStop(name: "Emma Chamberlain ☆ The Mill SF", details: "Really good coffee and avocado toast even though it was $8. Unfortunately the marble tables were already taken. Still a good place to check out if you’re a foodie 🤤", image: UIImage(named:"the mill")!, address: "736 Divisadero St, San Francisco, CA 94117")
        createTourStop(name: "Emma Chamberlain ☆ HOME SF", details: "At home you can get some of the prettiest lattes you have ever seen. The most iconic latte is called the birthday cake latte and it have a rainbow design on top of it. Be careful of this birthday cake latte though as it’s very sweet", image: UIImage(named:"home sf")!, address: "2018 Clement St, San Francisco, CA 94121")
        createTourStop(name: "Emma Chamberlain ☆ Bi-Rite", details: "This insta famous ice cream makes fresh ice cream with a twist of unique flavors. This ice cream store was featured in Emma Chamberlain’s video “Trying Insta Famous Foods”", image: UIImage(named:"home sf")!, address: "550 Divisadero St, San Francisco, CA 94117")
        createTourStop(name: "Full House ☆ The Painted Ladies", details: "Visit the site of the popular family sitcom Full House & Fuller House!", image: UIImage(named:"p ladies fh")!, address: "Steiner & Hayes St, San Francisco, CA 94117, USA")
        createTourStop(name: "Mrs. Doubtfire ☆ Hillard House", details: "Everyone’s favorite British maid came into our lives in the 90’s and has never left since. A must-see for families and kids at heart, the Hillard House is located in the Pacific Heights neighborhood of San Francisco. We’ll give you a hint where it is. If you’re a true film geek, you’ll have no problem pointing it out.", image: UIImage(named:"mrs doubtfire")!, address: "2640 Steiner St")
    }
    
    func createTourStop(name : String, details : String, image : UIImage, address : String) {
        let newTourStop = TourStop()
        newTourStop.name = name
        newTourStop.details = details
        newTourStop.image = image
        newTourStop.address = address
        let originalUrl = "http://maps.apple.com/?q=\(address)"
        let urlString = originalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        newTourStop.link = URL(string: urlString!)
        tourStops.append(newTourStop)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this gives us a single ToDo
        let tourStop = tourStops[indexPath.row]
        
        performSegue(withIdentifier: "popCultureSegue", sender: tourStop)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        let tourStop = tourStops[indexPath.row]
        
        cell.textLabel?.text = "STOP \(indexPath.row+1): \(tourStop.name)"
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let completeVC = segue.destination as? PopCultureDetailViewController {
            if let tourStop = sender as? TourStop {
                completeVC.selectedTourStop = tourStop
                completeVC.previousVC = self
            }
        }
    }

}
