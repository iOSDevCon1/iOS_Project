//
//  ScrollHandler.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/19/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class ScrollHandler {
    private var platforms=[Platform]();
    private var gameScene: GameScene;
    static let SCROLL_SPEED = -59;
    static let PLATFORM_GAP = 20;
    static let NUMBER_OF_PLATFORMS = 7; //MIN 1
    
    init(gameScene:GameScene){
        //In case we decide to increment score based on platforms passed we can do it this way
        self.gameScene = gameScene;
        let canvasSize = gameScene.size;
        
        self.platforms[0] = Platform(texture:nil, color:UIColor.whiteColor(), size: CGSize.init(width: canvasSize.width, height: canvasSize.height/43));
        
        for i in 1..<ScrollHandler.NUMBER_OF_PLATFORMS{
            self.platforms[i] = Platform(texture:nil, color:UIColor.whiteColor(), size: CGSize.init(width: canvasSize.width, height: canvasSize.height/43));
            self.gameScene.addChild(platforms[i]);
        }
        
        //platform.position = CGPoint(x:CGFloat.init(arc4random())%(canvasSize.width/2)-canvasSize.width, y:0)
        
        
        
    }

}
