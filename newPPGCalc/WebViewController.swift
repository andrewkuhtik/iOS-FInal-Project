//
//  WebViewController.swift
//  newPPGCalc
//
//  Created by Andrew Kuhtik  on 5/12/17.
//  Copyright © 2017 Andrew Kuhtik. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    //inserted Web View
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //selects specific URL and loads the website request once the view loads
        let espnURL = URL(string: "https://www.espn.com/nhl/statistics/player/_/stat/points/sort/avgPoints")
        let espnURLRequest = URLRequest(url: espnURL!)
        webView.loadRequest(espnURLRequest)
    
    }
    
    
    
}
