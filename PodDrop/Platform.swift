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
    var center:CGFloat!
    var max:CGFloat
    var blurNode : SKEffectNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, position: CGPoint, scrollSpeed: CGFloat) {
        
        
        self.max = (size.width - Platform.HORIZONTAL_GAP) / 2 - 20;
        self.center = CGFloat(arc4random_uniform(UInt32(max * 2 ))) - max;
        
        let platformPhysicsBody = SKPhysicsBody(rectangleOfSize: size);
        //platformPhysicsBody.linearDamping = 0;
        //platformPhysicsBody.restitution = 0;
        platformPhysicsBody.friction = 1;
        platformPhysicsBody.dynamic = false;
        
       
        // LEFT PLATFORM SETUP
        self.leftPlatform = SKShapeNode(rectOfSize:size)
        self.leftPlatform.fillColor = color;
        self.leftPlatform.physicsBody = platformPhysicsBody
        
        
        // RIGHT PLATFORM SETUP
        self.rightPlatform = SKShapeNode(rectOfSize:size)
        self.rightPlatform.fillColor = color;
        self.rightPlatform.physicsBody = platformPhysicsBody.copy() as? SKPhysicsBody
        
                
        super.init(texture: texture, color: UIColor.clearColor(), size: size, position: position, scrollSpeed: scrollSpeed)
        
        blurNode = SKEffectNode()
        blurNode.shouldEnableEffects = true
        let blur = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": 25.0])
        //blurNode.filter = blur
    
        blurNode.addChild(leftPlatform);
        blurNode.addChild(rightPlatform);
        
        self.addChild(blurNode)
        
        self.leftPlatform.position.x = center - self.size.width / 2 - Platform.HORIZONTAL_GAP / 2;
        
        self.rightPlatform.position.x = center + self.size.width / 2 + Platform.HORIZONTAL_GAP / 2;
        
        
    }
    
    override func reset(newY: CGFloat) {
        super.reset(newY);
        
        self.center = CGFloat(arc4random_uniform(UInt32(max * 2 ))) - max;
        
        self.leftPlatform.position.x = center - self.size.width / 2 - Platform.HORIZONTAL_GAP / 2;
        
        self.rightPlatform.position.x = center + self.size.width / 2 + Platform.HORIZONTAL_GAP / 2;
        
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
