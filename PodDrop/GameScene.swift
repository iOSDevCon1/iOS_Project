//
//  GameScene.swift
//  PodDrop
//
//  Created by Ari on 10/2/15.
//  Copyright © 2015 IOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    // different categories for items that we need to detect when theres a
    // contact between them
    let podCategory:        UInt32 = 1 << 0
    let obstacleCategory:   UInt32 = 1 << 1
    let platformCategory:   UInt32 = 1 << 2
    let pfBoundaryCategory: UInt32 = 1 << 3
    
    var background: SKSpriteNode!
    var pod: SKSpriteNode!
    
    required init(coder aDecoder: NSCoder){
        fatalError("NSCoder not supported!")
    }
    
    override init(size:CGSize){
        super.init(size:size)
        
        // we want only the pod to be affected by gravity so we can just
        // apply a force to the pod.
        //self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        // for now this scene will detect contact between different categories
        self.physicsWorld.contactDelegate = self;
        
        addBoundaries(size);
        setBackground(size, imageNamed: "milkyWay");
        addPlatforms(size);
        addPod(size);

    }
    
    func addPod(canvasSize: CGSize){
        //adding ball to view
        let pod = SKSpriteNode(imageNamed: "pod.png")
        pod.position = CGPoint(x: canvasSize.width/2, y: canvasSize.height)
        pod.size.height = canvasSize.height/6
        pod.size.width = canvasSize.height/12
        pod.physicsBody = SKPhysicsBody(circleOfRadius: pod.size.width/2)
        pod.physicsBody?.collisionBitMask = pfBoundaryCategory;
        pod.physicsBody?.linearDamping = 0;
         pod.physicsBody?.friction = 0;
         pod.physicsBody?.restitution = 0;
        
        let gravity = CGVectorMake(0, -8);
        pod.physicsBody?.applyImpulse(gravity);
        
        addChild(pod);  
    }
    
    func setBackground(canvasSize: CGSize, imageNamed: String){
        if(background==nil){
            background = SKSpriteNode(imageNamed:imageNamed);
            addChild(background);
        } else {
            background.texture = SKTexture(imageNamed: imageNamed);
        }
        background.size = canvasSize;
        background.position = CGPoint(x: canvasSize.width/2, y: canvasSize.height/2);
        background.alpha = 0.1;
        
        
    }
    
    // These SpriteNode boundaries are used primarily to detect
    // collisions with the edges of the screen.
    func addBoundaries(size: CGSize){
        let categories: [UInt32] = [pfBoundaryCategory, podCategory]
        
        // Initialize boundaries with given name, parent size, and bitmask categories
        
        // Position bottomBoundary at y: 0.0
        let bottomBoundary = Boundary(name: "bottom", size: size, categories: categories)
        bottomBoundary.anchorPoint = CGPointMake(0.5, 0.0); //bottom center anchor
        bottomBoundary.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame));
        
        // Position topBoundary at y: 1.0
        let topBoundary = Boundary(name: "top", size: size, categories: categories)
        topBoundary.anchorPoint = CGPointMake(0.5, 1.0); //top center anchor
        topBoundary.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));

        
        addChild(bottomBoundary)
        addChild(topBoundary)
    }

    
    func addPlatforms( canvasSize: CGSize ){
        //let myVector = CGVectorMake(0, 20);
        let moveUp = SKAction.moveToY(size.height, duration: 10);
        let numberOfPlatforms = CGFloat(4);
        for(var i = CGFloat(0); i<numberOfPlatforms; i++){
            let platform = Platform(texture:nil, color:UIColor.whiteColor(), size: CGSize.init(width: canvasSize.width, height: canvasSize.height/42));
            
            platform.position = CGPoint(x:CGFloat.init(arc4random())%(canvasSize.width/3), y:i*canvasSize.height/numberOfPlatforms)
            
            //platform.position = CGPoint(x: 30, y: 0)
            platform.runAction(moveUp);
            addChild(platform)
        }
        
        
    
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}