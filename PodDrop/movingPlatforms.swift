//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class MovingPlatforms: Item {

    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        //let myTexture = SKTexture(imageNamed: "xyReversal")
        super.init(texture: nil, color: UIColor.whiteColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        self.name = "MovingPlatforms"

    }

    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use();
    }

    override func use() {
        super.use();
        
        let platforms = myScroller.platforms
        for platform:Platform in platforms{
            platform.shouldMoveLeftRight = true;
        }


        performSelector("end", withObject: nil, afterDelay: 10)
    }

    override func end(){
        let platforms = myScroller.platforms
        for platform:Platform in platforms{
            platform.shouldMoveLeftRight = false;
        }


        super.end();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
