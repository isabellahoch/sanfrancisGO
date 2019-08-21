//
//  Tour1TableViewController.swift
//  finalProject
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
import CoreData

class Tour1TableViewController: UITableViewController {
    
    var tourStops : [TourStop] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        db.collection("destinations").whereField("tour", isEqualTo: "1").getDocuments { (snapshot, error) in
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    print(data)
                    
                    
                    
                    let tourStopDetails = jsonTourStop(json: data)
                    
                    
                    if let dictionary = data as? [String: Any] {
                        if let name = dictionary["name"] as? String {
                            print(name)
                        }
                    }
                }
            }
        }
        
        
        
        
        createTourStops()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    func createTourStops() {
        createTourStop(name: "The Ferry Building", details: "Located on the western edge of the continent, and at the center of the city’s financial, banking and transportation district, the ferry building showcases many small regional producers that practice traditional farming or production techniques. The ferry building also has a breathtaking view of the Bay Bridge.", image: UIImage(named:"ferry building")!, address: "1 The Embarcadero, San Francisco, CA 94105")
        createTourStop(name: "Coit Tower", details: "Walk or drive over to Coit Tower, an iconic SF landmark with amazing views of the city. As you wait in line, you can admire the beautiful artwork inside the tower. If you decide to drive from the Ferry building, there is a parking lot at the base of the tower. If you decide to walk from the Ferry Building, consider taking the Greenwich Steps, with access at 233 Greenwich Street.", image: UIImage(named:"coit tower")!, address: "1 Telegraph Hill Blvd, San Francisco, CA 94133")
        createTourStop(name: "Pier 39", details: "Walk or drive over to Pier 39 for food and fun activities. Some activities include Magowan’s Infinite Mirror Maze, the Musical Stairs, the Carousel, and the Sea Lion Center. Before hitting Pier 39, a popular SF destination is to tour Alcatraz. Tours to Alcatraz can be found on Pier 33, organized by Alcatraz Cruises.", image: UIImage(named:"pier 39")!, address: "The Embarcadero, San Francisco, CA 94133")
        createTourStop(name: "Fisherman's Wharf", details: "@alk over to Fisherman’s Wharf for more restaurant options and fun museums, such as Ripley’s Believe It or Not, Museum of Illusions, and the USS Pampanito.", image: UIImage(named:"cute sf clipart")!, address: "Fisherman's Wharf, San Francisco, CA")
        createTourStop(name: "Ghirardelli Square", details: "Get a free sample of chocolate from the Original Ghirardelli Ice Cream & Chocolate store and grab an ice cream sundae from this iconic chocolate destination.", image: UIImage(named:"g square")!, address: "900 North Point St Suite 52, San Francisco, CA 94109")
        createTourStop(name: "Lombard Street", details: "On the way out of SF, be sure to drive down or walk by Lombard Street, one of San Francisco’s most photographed attractions.", image: UIImage(named:"lombard st")!, address: "Lombard St., San Francisco, CA")
        createTourStop(name: "The Painted Ladies", details: "If you have a little extra time in the trip, you may be interested in visiting the Painted Ladies. Featured in the Full House title sequence, the painted ladies houses are a great photo op destination.", image: UIImage(named:"p ladies")!, address: "Steiner St &, Hayes St, San Francisco, CA 94117")
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


//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return tourStops.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tourStops.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this gives us a single ToDo
        let tourStop = tourStops[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: tourStop)
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
        
        if let completeVC = segue.destination as? DetailViewController {
            if let tourStop = sender as? TourStop {
                completeVC.selectedTourStop = tourStop
                completeVC.previousVC = self
            }
        }
    }

}
