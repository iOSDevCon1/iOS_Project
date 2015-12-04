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
            //let myTexture = SKTexture(imageNamed: "dragon_ball")
            super.init(texture: nil, color: UIColor.yellowColor(), size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);

            self.name = "Invincibility"
        }
        
        override func touchedBy(pod: Pod) {
            super.touchedBy(pod)
            self.use();
        }
        
        override func use() {
            super.use();
            
            myScroller.gameScene.podInvincible = true
            myScroller.endAllItems()
            performSelector("end", withObject: nil, afterDelay: 10)
            
        }
        
        override func end(){
            myScroller.gameScene.podInvincible = false
            super.end();
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
