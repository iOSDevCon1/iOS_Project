//
//  Multiply.swift
//  PodDrop
//
//  Created by Ari on 12/4/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Multiply: Item {
    
    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: myTexture, color: UIColor.redColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        
        self.name = "Multiply"
    }
    
    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use();
    }
    
    override func use() {
        super.use();
        myScroller.gameScene.addPod(myScroller.gameScene.size)
        performSelector("end", withObject: nil, afterDelay: 3)
    }
    
    override func end(){
        super.end();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}