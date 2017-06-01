//
//  ViewController.swift
//  newPPGCalc
//
//  Created by Andrew Kuhtik  on 5/12/17.
//  Copyright © 2017 Andrew Kuhtik. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    //linking the storyboard objects to viewvontroller.swift
    @IBOutlet var gamesTextField: UITextField!
    @IBOutlet var pointsTextField: UITextField!
    
    @IBOutlet var finalPpg: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    
    
    //When calcualte button is pressed
    @IBAction func calculatePpgButton(_ sender: Any) {
        
       //Declares games played and points scored constants as doubles (because the final points per game average comes out at a decimal)
        let gamesPlayed = Double(gamesTextField.text!)
        let pointsAttained = Double(pointsTextField.text!)
        let final = pointsAttained! / gamesPlayed!
        

        //next constant used to round the average to one decimal place
        let roundedFinal = String(format: "%.1f", final)
        finalPpg.text! = "\(roundedFinal) pts/g"
        
    }
    
    
    //Share this app on twitter button
    @IBAction func sharePpg(_ sender: Any) {
    
        //shows option to share the PPG average
        let alert = UIAlertController(title: "Share", message: "Share your PPG average on Twitter for your followers to see!", preferredStyle: .actionSheet)
        
        //Firt option to tap
        let actionOne = UIAlertAction(title: "Share on twitter", style: .default) { (action) in
            
            //Checks if user is connected to Twitter and has an account to set up
            if SLComposeViewController.isAvailable(forServiceType:  SLServiceTypeTwitter) {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("I score on average \(self.finalPpg.text!).")
                
                self.present(post, animated: true, completion: nil)
            } else {self.showAlert(service: "Twitter")}
            
            
        }
        
        //Option to cancel to share
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Adds the tabs to the popup
        alert.addAction(actionOne)
        alert.addAction(cancelAction)
        
        //Presents the popup
        self.present(alert, animated: true, completion: nil)
        
    }
    
   //if the user is not connected to Twitter
    func showAlert(service:String) {
        
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    //Dismisses the keyboard for either the games played or points scored textfield
    @IBAction func dismissPsKeyboard(_ sender: Any) {
        self.pointsTextField.resignFirstResponder()
        self.gamesTextField.resignFirstResponder()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

