//
//  GameOverScene.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/19/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import UIKit
import SpriteKit
import Parse

class GameOverScene: SKScene {
    
    // Private GameScene Properties
    
    var contentCreated = false
    var game: GameScene!
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMoveToView(view: SKView) {
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
        let button = ExitSceneButton(fontNamed: "Courier")
        button.userInteractionEnabled = true
        button.position = CGPoint(x: view.frame.width/2,y: view.frame.height - 100)
        self.addChild(button)
    }
    
    func createContent() {
        
        
        let gameOverLabel = SKLabelNode(fontNamed: "Courier")
        gameOverLabel.fontColor = SKColor.whiteColor()
        gameOverLabel.position = CGPointMake(self.size.width/2, 2.0 / 3.0 * self.size.height);
        if (game.score > PFUser.currentUser()?.objectForKey("highScore") as! Int){
            gameOverLabel.text = "New High Score!"
            gameOverLabel.fontSize = 40
        }else{
            gameOverLabel.text = "Game Over!"
            gameOverLabel.fontSize = 50
        }
        
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Courier")
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.whiteColor()
        scoreLabel.text = "\(game.score)"
        scoreLabel.position = CGPointMake(self.size.width/2, 2.0 / 4.0 * self.size.height);
        
        self.addChild(scoreLabel)
        
        let tapLabel = SKLabelNode(fontNamed: "Courier")
        tapLabel.fontSize = 25
        tapLabel.fontColor = SKColor.whiteColor()
        tapLabel.text = "(Tap to Play Again)"
        tapLabel.position = CGPointMake(self.size.width/2, 1.0/3.0 * self.size.height);
        
        self.addChild(tapLabel)
        
        // black space color
        self.backgroundColor = SKColor.blackColor()
        
        let this_user = PFUser.currentUser()
        var user_high_score: Int
        user_high_score = Int((this_user?.objectForKey("highScore"))! as! NSNumber)
        if (game.score > user_high_score){
            this_user?.setObject(game.score, forKey: "highScore")
            this_user!.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                    print("score has been saved")
                } else {
                    // There was a problem, check error.description
                    print("error saving score")
                }
            }
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = .AspectFill
        
        self.view!.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
        
    }
}

