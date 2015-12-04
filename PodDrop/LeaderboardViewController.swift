//
//  LeaderboardViewController.swift
//  PodDrop
//
//  Created by Ari on 11/14/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import Parse

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var scoreTable: UITableView!
    var users = [PFUser]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryUsers()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ScoreCell = self.scoreTable.dequeueReusableCellWithIdentifier("cell") as! ScoreCell
        let this_user = self.users[indexPath.row]
        cell.username_label.text = "\(this_user.username!)"
        if let _ = this_user.objectForKey("highScore"){
            cell.score_label.text = String(this_user.objectForKey("highScore")!)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    // This function queries Parse for images
    func queryUsers(){
        let query = PFUser.query()
        //query.whereKey("owner", equalTo:ownerOfGallery)
        query!.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) users.")
                if let objects = objects as [PFObject]!{
                    // Do something with the found objects
                    for object in objects {
                        self.users.append(object as! PFUser)
                        self.scoreTable.beginUpdates()
                        print("table will begin to update")
                        self.scoreTable.insertRowsAtIndexPaths([
                            NSIndexPath(forRow: self.users.count-1, inSection: 0)
                            ], withRowAnimation: .Top)
                        print("row has been inserted")
                        self.scoreTable.endUpdates()
                        print("end update")
                        self.scoreTable.reloadData()
                        
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
