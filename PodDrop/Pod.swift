//
//  Pod.swift
//  PodDrop
//
//  Created by Ari on 10/25/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Pod: SKSpriteNode {
    
    init(imageName: String, boundaryCategory: UInt32, size:CGSize) {
        super.init(texture: SKTexture(imageNamed: imageName), color: UIColor.clearColor(), size: size)
        let radius = self.size.width/2
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.collisionBitMask = boundaryCategory;
        self.physicsBody?.linearDamping = 0;
        self.physicsBody?.friction = 0;
        self.physicsBody?.restitution = 0;
        
        let gravity = CGVectorMake(0, -8);
        self.physicsBody?.applyImpulse(gravity);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}