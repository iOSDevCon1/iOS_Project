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
    private var items=[Item]();
    private var gameScene: GameScene;

    static let SCROLL_SPEED:CGFloat = 5;
    static let NUMBER_OF_PLATFORMS = 4; //MIN 1
    let SCROLLABLE_GAP:CGFloat;
    
    init(gameScene:GameScene){
        self.gameScene = gameScene;
        let canvasSize = gameScene.size;

        SCROLLABLE_GAP = canvasSize.height / CGFloat(ScrollHandler.NUMBER_OF_PLATFORMS);
        
        self.platforms.append(Platform(texture:nil,
            color:UIColor.whiteColor(),
            size: CGSize(width: canvasSize.width, height: canvasSize.height/32),
            position:CGPoint(x: canvasSize.width/2,y: 0),
            scrollSpeed:ScrollHandler.SCROLL_SPEED
        ));
        
        self.platforms[0].position.y += 200;
        
        self.gameScene.addChild(platforms[0]);
        
        for i in 1..<ScrollHandler.NUMBER_OF_PLATFORMS{
            self.platforms.append(
                Platform(
                    texture:nil,
                    color:UIColor.whiteColor(),
                    size: CGSize(width: canvasSize.width, height: canvasSize.height/32),
                    position:CGPoint(
                        x: canvasSize.width/2,
                        y: platforms[i-1].getTailY()-SCROLLABLE_GAP
                    ),
                    scrollSpeed:ScrollHandler.SCROLL_SPEED
                )
            );
            self.gameScene.addChild(platforms[i]);
        }
    
        
    }

    //Testing for itemPP
    func addItem( newY: CGFloat ){


        //adding ball to view
        let itemPos = CGPoint(x: 100, y:newY);
        let itemSz = CGSize(width: self.gameScene.size.height/18, height: self.gameScene.size.height/18)

        items.append(Item(
                texture: SKTexture(
                imageNamed:"dragon_ball"),
                color: UIColor.blackColor(),
                size: itemSz,
                position: itemPos,
                scrollSpeed: ScrollHandler.SCROLL_SPEED)
        )

        self.gameScene.addChild(items[items.endIndex-1]);
    }
    
    func update(currentTime: CFTimeInterval){

        for item:Scrollable in items {
            item.update(currentTime);
            if(item.isScrolledUp){
                item.removeFromParent();
            }
        }
        
        for platform:Scrollable in platforms {
            platform.update(currentTime);
        }
        
        if(platforms[0].isScrolledUp){
            platforms[0].reset(
                platforms[platforms.endIndex-1].getTailY() - SCROLLABLE_GAP
            );
            addItem(platforms[0].getTailY() - SCROLLABLE_GAP / 2);
        }
        
        for i in 1..<platforms.endIndex {
            if(platforms[i].isScrolledUp){
                platforms[i].reset(
                    platforms[i-1].getTailY() - SCROLLABLE_GAP
                );
            }
        }
        
    }
    
    func stop(){
        for platform:Scrollable in platforms {
            platform.stop();
        }
    }
    
    

}
