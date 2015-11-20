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
    
    var leftPlatform: SKShapeNode!
    var rightPlatform: SKShapeNode!
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        let platformColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.6)
        let platformSize = CGSize(width: size.width, height: size.height);

        
        // LEFT PLATFORM SETUP
        var myPoint = CGPointMake(0,0);
        var myPath = CGPathCreateWithRoundedRect(CGRect(origin: myPoint, size: platformSize), 4, 4, nil)
        leftPlatform = SKShapeNode(path: myPath)
        leftPlatform.fillColor = platformColor
        leftPlatform.strokeColor = platformColor
        leftPlatform.physicsBody = SKPhysicsBody(polygonFromPath: myPath)
        leftPlatform.physicsBody?.dynamic = false;
        
        
        // RIGHT PLATFORM SETUP
        myPoint = CGPointMake(platformSize.width + 100,0);
        myPath = CGPathCreateWithRoundedRect(CGRect(origin: myPoint, size: platformSize), 4, 4, nil)
        rightPlatform = SKShapeNode(path: myPath)
        rightPlatform.fillColor = platformColor
        rightPlatform.strokeColor = platformColor
        rightPlatform.physicsBody = SKPhysicsBody(polygonFromPath: myPath)
        rightPlatform.physicsBody?.dynamic = false;
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size);
        
        self.name = "platform"
        self.addChild(leftPlatform);
        self.addChild(rightPlatform);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}