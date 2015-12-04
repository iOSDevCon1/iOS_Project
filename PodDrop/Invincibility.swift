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

        init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
            let myTexture = SKTexture(imageNamed: "dragon_ball")
            super.init(texture: myTexture, color: UIColor.blackColor(), size: size, position: position, scrollSpeed: scrollSpeed, gameScene: gameScene);
        }
        
        override func touchedBy(pod: Pod) {
            self.use();
        }
        
        override func use() {
            myGameScene.podInvinciable = true
            myGameScene.scroller.endAllItems()
            performSelector("end", withObject: nil, afterDelay: 30)
            
        }
        
        override func end(){
            print("end Invince")
            myGameScene.podInvinciable = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
