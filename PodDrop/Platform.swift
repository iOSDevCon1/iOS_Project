//
//  Platform.swift
//  PodDrop
//
//  Created by Pablo Arango on 10/13/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Platform: SKSpriteNode {
    
    var leftPlatform: SKSpriteNode!
    var rightPlatform: SKSpriteNode!
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        let platformSize = CGSize(width: size.width/1.5, height: size.height);
        leftPlatform = SKSpriteNode(texture: texture, color: color, size: platformSize);
        
        rightPlatform = SKSpriteNode(texture: texture, color: color, size: platformSize);
        
        let myPoint = CGPointMake(size.width,0);
        rightPlatform.position = myPoint;
        
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size);
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        self.physicsBody?.linearDamping = 0;
        
        self.addChild(leftPlatform);
        self.addChild(rightPlatform);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}