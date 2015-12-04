//
//  SlowDown.swift
//  PodDrop
//
//  Created by Ari on 12/4/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class SlowDown: Item {
    
    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        //let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: nil, color: UIColor.redColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        
        self.name = "Slow Down"
    }
    
    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use();
    }
    
    override func use() {
        super.use();
        myScroller.SCROLL_SPEED = myScroller.SCROLL_SPEED * 0.80
        myScroller.endAllItems()
        
    }
    
    override func end(){
        super.end();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}