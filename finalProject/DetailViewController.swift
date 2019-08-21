//
//  DetailViewController.swift
//  finalProject
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var previousVC = Tour1TableViewController()
    var selectedTourStop = TourStop()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var saveButtonLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    
//    let currentTourStop = SavedTourStop()
    let currentTourStop = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedTourStop.name
        addressLabel.text = selectedTourStop.address
        descriptionLabel.text = selectedTourStop.details
        imageView.image = selectedTourStop.image
        
        // okurrrr
        
        if checkIfInCoreData(tourStopName: selectedTourStop.name) {
            saveButton.setImage(UIImage(named:"filled_bookmark.png"), for: .normal)
            saveButtonLabel.text = "unsave"
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addybutton(_ sender: Any) {
        
        print("the link should show below hopefully")
        print(selectedTourStop.link)
            if UIApplication.shared.canOpenURL(selectedTourStop.link as URL) {
                UIApplication.shared.openURL(selectedTourStop.link as URL)
            }
            else {
                print("oh fuk")
        }
    }
    
    
    @IBAction func saveButtonTap(_ sender: Any) {
        if saveButton.image(for:.normal) == UIImage(named: "bookmark.png") {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                // we are creating a new ToDoCD object here, naming it toDo
                let newSavedTourStop = SavedTourStop(entity: SavedTourStop.entity(), insertInto: context)
                
                // if the titleTextField has text, we will call that text titleText
                
                    // this .name and .important came from the attributes you typed in on the Core Data page!
                newSavedTourStop.name = selectedTourStop.name
                newSavedTourStop.address = selectedTourStop.address
                newSavedTourStop.details = selectedTourStop.details
                newSavedTourStop.image = selectedTourStop.image.toString()
                    
                
                
                try? context.save()
                
                print("saved this tour stop to core data:")
                print(newSavedTourStop)
                
//                navigationController?.popViewController(animated: true)
                
                saveButton.setImage(UIImage(named:"filled_bookmark.png"), for: .normal)
                saveButtonLabel.text = "saved"
            }
        }
        else {
            
//            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
//                if let theTourStop = SavedTourStop(context: selectedTourStop) {
//                    context.delete(theTourStop)
//                    navigationController?.popViewController(animated: true)
//                }
//            }
    
            if let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedTourStop")
                
                do {
                    let fetchedEmployees = try moc.fetch(fetchRequest) as! [SavedTourStop]
                } catch {
                    fatalError("Failed to fetch data: \(error)")
                }
                
                let name = selectedTourStop.name
                fetchRequest.predicate = NSPredicate(format: "name == %@", name)
                print(fetchRequest)
//                moc.delete(fetchRequest)
//                navigationController?.popViewController(animated: true)
                saveButton.setImage(UIImage(named:"bookmark.png"), for: .normal)
                saveButtonLabel.text = "save"
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func checkIfCoreDataItemExists(id: Int, type: String) -> Bool {
//
//        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DetailsEntity")
//        fetchRequest.fetchLimit =  1
//        fetchRequest.predicate = NSPredicate(format: "id == %d" ,id)
//        fetchRequest.predicate = NSPredicate(format: "type == %@" ,type)
//
//        do {
//            let count = try managedContext.count(for: fetchRequest)
//            if count > 0 {
//                return true
//            }else {
//                return false
//            }
//        }catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//            return false
//        }
//    }
    
//    func checkIfItemExistsInCoreData(name: String, type: String) -> Bool {
//
//        let managedContext = persistentContainer.sharedInstance.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DetailsEntity")
//        fetchRequest.fetchLimit =  1
//        fetchRequest.predicate = NSPredicate(format: "name == %d" ,name)
//        fetchRequest.predicate = NSPredicate(format: "type == %@" ,type)
//
//        do {
//            let count = try managedContext.count(for: fetchRequest)
//            if count > 0 {
//                return true
//            }else {
//                return false
//            }
//        }catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//            return false
//        }
//    }
    
    
    
    func checkIfInCoreData(tourStopName : String) -> Bool {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
        if let coreDataTourStops = try? context.fetch(SavedTourStop.fetchRequest()) as? [SavedTourStop] {
            for item in coreDataTourStops {
                if item.name! == tourStopName {
                    return true
                }
            }
            //                    print("okiiii")
            //                    print(allTourStops)
            //                    tableView.reloadData()
        }
    }
    return false
    
    
    
    
    
    
    
    
    
}
}
