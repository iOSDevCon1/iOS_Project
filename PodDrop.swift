//
//  PodDrop.swift
//  PodDrop
//
//  Created by Ari on 10/25/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation



let PointsPerSecond = 5
let LevelThreshold = 100

protocol PodDropDelegate {
    // Invoked when the current wave ends
    func waveDidEnd(podDrop: PodDrop)
    
    // Invoked when entire game ends
    func gameDidEnd(podDrop: PodDrop)
    
    // Invoked immediately after a new wave has begun
    func waveDidBegin(dropDrop: PodDrop)
    
    // Invoked when entire game is beginning
    func gameDidBegin(podDrop: PodDrop)
    
    // Invoked when the falling pod has gone out of bounds
    func podDidTouchBounds(dropDrop: PodDrop)
    
    // Invoked when the pod grabs item
    func podDidGrabItem(dropDrop: PodDrop)
    
    // Invoked when the game has reached a new level
    func gameDidLevelUp(dropDrop: PodDrop)
}


// The class that encapsulates the game logic
class PodDrop{
    var delegate:PodDropDelegate?
    
    var score:Int
    var wave: Int
    
    init() {
        score = 0
        wave = 1
    }
    
    func startWave(){
        delegate?.waveDidBegin(self)
    }
    
    func endWave(){
        delegate?.waveDidEnd(self)
    }
    
    func beginGame(){
        delegate?.gameDidBegin(self)
    }
    
    func endGame(){
        score = 0
        wave = 1
        delegate?.gameDidEnd(self)
    }
}