//
//  PopCultureDetailViewController.swift
//  finalProject
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PopCultureDetailViewController: UIViewController {
    
    var previousVC = PopCultureTableViewController()
    var selectedTourStop = TourStop()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedTourStop.name
        addressLabel.text = selectedTourStop.address
        descriptionLabel.text = selectedTourStop.details
        imageView.image = selectedTourStop.image

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapppy(_ sender: Any) {
        print("the link should show below hopefully")
        if UIApplication.shared.canOpenURL(selectedTourStop.link as URL) {
            UIApplication.shared.openURL(selectedTourStop.link as URL)
            
        }
        else {
            print("oh fuk")
            
        }
    }
    
    // popCultureSegue
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
