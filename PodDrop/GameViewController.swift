//
//  GameViewController.swift
//  TestGame
//
//  Created by Pablo Arango on 10/10/15.
//  Copyright (c) 2015 IOSDevCon1. All rights reserved.
//


import UIKit
import SpriteKit

class GameViewController: UIViewController, PodDropDelegate {
    var scene: GameScene!
    var podDrop: PodDrop!
    
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
                
                podDrop = PodDrop()
                podDrop.delegate = self
                podDrop.beginGame()
                
                // Present the scene.
                skView.presentScene(scene)
            }
        }
        
    }
  
    func gameDidBegin(podDrop: PodDrop) {
        
    }
    
    func gameDidEnd(podDrop: PodDrop) {
        
    }
    
    func waveDidBegin(dropDrop: PodDrop) {
        
    }
    
    func waveDidEnd(podDrop: PodDrop) {
        
    }
    
    func podDidGrabItem(dropDrop: PodDrop) {
        
    }
    
    func podDidTouchBounds(dropDrop: PodDrop) {
        
    }
    
    func gameDidLevelUp(dropDrop: PodDrop) {
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
