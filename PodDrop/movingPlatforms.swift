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

        performSelector("end", withObject: nil, afterDelay: 2)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
