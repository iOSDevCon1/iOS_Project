//
//  GameScene.swift
//  PodDrop
//
//  Created by Ari on 10/2/15.
//  Copyright © 2015 IOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Game End
    var gameEnding: Bool = false
    
    
    //ScoreBoard Variables
    var scoreLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
    var score = 0
    var disPlay = 0
    var save = 0
    
    var background: SKSpriteNode!
    var pod: Pod!
    
    let motionManager: CMMotionManager = CMMotionManager()
    
    
    var scroller: ScrollHandler!
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        motionManager.startAccelerometerUpdates()
        
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("NSCoder not supported!")
    }
    
    override init(size:CGSize){
        super.init(size:size)
        setBackground(size, imageNamed: "milkyWay")
        

        // we want only the pod to be affected by gravity so we can just
        // apply a force to the pod.
        self.physicsWorld.gravity = CGVectorMake(0, -3);
        
        // for now this scene will detect contact between different categories
        self.physicsWorld.contactDelegate = self
        addBoundaries(size)
        
        self.scroller = ScrollHandler(gameScene: self);
        addPod(size)
        
        

    }
    
    func addPod(canvasSize: CGSize){
        //adding ball to view
        let podSize = CGSize.init(width: canvasSize.height/12, height: canvasSize.height/6)
        pod = Pod(imageName: "pod.png", size: podSize)
        pod.position = CGPoint(x: canvasSize.width/2, y: canvasSize.height/2)
        addChild(pod)
    }
    
    func setBackground(canvasSize: CGSize, imageNamed: String){
        if(background==nil){
            background = SKSpriteNode(imageNamed:imageNamed)
            addChild(background)
        } else {
            background.texture = SKTexture(imageNamed: imageNamed)
        }
        background.size = canvasSize
        background.position = CGPoint(x: canvasSize.width/2, y: canvasSize.height/2)
        background.alpha = 0.6
    }
    
    
    
    // Helper method used when GameScene is dragged
    func translatePod(translation: CGPoint) {
        if let position = pod?.position{
            let newPosition = CGPoint(x: position.x + translation.x, y: position.y)
            pod?.position = newPosition
        }
    }
    
    // Transition handler for 'moving touches' on the screen
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var translation: CGPoint!
        for touch: AnyObject in touches{
            let positionInScene = touch.locationInNode(self)
            let previousPosition = touch.previousLocationInNode(self)
            translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
        }
        //let touch = (touches as? UITouch).anyObject()
       
        
        translatePod(translation)
    }
    
    
    // These SpriteNode boundaries are used primarily to detect
    // collisions with the edges of the screen.
    func addBoundaries(size: CGSize){
        
        // Initialize boundaries with given name, parent size, and bitmask categories
        
        /*
        About bottom boundary
        - position > y: 0.0
        - This has no purpse. Theoretically, the user should never
        be able to reach the bottom. For now, it will stop the pod
        from exiting the scene.
        */
        let bottomBoundary = Boundary(name: "bottom", size: size, isHorizontal: true)
        bottomBoundary.anchorPoint = CGPointMake(0.5, 0.0); //bottom center anchor
        bottomBoundary.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame))
        bottomBoundary.physicsBody?.categoryBitMask = Category.obstacle;
        
        
        /*
        About top boundary
        - position > y: 1.0
        - This boundary will be the most common cause of death for
        the user. Theoretically, the user cannot keep up with the the
        acceleration and ends up going out of bounds.
        
        */
        let topBoundary = Boundary(name: "top", size: size, isHorizontal : true)
        topBoundary.anchorPoint = CGPointMake(0.5, 1.0) //top center anchor
        topBoundary.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame))
        
        /*
        About left and right boundaries
        - position > x: 0.0, 1.0
        - These boundaries will also be the most common cause of death for
        the user. Theoretically, the user will accidently turn too quickly
        and touch the side edges.
        
        */
        let leftBoundary = Boundary(name: "left", size: size, isHorizontal : false)
        leftBoundary.anchorPoint = CGPointMake(0.0, 0.5) //left center anchor
        leftBoundary.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMidY(self.frame));
        let rightBoundary = Boundary(name: "right", size: size, isHorizontal : false)
        rightBoundary.anchorPoint = CGPointMake(1.0, 0.5) //right center anchor
        rightBoundary.position = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame))
        
        
        addChild(bottomBoundary)
        addChild(topBoundary)
        addChild(leftBoundary)
        addChild(rightBoundary)
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        self.scroller.update(currentTime);
        
        //displayScore
        score = Int(currentTime)

        if(save != score){
            save = score
            disPlay += 1
            //print(disPlay)
            self.setScoreBoard(String(disPlay))
            //self.scoreLabel.removeFromSuperview()
        }
        
        processUserMotionForUpdate(currentTime)
    }
    
    //pod moving left and right
    func processUserMotionForUpdate(currentTime: CFTimeInterval) {
        if let data = motionManager.accelerometerData {

            pod.physicsBody!.applyForce(CGVectorMake(40.0*CGFloat(data.acceleration.x),0))
        }
    }
    
    func setScoreBoard(value:String){
        scoreLabel.center = CGPointMake(160, 284)
        scoreLabel.textAlignment = NSTextAlignment.Center
        scoreLabel.text = value
        scoreLabel.textColor = UIColor.whiteColor()
        self.view!.addSubview(scoreLabel)
    }
    
    func endGame() {
        // temp game ending stuff
        if !self.gameEnding {
            
            self.gameEnding = true
            
            
            self.motionManager.stopAccelerometerUpdates()
            
            
            let gameOverScene: GameOverScene = GameOverScene(size: self.size)
            
            view!.presentScene(gameOverScene, transition: SKTransition.doorsOpenHorizontalWithDuration(1.0))
        }
    }
}
