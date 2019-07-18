//
//  Tour3TableViewController.swift
//  finalProject
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class Tour3TableViewController: UITableViewController {

    var tourStops : [TourStop] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTourStops()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tourStops.count
    }
    
    func createTourStops() {
        createTourStop(name: "Urban Slides", details: "Growing up is hard luckily, this park features slides made for Adult size bodies. Grab some friends and come let out your inner child.", image: UIImage(named:"urban slides")!, address: "30 Seward St, San Francisco, CA 94114")
        createTourStop(name: "Twin Peaks", details: "Iconic SF picture spot for skyline views and beautiful sunsets.", image: UIImage(named:"cute sf clipart")!, address: "Twin Peaks, San Francisco, CA")
        createTourStop(name: "Baker Beach", details: "Grab a Sandwich and enjoy a picnic lunch on this beach", image: UIImage(named:"cute sf clipart")!, address: "Baker BeachSan Francisco, CA")
        createTourStop(name: "Golden Gate Bridge Vista Point", details: "Walking across the golden gate bridge is one of the coolest places you can walk across. The bridge is 1.7 miles long and takes about 30-60 mins to walk across. When you walk across the bridge expect to see some breath taking views of the city.", image: UIImage(named:"cute sf clipart")!, address: "Golden Gate Bridge Vista Point, San Francisco, CA 94129")
        createTourStop(name: "Billy Goat Hill (Swing)", details: "A view point of the city with a swing", image: UIImage(named:"cute sf clipart")!, address: "2442 Castro St, San Francisco, CA 94131")
        createTourStop(name: "Presidio of San Francisco", details: "A former military owned property this is one of the largest untouched pieces in San Francisco that features some of the best hikes in the city.", image: UIImage(named:"cute sf clipart")!, address: "Presidio of San Francisco, San Francisco, CA")
        createTourStop(name: "Mr. Holmes Bakehouse", details: "The famous 'I got baked in SF sign'", image: UIImage(named:"cute sf clipart")!, address: "1042 Larkin St, San Francisco, CA 94109")
        createTourStop(name: "Battery Spencer", details: "This is probably the most iconic place to take a picture of the bridge.", image: UIImage(named:"cute sf clipart")!, address: "Conzelman Rd, Sausalito, CA 94965")
    }
    
    func createTourStop(name : String, details : String, image : UIImage, address : String) {
        let newTourStop = TourStop()
        newTourStop.name = name
        newTourStop.details = details
        newTourStop.image = image
        newTourStop.address = address
        let originalUrl = "http://maps.apple.com/?q=\(address)"
        var urlString = originalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        newTourStop.link = URL(string: urlString!)
        tourStops.append(newTourStop)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this gives us a single ToDo
        let tourStop = tourStops[indexPath.row]
        
        performSegue(withIdentifier: "goToTour3Detail", sender: tourStop)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let tourStop = tourStops[indexPath.row]
        
        cell.textLabel?.text = "STOP \(indexPath.row+1): \(tourStop.name)"
        cell.textLabel?.font = UIFont(name:"Avenir", size:20)
        
        // Configure the cell...
        
        return cell
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
        
        if let completeVC = segue.destination as? Tour3DetailViewController {
            if let tourStop = sender as? TourStop {
                completeVC.selectedTourStop = tourStop
                completeVC.previousVC = self
            }
        }
    }

}
