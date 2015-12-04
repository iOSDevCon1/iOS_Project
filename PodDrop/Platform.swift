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
    var centerPlatform: SKShapeNode!
    var center:CGFloat!
    var max:CGFloat
    var scored:Bool!
    var blurNode : SKEffectNode!
    var toMove:CGFloat!

    var shouldMoveLeftRight:Bool;

    override init(texture: SKTexture?, color: UIColor, size: CGSize, position: CGPoint, scrollSpeed: CGFloat) {
        
        
        self.max = (size.width - Platform.HORIZONTAL_GAP) / 2 - 20;
        self.center = CGFloat(arc4random_uniform(UInt32(max * 2 ))) - max;
        
        let platformPhysicsBody = SKPhysicsBody(rectangleOfSize: size);

        platformPhysicsBody.categoryBitMask = Category.platform;
        //platformPhysicsBody.linearDamping = 0;
        //platformPhysicsBody.restitution = 0;
        platformPhysicsBody.friction = 1;
        platformPhysicsBody.dynamic = false;
        
       
        // LEFT PLATFORM SETUP
        self.leftPlatform = SKShapeNode(rectOfSize:size)
        self.leftPlatform.fillColor = color
        self.leftPlatform.physicsBody = platformPhysicsBody
        
        
        // RIGHT PLATFORM SETUP
        self.rightPlatform = SKShapeNode(rectOfSize:size)
        self.rightPlatform.fillColor = color
        self.rightPlatform.physicsBody = platformPhysicsBody.copy() as? SKPhysicsBody

        // Center PLATFORM SETUP
        var centerSize = size
        centerSize.width = Platform.HORIZONTAL_GAP
        self.centerPlatform = SKShapeNode(rectOfSize:centerSize)
        self.centerPlatform.alpha = 0
//        self.centerPlatform.fillColor = UIColor.redColor();
        self.centerPlatform.physicsBody = SKPhysicsBody(rectangleOfSize: centerSize);
        self.centerPlatform.physicsBody?.dynamic = false
        self.centerPlatform.physicsBody?.categoryBitMask = Category.centerPlatform
        self.centerPlatform.physicsBody?.collisionBitMask = 0
        self.centerPlatform.physicsBody?.contactTestBitMask = Category.pod
        
        
        
        self.shouldMoveLeftRight = false;


        super.init(texture: texture, color: UIColor.clearColor(), size: size, position: position, scrollSpeed: scrollSpeed)

        blurNode = SKEffectNode()
        blurNode.shouldEnableEffects = true
        let blur = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": 25.0])
        //blurNode.filter = blur

        blurNode.addChild(leftPlatform);
        blurNode.addChild(rightPlatform);
        blurNode.addChild(centerPlatform)

        self.addChild(blurNode)

        self.centerPlatform.position.x = center

        self.leftPlatform.position.x = center - self.size.width / 2 - Platform.HORIZONTAL_GAP / 2;
        
        self.rightPlatform.position.x = center + self.size.width / 2 + Platform.HORIZONTAL_GAP / 2;
        
        self.scored = false;

        setToMove();


    }
    func setToMove(){
        let rando = arc4random_uniform(2);
        self.toMove = 5
        if (rando == 1) {
            self.toMove = -5;
        }
    }

    override func update(currentTime: CFTimeInterval, newScrollSpeed: CGFloat){
        super.update(currentTime, newScrollSpeed: newScrollSpeed )
        if(shouldMoveLeftRight) {
            moveLeftRight();
        }
    }

    override func reset(newY: CGFloat) {
        super.reset(newY);

        if(shouldMoveLeftRight) {
            setToMove()
        }
        
        self.scored = false;

        self.center = CGFloat(arc4random_uniform(UInt32(max * 2 ))) - max;
        
        self.centerPlatform.position.x = center

        self.leftPlatform.position.x = center - self.size.width / 2 - Platform.HORIZONTAL_GAP / 2;
        
        self.rightPlatform.position.x = center + self.size.width / 2 + Platform.HORIZONTAL_GAP / 2;
        
        
    }

    func moveLeftRight(){
        if( self.position.x > self.size.width - center - Platform.HORIZONTAL_GAP / 2){
             self.toMove = -5;
        } else if ( self.position.x < 0 - center + Platform.HORIZONTAL_GAP / 2){
            self.toMove = 5;
        }

        self.position.x += self.toMove;
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
