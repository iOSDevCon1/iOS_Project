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
        
            
        case (Category.pod | Category.boundary) :
            //print(podInvinciable)
            if(!podInvincible){
                var pod:Pod!
                if contact.bodyA.categoryBitMask == Category.pod {
                    pod = contact.bodyA.node as! Pod;

                } else {
                    pod = contact.bodyB.node as! Pod;

                }
                pod.removeFromParent()
                pods.removeAtIndex(pods.indexOf(pod)!);

                if(pods.isEmpty){
                    endGame()
                }
            }
            break;
            
        case (Category.pod | Category.item) :
            var pod:Pod!;
            var item:Item!;
            if contact.bodyA.categoryBitMask == Category.pod {
                pod = contact.bodyA.node as! Pod;
                item = contact.bodyB.node as! Item;

            } else {
                pod = contact.bodyB.node as! Pod;
                item = contact.bodyA.node as! Item;
            }
            
            pod.touchItem(item);
            item.removeFromParent();
            break;
            
    
            
        default:
            break;
            
        }

        
    }
    
    
    
    
    
}
