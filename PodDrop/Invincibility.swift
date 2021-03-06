//
//  Invincibility.swift
//  
//
//  Created by Hugh A. Miles on 12/3/15.
//
//

import Foundation
import SpriteKit

class Invincibility: Item {

    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) {
        let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: myTexture, color: UIColor.blackColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);

        self.name = "Invincibility"
    }

    override func touchedBy(pod: Pod) {
        super.touchedBy(pod)
        self.use();
    }

    override func use() {
        super.use();

        for thisPod:Pod in myScroller.gameScene.pods{
            thisPod.invinsible = true;
        }




        myScroller.endAllItems()
        performSelector("end", withObject: nil, afterDelay: 30)

    }

    override func end(){

        for thisPod:Pod in myScroller.gameScene.pods{
            thisPod.invinsible = false;
        }

        super.end();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
