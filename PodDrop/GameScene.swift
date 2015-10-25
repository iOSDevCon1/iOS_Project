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
    var pod: Pod!
    
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
        let podSize = CGSize.init(width: canvasSize.height/12, height: canvasSize.height/6)
        pod = Pod(imageName: "pod.png", boundaryCategory: pfBoundaryCategory, size: podSize)
        pod.position = CGPoint(x: canvasSize.width/2, y: canvasSize.height)
        
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
        
        /* 
        About bottom boundary
                - position > y: 0.0
                - This has no purpse. Theoretically, the user should never
                be able to reach the bottom. For now, it will stop the pod
                from exiting the scene.
        */
        let bottomBoundary = Boundary(name: "bottom", size: size, categories: categories, isHorizontal: true)
        bottomBoundary.anchorPoint = CGPointMake(0.5, 0.0); //bottom center anchor
        bottomBoundary.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame));
        
        
        /* 
        About top boundary
                - position > y: 1.0
                - This boundary will be the most common cause of death for
                the user. Theoretically, the user cannot keep up with the the
                acceleration and ends up going out of bounds.
        
        */
        let topBoundary = Boundary(name: "top", size: size, categories: categories, isHorizontal : true)
        topBoundary.anchorPoint = CGPointMake(0.5, 1.0); //top center anchor
        topBoundary.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));

        /*
        About left and right boundaries
                - position > x: 0.0, 1.0
                - These boundaries will also be the most common cause of death for
                the user. Theoretically, the user will accidently turn too quickly
                and touch the side edges.
        
        */
        let leftBoundary = Boundary(name: "left", size: size, categories: categories, isHorizontal : false)
        leftBoundary.anchorPoint = CGPointMake(0.0, 0.5); //left center anchor
        leftBoundary.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMidY(self.frame));
        let rightBoundary = Boundary(name: "right", size: size, categories: categories, isHorizontal : false)
        rightBoundary.anchorPoint = CGPointMake(1.0, 0.5); //right center anchor
        rightBoundary.position = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame));
        
        
        addChild(bottomBoundary)
        addChild(topBoundary)
        addChild(leftBoundary)
        addChild(rightBoundary)
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
    
    // Helper method used when GameScene is dragged
    func translatePod(translation: CGPoint) {
        if let position = pod?.position{
            let newPosition = CGPoint(x: position.x + translation.x, y: position.y)
            pod?.position = newPosition
        }
    }
    
    // Transition handler for 'moving touches' on the screen
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var translation: CGPoint!
        for touch: AnyObject in touches{
            let positionInScene = touch.locationInNode(self)
            let previousPosition = touch.previousLocationInNode(self)
            translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
        }
        //let touch = (touches as? UITouch).anyObject()
       
        
        translatePod(translation)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}