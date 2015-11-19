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
    
    static let HORIZONTAL_GAP:CGFloat = 100;
    
    var leftPlatform: SKShapeNode!
    var rightPlatform: SKShapeNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, position: CGPoint, scrollSpeed: CGFloat) {
        
        
        
        var platformSize = size;
        platformSize.width = (size.width-Platform.HORIZONTAL_GAP)/2;
       
        // LEFT PLATFORM SETUP
        self.leftPlatform = SKShapeNode(rectOfSize:platformSize)
        self.leftPlatform.fillColor = color;
        self.leftPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: platformSize);
        self.leftPlatform.physicsBody?.dynamic = false;
        self.leftPlatform.position.x = -platformSize.width/2-Platform.HORIZONTAL_GAP/2;
        
        //print(platformSize.width)
        
        
        // RIGHT PLATFORM SETUP
        self.rightPlatform = SKShapeNode(rectOfSize:platformSize)
        self.rightPlatform.fillColor = color;
        self.rightPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: platformSize);
        self.rightPlatform.physicsBody?.dynamic = false;
        self.rightPlatform.position.x = platformSize.width/2+Platform.HORIZONTAL_GAP/2;
                
        super.init(texture: texture, color: UIColor.clearColor(), size: size, position: position, scrollSpeed: scrollSpeed)
        
        self.addChild(leftPlatform);
        self.addChild(rightPlatform);
        
       
        let center = SKShapeNode(rectOfSize:CGSize(width: Platform.HORIZONTAL_GAP, height: size.height))
        center.fillColor = UIColor.clearColor();
        center.strokeColor = UIColor.clearColor()
        center.physicsBody = SKPhysicsBody(rectangleOfSize: platformSize);
        center.physicsBody?.dynamic = false;
        center.position.x = 0;
        
        self.addChild(center)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}