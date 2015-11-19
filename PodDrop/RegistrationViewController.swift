//
//  RegistrationViewController.swift
//  PodDrop
//
//  Created by Ari on 11/17/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class RegistrationViewController: UIViewController{
    @IBOutlet weak var username_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    @IBOutlet weak var error_label: UILabel!
    @IBOutlet weak var email_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func submit(sender: AnyObject) {
        if(username_field.text != "" && password_field.text != "" && email_field.text != ""){
            print("Creating new user...")
            //CREATE AND SAVE NEW USER
            let user = PFUser()
            user.username = username_field.text
            user.password = password_field.text
            user.email = email_field.text
            
            print("Saving user...");
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                    print(errorString)
                    let errorCode = error.code
                    switch errorCode{
                    case 202:
                        self.error_label.text = "Username already taken"
                        break
                    default:
                        self.error_label.text = "Could not sign up, try again"
                        break
                    }
                } else {
                    // send user back to login view controller
                    print("You're IN. You can now play")
                    self.performSegueWithIdentifier("registrationSuccessful", sender:self)
                }
            }
        }
    }
    
    
    
}
