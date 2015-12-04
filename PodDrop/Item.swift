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

    var myScroller: ScrollHandler!
    var pod: Pod!;
    var taken:Bool!;
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        super.init(texture: texture, color: color, size: size, position: position, scrollSpeed: scrollSpeed);

        self.name = "Unnamed Item"
        self.myScroller = scroller
        let radius = self.size.width/2;
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.collisionBitMask = 0;
        self.physicsBody?.categoryBitMask = Category.item;
        self.physicsBody!.contactTestBitMask = Category.pod;
        self.physicsBody?.dynamic = false;
        self.taken = false;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchedBy(pod:Pod){
        self.taken = true;
        self.pod = pod;
        pod.addItem(self);
        myScroller.gameScene.itemLabel.text = self.name
    }
    
    func use(){
        if (pod != nil){
            self.pod.removeItem(self)
        }

        print(name! + " start")
    }
    
    func end(){
        print(name! + " end")
        if let i = myScroller.items.indexOf(self){
            myScroller.items.removeAtIndex(i);
        }
        myScroller.gameScene.itemLabel.text = nil
        

    }
}
