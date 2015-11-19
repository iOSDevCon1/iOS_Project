//
//  Boundary.swift
//  PodDrop
//
//  Created by Ari on 10/17/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Boundary: SKSpriteNode {
    
    init(name: String, size: CGSize, isHorizontal: Bool) {
        
        let boundarySize: CGSize
        
        if (isHorizontal){
            boundarySize = CGSizeMake(size.width, size.height * 0.05); //5% of scene height, 100% of width
        }else{
            boundarySize = CGSizeMake(size.width * 0.01, size.height); //1% of scene width, 100% of height
        }
    
        super.init(texture: nil, color: UIColor.blackColor(), size: boundarySize)
        
        // Suffix the name with 'Boundary'
        self.name = name + "Boundary"
        
        // Simple physics body without gravity or motion
        self.physicsBody = SKPhysicsBody(rectangleOfSize: boundarySize)
        
        self.physicsBody!.dynamic = false;
        self.physicsBody!.categoryBitMask = Category.boundary;
        self.physicsBody!.collisionBitMask = Category.pod;
        self.physicsBody!.contactTestBitMask = Category.pod;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}