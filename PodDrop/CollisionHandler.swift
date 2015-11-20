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
        var firstNode, secondNode: SKSpriteNode!
        
        firstNode = contact.bodyA.node as! SKSpriteNode;
        secondNode = contact.bodyB.node as! SKSpriteNode;
        
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        
            
        case Category.pod | Category.boundary:
            if contact.bodyA.categoryBitMask == Category.pod {
                let pod = contact.bodyA.node as! Pod;
                pod.position.y = self.size.width
                
            } else {
                let pod = contact.bodyB.node as! Pod;
                pod.position.y = self.size.width
            }
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
