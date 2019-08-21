//
//  additionalFeatures.swift
//  finalProject
//
//  Created by Isabella Hochschild on 8/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import WebKit

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

