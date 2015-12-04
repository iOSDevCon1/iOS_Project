//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class NoOutOfBounds: Item {

    var leftBoundary:SKShapeNode!;
    var rightBoundary:SKShapeNode!;

    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        //let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: nil, color: UIColor.redColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        self.name = "NoOutOfBounds"
    }

    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use();
    }

    override func use() {
        super.use();

        var boundarySize = self.myScroller.gameScene.size;

        boundarySize.width = CGFloat(3);

        leftBoundary = SKShapeNode(rectOfSize: boundarySize);
        rightBoundary = SKShapeNode(rectOfSize: boundarySize);


        leftBoundary.position.y = myScroller.gameScene.size.height/2;
        leftBoundary.position.x = 1;

        rightBoundary.position.y = myScroller.gameScene.size.height/2;
        rightBoundary.position.x = myScroller.gameScene.size.width - 1;

        myScroller.gameScene.addChild(leftBoundary);
        myScroller.gameScene.addChild(rightBoundary);

        performSelector("end", withObject: nil, afterDelay: 2)
    }

    override func end(){

        leftBoundary.removeFromParent();
        rightBoundary.removeFromParent();

        super.end();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
