//
//  jsonTourStop.swift
//  finalProject
//
//  Created by Isabella Hochschild on 8/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class jsonTourStop {
    var name = ""
    var details = ""
    var address = ""
    var link : URL!
    var image = UIImage()
    
    init(json: [String: Any]) {
        let name = json["name"]
        let details = json["details"]
        let address = json["address"]
        let link = "sanfrancisgo.herokuapp.com"
        //        let image = json["image"]
        
        self.name = name as! String
        self.details = details as! String
        self.address = address as! String
        self.link = link as! URL
        //        self.image = UIImage(url:link)
    }
}
