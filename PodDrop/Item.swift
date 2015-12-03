//
//  ConsumableItem.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/14/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Item:Scrollable{

    var myGameScene: GameScene!
    var pod: Pod!;
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
        super.init(texture: texture, color: color, size: size, position: position, scrollSpeed: scrollSpeed);
        
        self.myGameScene = gameScene
        let radius = self.size.width/2;
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.collisionBitMask = 0;
        self.physicsBody?.categoryBitMask = Category.item;
        self.physicsBody!.contactTestBitMask = Category.pod;
        self.physicsBody?.dynamic = false;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchedBy(pod:Pod){
        self.pod = pod;
        pod.addItem(self);
    }
    
    func use(){
        self.pod.removeItem(self)
    }

}
