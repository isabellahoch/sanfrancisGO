//
//  SavedTourDetailViewController.swift
//  finalProject
//
//  Created by Isabella Hochschild on 8/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SavedTourDetailViewController: UIViewController  {
    
    var previousVC = SavedTourTableViewController()
    var selectedTourStop = SavedTourStop()
    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var saveButtonLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedTourStop.name
        addressLabel.text = selectedTourStop.address
        descriptionLabel.text = selectedTourStop.details
        imageView.image = selectedTourStop.image?.toImage()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addybutton(_ sender: Any) {
        
        print("the link should show below hopefully")
//        print(selectedTourStop.link)
//        if UIApplication.shared.canOpenURL(selectedTourStop.link as URL) {
//            UIApplication.shared.openURL(selectedTourStop.link as URL)
//        }
//        else {
//            print("oh fuk")
//        }
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
                newSavedTourStop.image = selectedTourStop.image
                
                
                
                try? context.save()
                
                print("saved this tour stop to core data:")
                print(newSavedTourStop)
                
                navigationController?.popViewController(animated: true)
                
                saveButton.setImage(UIImage(named:"confirmation.png"), for: .normal)
                saveButtonLabel.text = "saved"
            }
        }
        else if saveButton.image(for:.normal) == UIImage(named: "confirmation.png") {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                let theTourStop = SavedTourStop()
                theTourStop.name = selectedTourStop.name
                theTourStop.address = selectedTourStop.address
                theTourStop.details = selectedTourStop.details
                theTourStop.image = selectedTourStop.image
                context.delete(theTourStop)
                navigationController?.popViewController(animated: true)
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
    
}
