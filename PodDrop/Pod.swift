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
        //self.physicsBody?.linearDamping = 0;
        self.physicsBody?.friction = 1;
        self.physicsBody?.restitution = 0;

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addItem(itemToAdd: Item){
        items.push(itemToAdd);
    }
    
    func useItem(itemToUse:Item?){
        if itemToUse != nil {
            itemToUse!.use(self)
        
        } else{
            if(!items.isEmpty()){
                items.peek()!.use(self)
            }
        }
    }

    func removeItem(itemToRemove: Item){
        if( items.peek() == itemToRemove){
            items.pop();
        }
    }
}