//
//  MainMenuViewController.swift
//  PodDrop
//
//  Created by Ari on 11/14/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import Parse

class MainMenuViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("main menu loaded!")
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func logout(sender: AnyObject) {
        PFUser.logOut();
    }
    
    @IBAction func play(sender: AnyObject) {
        print("pressed 'Play'!")
        if let _ = PFUser.currentUser() {
            print("already logged in!")
            print(PFUser.currentUser())
            self.performSegueWithIdentifier("alreadyRegistered", sender:self)
        }
        else{
            print("need to register first!")
            self.performSegueWithIdentifier("registerFirst", sender:self)
        }
    }
}
