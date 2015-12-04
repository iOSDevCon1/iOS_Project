//
//  ExitSceneButton.swift
//  PodDrop
//
//  Created by Ari on 12/4/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class ExitSceneButton: SKLabelNode {
    
    override init(fontNamed fontName: String?) {
        super.init()
        self.text = "MAIN MENU"
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let this_scene = self.scene as! GameOverScene
        let scene = this_scene.game
        scene.toMainMenu()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}