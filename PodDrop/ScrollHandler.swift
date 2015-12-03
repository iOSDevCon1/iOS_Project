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
    private var scrollables=[Platform]();
    private var gameScene: GameScene;
    static let SCROLL_SPEED:CGFloat = 5;
    static let SCROLLABLE_GAP:CGFloat = 100;
    static let NUMBER_OF_PLATFORMS = 8; //MIN 1
    
    init(gameScene:GameScene){
        //In case we decide to increment score based on platforms passed we can do it this way
        self.gameScene = gameScene;
        let canvasSize = gameScene.size;
        
        self.scrollables.append(Platform(texture:nil,
            color:UIColor.whiteColor(),
            size: CGSize(width: canvasSize.width, height: canvasSize.height/32),
            position:CGPoint(x: canvasSize.width/2,y: 0),
            scrollSpeed:ScrollHandler.SCROLL_SPEED
        ));
        
        self.scrollables[0].position.y += 200;
        
        self.gameScene.addChild(scrollables[0]);
        
        for i in 1..<ScrollHandler.NUMBER_OF_PLATFORMS{
            self.scrollables.append(
                Platform(
                    texture:nil,
                    color:UIColor.whiteColor(),
                    size: CGSize(width: canvasSize.width, height: canvasSize.height/32),
                    position:CGPoint(
                        x: canvasSize.width/2,
                        y: scrollables[i-1].getTailY()-ScrollHandler.SCROLLABLE_GAP
                    ),
                    scrollSpeed:ScrollHandler.SCROLL_SPEED
                )
            );
            self.gameScene.addChild(scrollables[i]);
        }
    
        
    }
    
    func update(currentTime: CFTimeInterval){
        for scrollable in scrollables {
            scrollable.update(currentTime);
        }
        
        if(scrollables[0].isScrolledUp){
            scrollables[0].reset(
                scrollables[scrollables.endIndex-1].getTailY() - ScrollHandler.SCROLLABLE_GAP
            );
        }
        
        for i in 1..<scrollables.endIndex {
            if(scrollables[i].isScrolledUp){
                scrollables[i].reset(
                    scrollables[i-1].getTailY() - ScrollHandler.SCROLLABLE_GAP
                );
            }
        }
        
    }
    
    func stop(){
        for scrollable in scrollables {
            scrollable.stop();
        }
    }
    
    

}
