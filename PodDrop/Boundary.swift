//
//  Boundary.swift
//  PodDrop
//
//  Created by Ari on 10/17/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Boundary: SKNode {
    
    init(name: String, fromPoint:CGPoint, toPoint:CGPoint) {
    
        super.init()
        
        // Suffix the name with 'Boundary'
        self.name = name + "Boundary"
        
        // Simple physics body without gravity or motion
        self.physicsBody = SKPhysicsBody(edgeFromPoint: fromPoint, toPoint: toPoint)
        
        self.physicsBody!.dynamic = false;
        self.physicsBody!.categoryBitMask = Category.boundary;
        self.physicsBody!.collisionBitMask = Category.pod;
        self.physicsBody!.contactTestBitMask = Category.pod;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}