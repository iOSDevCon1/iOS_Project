//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class NoOutOfBounds: Item {

    var leftBoundary:SKShapeNode!;
    var rightBoundary:SKShapeNode!;

    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
        //let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: nil, color: UIColor.redColor(), size: size, position: position, scrollSpeed: scrollSpeed, gameScene: gameScene);

    }

    override func touchedBy(pod: Pod) {
        self.use();
    }

    override func use() {
        print("NoOutOfBounds")

        var boundarySize = myGameScene.size;

        boundarySize.width = CGFloat(3);

        leftBoundary = SKShapeNode(rectOfSize: boundarySize);
        rightBoundary = SKShapeNode(rectOfSize: boundarySize);


        leftBoundary.position.y = myGameScene.size.height/2;
        leftBoundary.position.x = 1;

        rightBoundary.position.y = myGameScene.size.height/2;
        rightBoundary.position.x = myGameScene.size.width - 1;

        myGameScene.addChild(leftBoundary);
        myGameScene.addChild(rightBoundary);

        performSelector("end", withObject: nil, afterDelay: 2)
    }

    override func end(){

        leftBoundary.removeFromParent();
        rightBoundary.removeFromParent();

        print("NoOutOfBounds end")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
