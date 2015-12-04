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
    var items=[Item]();
    var gameScene: GameScene;

    var SCROLL_SPEED:CGFloat = 2;
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
            scrollSpeed:self.SCROLL_SPEED
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
                    scrollSpeed:self.SCROLL_SPEED
                )
            );
            self.gameScene.addChild(platforms[i]);
        }
    
        
    }

    //Testing for itemPP
    func addItem( newY: CGFloat ){


        //adding ball to view

        let itemSz = CGSize(width: self.gameScene.size.height/16, height: self.gameScene.size.height/16)

        let randX = CGFloat(arc4random_uniform( UInt32(gameScene.size.width - itemSz.width * 2) ) ) + itemSz.width;

        let itemPos = CGPoint(x: randX, y:newY);

        items.append(
            ItemFactory.getRandom(
                itemSz,
                position: itemPos,
                scrollSpeed: self.SCROLL_SPEED,
                scroller: self
            )
        )

        self.gameScene.addChild(items[items.endIndex-1]);
    }
    
    func update(currentTime: CFTimeInterval){

        for item:Item in items {
            item.update(currentTime,newScrollSpeed: self.SCROLL_SPEED);
            if(item.isScrolledUp){
                item.removeFromParent();
                
                if(!item.taken){
                    items.removeAtIndex(items.indexOf(item)!);
                }
            }
        }
        
        for platform:Scrollable in platforms {
            platform.update(currentTime, newScrollSpeed: self.SCROLL_SPEED);
        }
        
        if(platforms[0].isScrolledUp){
            platforms[0].reset(
                platforms[platforms.endIndex-1].getTailY() - SCROLLABLE_GAP
            );
            
            self.increaseSpeedBy(0.2);
            self.gameScene.score += 5;
            self.gameScene.setScoreBoard(String(self.gameScene.score))
            
            addItem(platforms[0].getTailY() - SCROLLABLE_GAP / 2);
        }
        
        for i in 1..<platforms.endIndex {
            if(platforms[i].isScrolledUp){
                platforms[i].reset(
                    platforms[i-1].getTailY() - SCROLLABLE_GAP
                );
                
                self.increaseSpeedBy(0.2);
                self.gameScene.score += 5;
                self.gameScene.setScoreBoard(String(self.gameScene.score))
            }
        }
        
    }

    func increaseSpeedBy( delta: CGFloat){
        self.SCROLL_SPEED = self.SCROLL_SPEED + delta
    }

    func setSpeed( speed: CGFloat){
        self.SCROLL_SPEED = speed
    }
    
    func stop(){
        for platform:Scrollable in platforms {
            platform.stop();
        }
    }
    
    func endAllItems(){
        for item in items {
            
            if item is Invincibility {
            } else{
            item.end()
            }
        }
    }
}
