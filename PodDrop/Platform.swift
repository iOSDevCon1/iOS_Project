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
        var myPoint = CGPointMake(-platformSize.width/2,0);
        leftPlatform = SKSpriteNode(texture: texture, color: color, size: platformSize);
        leftPlatform.position = myPoint;
        rightPlatform = SKSpriteNode(texture: texture, color: color, size: platformSize);
        
        myPoint = CGPointMake(size.width/4,0);
        rightPlatform.position = myPoint;
        
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size);
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        self.physicsBody?.dynamic = false;
        
        
        self.addChild(leftPlatform);
        self.addChild(rightPlatform);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}