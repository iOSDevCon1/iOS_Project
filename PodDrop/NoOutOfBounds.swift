//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class NoOutOfBounds: Item {

    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
        let myTexture = SKTexture(imageNamed: "xyReversal")
        super.init(texture: myTexture, color: UIColor.blackColor(), size: size, position: position, scrollSpeed: scrollSpeed, gameScene: gameScene);

    }

    override func touchedBy(pod: Pod) {
        self.use();
    }

    override func use() {
        print("NoOutOfBounds")

        performSelector("end", withObject: nil, afterDelay: 2)
    }

    override func end(){
        print("NoOutOfBounds end")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
