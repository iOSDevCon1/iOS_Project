//
//  GameViewController.swift
//  TestGame
//
//  Created by Pablo Arango on 10/10/15.
//  Copyright (c) 2015 IOSDevCon1. All rights reserved.
//


import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        // Configure the view.
        
        if let skView = view as? SKView{
            skView.multipleTouchEnabled = false
            
            
            if(skView.scene==nil){
                // Create and configure the scene.
                scene = GameScene(size: skView.bounds.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                
                // Present the scene.
                skView.presentScene(scene)
            }
        }
        
    }
  
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
