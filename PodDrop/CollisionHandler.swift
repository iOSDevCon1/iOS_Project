//
//  CollisionHandler.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/19/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {

    func didBeginContact(contact: SKPhysicsContact) {
        
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        
            
        case Category.pod | Category.boundary:
            if contact.bodyA.categoryBitMask == Category.pod {
//                let pod = contact.bodyA.node as! Pod;
                endGame();
            } else {
//                let pod = contact.bodyA.node as! Pod;
                endGame();            }
            break;
            
        case Category.pod | Category.item:
            if contact.bodyA.categoryBitMask == Category.pod {
                let pod = contact.bodyA.node as! Pod;
                
                pod.addItem(contact.bodyB.node as! Item)
            } else {
                let pod = contact.bodyB.node as! Pod;
                
                pod.addItem(contact.bodyA.node as! Item)
            }
            
            break;
            
        default:
            break;
            
        }

        
    }
    
    
    
    
    
}
