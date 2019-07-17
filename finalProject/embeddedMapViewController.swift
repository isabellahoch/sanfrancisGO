//
//  embeddedMapViewController.swift
//  finalProject
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit
import WebKit

class embeddedMapViewController: UIViewController {
    
    @IBOutlet weak var webViewer: WKWebView!
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self as? WKUIDelegate
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.google.com/maps/d/u/0/embed?mid=1nkw3AfDMd1M8R0N-_bF-VxffgHDECifc")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
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
