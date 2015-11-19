//
//  Scrollable.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/19/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Scrollable:SKSpriteNode {

    var velocity:CGFloat;
    var isScrolledUp:Bool;
    var lastTime:NSTimeInterval;
   
    init(texture: SKTexture?, color: UIColor, size: CGSize, position:CGPoint, scrollSpeed:CGFloat) {
        
        self.velocity = scrollSpeed;
        self.isScrolledUp = false;
        self.lastTime = NSTimeInterval();
        super.init(texture: texture, color: color, size: size);
        self.position = position;
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(currentTime: CFTimeInterval){
        if(currentTime - lastTime > 0.05){
            
            self.position.y += velocity;
            lastTime = currentTime;
        }
        
        if(position.y-size.height > self.scene?.size.height){
            self.isScrolledUp = true;
        }
    
    }
    
    func reset(newY:CGFloat){
        self.position.y = newY;
        self.isScrolledUp = false;
    }
    
    func stop(){
        self.velocity = 0;
    }
    
    func start(velocity: CGFloat){
        self.runAction(SKAction.repeatActionForever(SKAction.moveByX(0, y:velocity, duration: 1)))
        self.velocity = velocity;
    }
    
    func getTailY() -> CGFloat{
        return self.position.y-self.size.height
    
    }


}
