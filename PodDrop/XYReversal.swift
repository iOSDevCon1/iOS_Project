//
//  xyReversal.swift
//  PodDrop
//
//  Created by Hugh A. Miles on 12/3/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class XYReversal: Item {
    
    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        let myTexture = SKTexture(imageNamed: "xyReversal")
        super.init(texture: myTexture, color: UIColor.blackColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        self.name = ("XYReversal")
        
    }
    
    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use()
    }
    
    override func use() {
        super.use()
        myScroller.gameScene.consumedReversal = true

        
        performSelector("end", withObject: nil, afterDelay: 2)
        
    }
    
    override func end(){
        myScroller.gameScene.consumedReversal = false
        super.end()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
