//
//  xyReversal.swift
//  PodDrop
//
//  Created by Hugh A. Miles on 12/3/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class XYReversal: Item {
    
    init(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, gameScene:GameScene) {
        let myTexture = SKTexture(imageNamed: "xyReversal")
        super.init(texture: myTexture, color: UIColor.blackColor(), size: size, position: position, scrollSpeed: scrollSpeed, gameScene: gameScene);
        
    }
    
    override func touchedBy(pod: Pod)
    {
        self.use();
    }
    
    override func use() {
        self.myGameScene.consumedReversal = true
        print("reversed")
        
        performSelector("end", withObject: nil, afterDelay: 2)
        
    }
    
    override func end(){
        self.myGameScene.consumedReversal = false;
        print("reverse end")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
