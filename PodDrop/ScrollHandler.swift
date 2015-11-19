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
    static let SCROLL_SPEED:CGFloat = 2;
    static let PLATFORM_GAP:CGFloat = 80;
    static let NUMBER_OF_PLATFORMS = 8; //MIN 1
    
    init(gameScene:GameScene){
        //In case we decide to increment score based on platforms passed we can do it this way
        self.gameScene = gameScene;
        let canvasSize = gameScene.size;
        
        self.platforms.append(Platform(texture:nil,
            color:UIColor.whiteColor(),
            size: CGSize(width: canvasSize.width, height: canvasSize.height/32),
            position:CGPoint(x: canvasSize.width/2,y: 0),
            scrollSpeed:ScrollHandler.SCROLL_SPEED
        ));
        
        self.platforms[0].position.y += 200;
        
        self.gameScene.addChild(platforms[0]);
        
        for i in 1..<ScrollHandler.NUMBER_OF_PLATFORMS{
            self.platforms.append(Platform(texture:nil,
                color:UIColor.whiteColor(),
                size: CGSize(width: canvasSize.width, height: canvasSize.height/32),
                position:CGPoint(x: canvasSize.width/2, y: platforms[i-1].getTailY()-ScrollHandler.PLATFORM_GAP ),
                scrollSpeed:ScrollHandler.SCROLL_SPEED
            ));
            self.gameScene.addChild(platforms[i]);
        }
    
        
    }
    
    func update(currentTime: CFTimeInterval){
        for platform in platforms {
            platform.update(currentTime);
        }
        
        if(platforms[0].isScrolledUp){
            platforms[0].reset(platforms[platforms.endIndex-1].getTailY() - ScrollHandler.PLATFORM_GAP);
        }
        
        for i in 1..<platforms.endIndex {
            if(platforms[i].isScrolledUp){
                platforms[i].reset(platforms[i-1].getTailY() - ScrollHandler.PLATFORM_GAP);
            }
        }
        
    }
    
    func stop(){
        
        for platform in platforms {
            platform.stop();
        }
    }
    
    

}
