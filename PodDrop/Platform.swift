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
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, position: CGPoint, scrollSpeed: CGFloat) {
        
        
        self.max = (size.width - Platform.HORIZONTAL_GAP) / 2 - 20;
        self.center = CGFloat(arc4random_uniform(UInt32(max * 2 ))) - max;
        
       
        // LEFT PLATFORM SETUP
        self.leftPlatform = SKShapeNode(rectOfSize:size)
        self.leftPlatform.fillColor = color;
        self.leftPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        self.leftPlatform.physicsBody?.dynamic = false;
        
        
        //print(platformSize.width)
        
        
        // RIGHT PLATFORM SETUP
        self.rightPlatform = SKShapeNode(rectOfSize:size)
        self.rightPlatform.fillColor = color;
        self.rightPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        self.rightPlatform.physicsBody?.dynamic = false;
        
                
        super.init(texture: texture, color: UIColor.clearColor(), size: size, position: position, scrollSpeed: scrollSpeed)
        
        self.addChild(leftPlatform);
        self.addChild(rightPlatform);
        
        let centerSize = CGSize(width: Platform.HORIZONTAL_GAP, height: size.height)
        let center = SKShapeNode(rectOfSize: centerSize)
        center.fillColor = UIColor.clearColor();
        center.strokeColor = UIColor.clearColor();
        center.position.x = 0;
        
        self.addChild(center)
        
        
    }
    
    override func reset(newY: CGFloat) {
        super.reset(newY);
        
        self.center = CGFloat(arc4random_uniform(UInt32(max * 2 ))) - max;
        print(self.center);
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        super.update(currentTime);
        
        self.leftPlatform.position.x = center - self.size.width/2-Platform.HORIZONTAL_GAP/2;
        
        self.rightPlatform.position.x = center + self.size.width/2+Platform.HORIZONTAL_GAP/2;
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}