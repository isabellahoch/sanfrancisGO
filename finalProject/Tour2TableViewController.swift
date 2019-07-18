//
//  Tour2TableViewController.swift
//  finalProject
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class Tour2TableViewController: UITableViewController {
    
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
        createTourStop(name: "Church of 8 Wheels", details: "This roller skating rink is very popular because of its unique location, inside a church! This activity is great for a friday or saturday night out with friends!", image: UIImage(named:"8 wheels")!, address: "554 Fillmore St, San Francisco, CA 94117")
        createTourStop(name: "Conservatory of Flowers", details: "This location is not super-touristy, but very cool! There are gorgeous gardens to walk around, 140 years of wonder 🌷", image: UIImage(named:"conservatory")!, address: "100 John F Kennedy Dr, San Francisco, CA 94118")
        createTourStop(name: "Urban Putt", details: "Mini golf situated in the middle of the mission. Stop at one of the mission's famous taquerias afterward for a taco! also, if you're over 21, this mini golf place offers alcohol.", image: UIImage(named:"urban putt")!, address: "1096 S Van Ness Ave, San Francisco, CA 94110")
        createTourStop(name: "16th Avenue Tiled Steps", details: "Creative, community-driven mosaic featuring a flowing sea to stars design up a 163-step stairway.", image: UIImage(named:"tiled steps")!, address: "16th Ave, San Francisco, CA 94122")
        createTourStop(name: "Lyon Street Steps", details: "Just being at the summit of these steps is a mystical Zen experience truly difficult to describe. The feeling of the sky and air where you are standing is amazing. And, spread out before you are fabulous views of the Palace of Fine Arts Dome, the blue San Francisco Bay, and a fog shrouded sky beyond. To the west is the Presidio forestand to the east are amazing old Pacific Heights mansions with their manicured lawns and many balconies.", image: UIImage(named:"lyon st")!, address: "2990-2996 Lyon St & Broadway, San Francisco, CA 94115")
        createTourStop(name: "Valencia Street", details: "Very cool up-and-coming shopping street. Good thrift stores, restaurants, coffee shops. We would recommend visiting reformation on valencia!", image: UIImage(named:"valencia")!, address: "Valencia St, San Francisco, CA")
        createTourStop(name: "Fillmore Street", details: "cute shopping, restaurants, etc.!", image: UIImage(named:"fillmore st")!, address: "Fillmore St, San Francisco, CA")
        createTourStop(name: "Sightglass Coffee", details: "Great coffee shop!", image:  UIImage(named:"sightglass")!, address: "301 Divisadero St, San Francisco, CA 94117")
        createTourStop(name: "Billy Goat Hill", details: "This modest neighborhood green space offers a small trail network & wildlife viewing opportunities.", image: UIImage(named:"billy goat")!, address: "2442 Castro St, San Francisco, CA 94131")
        createTourStop(name: "Presidio of San Francisco", details: "Great hikes and access to Baker Beach!", image: UIImage(named:"presidio st")!, address: "Presidio of San Francisco, San Francisco, CA")
        createTourStop(name: "Fort Mason", details: "check out off the grid! Fun place to hang out and take pictures!", image: UIImage(named:"fort mason")!, address: "Fort Mason, San Francisco, CA")
        createTourStop(name: "Wrecking Ball Coffee Roasters", details: "Great coffee shop!", image: UIImage(named:"wrecking ball")!, address: "2271 Union St, San Francisco, CA 94123")
        createTourStop(name: "Dandelion Chocolate Factory", details: "We would strongly recommend visiting this artisanal chocolate making business! you can visit their stores sprinkled around the city and try different flavors of chocolate, from Maya Mountain (pineapple and orange notes with hints of nuts and chocolate) to Gola Rainforest (black tea, cinnamon, and roasted walnut notes) they also have a wonderful assortment of pastries and drinks. I would recommend trying their hot chocolate and their incredible Paris-Brest.", image:  UIImage(named:"dandelion chocolate")!, address: "2600 16th St, San Francisco, CA 94103")
        createTourStop(name: "Tartine Manufactory", details: "the best bread you will ever have. some stores often have lines out the door... for good reason.", image:  UIImage(named:"tartine")!, address: "595 Alabama St, San Francisco, CA 94110")
//        createTourStop(name: "DNA Lounge", details: "DNA Lounge has been one of San Francisco's most popular nightclubs for over thirty years, hosting an always-eclectic variety of events, including all-ages live music, 18+ dance parties, burlesque shows, lecture series and private parties. Two stages, four dance floors, seven bars and a full-service late-night restaurant and cafe!", image:  UIImage(named:"cute sf clipart")!, address: "375 11th St, San Francisco, CA 94103")
        createTourStop(name: "Off The Grid: Presidio Picnic", details: "The best catering and food truck experiences in the San Francisco Bay Area.", image:  UIImage(named:"cute sf clipart")!, address: "103 Montgomery Street, San Francisco, CA 94129")
        createTourStop(name: "Loving Cup", details: "Family Owned business, made to order frozen yogurt.", image:  UIImage(named:"harold")!, address: "2201 Union St, San Francisco, CA 94123")
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
        
        performSegue(withIdentifier: "goToTour2Detail", sender: tourStop)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let tourStop = tourStops[indexPath.row]
        
        cell.textLabel?.text = "STOP \(indexPath.row+1): \(tourStop.name)"
        
        cell.textLabel?.font = UIFont(name:"Avenir", size:18)
        
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

        if let completeVC = segue.destination as? Tour2DetailViewController {
            if let tourStop = sender as? TourStop {
                completeVC.selectedTourStop = tourStop
                completeVC.previousVC = self
            }
        }
    }

}
