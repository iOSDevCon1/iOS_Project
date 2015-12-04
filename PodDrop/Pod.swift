//
//  Pod.swift
//  PodDrop
//
//  Created by Ari on 10/25/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Pod: SKSpriteNode {
    let items:ItemQueue = ItemQueue();

    init(imageName: String, size:CGSize) {
        super.init(texture: SKTexture(imageNamed: imageName), color: UIColor.clearColor(), size: size)
        
        let radius = self.size.width/2
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.categoryBitMask = Category.pod;
        self.physicsBody?.collisionBitMask = Category.boundary | Category.platform | Category.obstacle;
        //self.physicsBody?.linearDamping = 0;
        self.physicsBody?.friction = 1;
        self.physicsBody?.restitution = 0;

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchItem(itemTouched:Item){
        itemTouched.touchedBy(self);
    }
    
    
    func addItem(itemToAdd: Item){
        items.push(itemToAdd);
    }
    
    func useItem(){
        if(!items.isEmpty()){
            items.peek()!.use()
        }
        
    }
    
    func startBreakThrough(){
        self.physicsBody?.collisionBitMask = Category.boundary | Category.obstacle;
    }
    
    func stopBreakThrough(){
        self.physicsBody?.collisionBitMask = Category.boundary | Category.platform | Category.obstacle;
    }

    func removeItem(itemToRemove: Item){
        if( !items.isEmpty() && items.peek() == itemToRemove){
            items.pop();
        }
    }
}