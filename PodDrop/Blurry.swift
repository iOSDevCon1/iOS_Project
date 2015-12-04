//
//  Blurry.swift
//  PodDrop
//
//  Created by Hugh A. Miles on 12/3/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Blurry: Item {
    
    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
        let myTexture = SKTexture(imageNamed: "dragon_ball")
        super.init(texture: myTexture, color: UIColor.blackColor(), size: size, position: position, scrollSpeed: scrollSpeed, gameScene: gameScene);
    }
    
    override func touchedBy(pod: Pod) {
        self.use();
    }
    
    override func use() {
        let platforms = myGameScene.scroller.platforms
//        for platform:Platform in platforms {
//            platform.blurNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": 75.0])
//        }

        performSelector("end", withObject: nil, afterDelay: 30)
        
    }
    
    override func end(){
        let platforms = myGameScene.scroller.platforms
//        for platform:Platform in platforms {
//            platform.blurNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": 25.0])
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
