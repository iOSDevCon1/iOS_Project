//
//  GameScene.swift
//  PodDrop
//
//  Created by Ari on 10/2/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import SpriteKit


class GameScene: SKScene {
    
    required init(coder aDecoder: NSCoder){
        fatalError("NSCoder not supported!")
    }
    
    override init(size:CGSize){
        super.init(size:size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "milkyWay")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        background.alpha = 0.1
        addChild(background)
    }

    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}