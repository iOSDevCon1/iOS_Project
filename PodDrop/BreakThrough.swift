//
//  BreakThrough.swift
//  PodDrop
//
//  Created by Ari on 12/4/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class BreakThrough: Item {
    
    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        //let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: nil, color: UIColor.redColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        
        self.name = "Break Through"
    }
    
    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use();
    }
    
    override func use() {
        super.use();
        pod.startBreakThrough()
        performSelector("end", withObject: nil, afterDelay: 7)
        
    }
    
    override func end(){
        pod.stopBreakThrough()
        myScroller.gameScene.podInvincible = false
        super.end();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}