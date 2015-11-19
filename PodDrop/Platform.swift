//
//  Platform.swift
//  PodDrop
//
//  Created by Pablo Arango on 10/13/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Platform: Scrollable {
    
    static let HORIZONTAL_GAP:CGFloat = 45;
    
    var leftPlatform: SKShapeNode!
    var rightPlatform: SKShapeNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, position: CGPoint, scrollSpeed: CGFloat) {
        super.init(texture: texture, color: color, size: size, position: position, scrollSpeed: scrollSpeed)
        
        var platformSize = size;
        platformSize.width = (size.width-Platform.HORIZONTAL_GAP)/2;
       
        // LEFT PLATFORM SETUP
        self.leftPlatform = SKShapeNode(rectOfSize:platformSize)
        self.leftPlatform.fillColor = color;
        self.leftPlatform.strokeColor = color;
        self.leftPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: platformSize);
        self.leftPlatform.physicsBody?.dynamic = false;
        self.leftPlatform.position.y = position.y;
        
        // RIGHT PLATFORM SETUP
        self.rightPlatform = SKShapeNode(rectOfSize:platformSize)
        self.rightPlatform.fillColor = color;
        self.rightPlatform.strokeColor = color;
        self.rightPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: platformSize);
        self.rightPlatform.physicsBody?.dynamic = false;
        self.rightPlatform.position.y = position.y
        self.rightPlatform.position.x = size.width - platformSize.width/2
        
        self.addChild(leftPlatform);
        self.addChild(rightPlatform);
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}