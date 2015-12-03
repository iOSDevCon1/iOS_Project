//
//  ConsumableItem.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/14/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Item:SKSpriteNode{

    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        let radius = self.size.width/2
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.collisionBitMask = Category.platform;
        self.physicsBody?.categoryBitMask = Category.platform;
        self.physicsBody?.linearDamping = 0;
        self.physicsBody?.friction = 0;
        self.physicsBody?.restitution = 0;
        
        let gravity = CGVectorMake(0, -1);
        self.physicsBody?.applyImpulse(gravity);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func use(pod:Pod){
        pod.removeItem(self)
    }

}
