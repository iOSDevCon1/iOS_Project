//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class MovingPlatforms: Item {

    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
        //let myTexture = SKTexture(imageNamed: "xyReversal")
        super.init(texture: nil, color: UIColor.whiteColor(), size: size, position: position, scrollSpeed: scrollSpeed, gameScene: gameScene);

    }

    override func touchedBy(pod: Pod) {
        self.use();
    }

    override func use() {
        print("movingPlatforms")

        performSelector("end", withObject: nil, afterDelay: 2)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
