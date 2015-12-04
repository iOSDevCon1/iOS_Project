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
import Parse

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    // Gravity
    static let GRAVITY:CGFloat = -1;

    // Game End
    var gameEnding: Bool = false

    //ScoreBoard Variables
    //var scoreLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
    var score = 0
    var scoreLabel = SKLabelNode(text: String(0))
    
    var background: SKSpriteNode!
    var pod: Pod!
    
    //pod Attributes
    var consumedReversal:Bool = false

    let motionManager: CMMotionManager = CMMotionManager()
    
    var scroller: ScrollHandler!

    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        motionManager.startAccelerometerUpdates()
        scoreLabel.fontSize = 60
        scoreLabel.position = CGPointMake(view.frame.size.width/2, view.frame.size.height-100)
        self.addChild(scoreLabel)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("NSCoder not supported!")
    }
    
    override init(size:CGSize){
        super.init(size:size)
        setBackground(size, imageNamed: "milkyWay")

        // custom Gravity
        self.physicsWorld.gravity = CGVectorMake(0, GameScene.GRAVITY);

        // physics body for frame to not let object out of frame
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame);
        
        // for now this scene will detect contact between different categories
        self.physicsWorld.contactDelegate = self
        addBoundaries(size)

        self.scroller = ScrollHandler(gameScene: self);
        addPod(size)
        
        let highScore = SKLabelNode(fontNamed: "Courier")
        highScore.fontSize = 40
        highScore.fontColor = SKColor.whiteColor()
        let user_high_score = PFUser.currentUser()?.objectForKey("highScore") as! Int
        highScore.text = "High Score:\( user_high_score )"
        highScore.position = CGPointMake(size.width/4, 8.0 / 10.0 * size.height);
    }


    func addPod(canvasSize: CGSize){
        //adding ball to view
        let podSize = CGSize.init(width: canvasSize.height/15, height: canvasSize.height/15)
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


    
    // Helper method used when GameScene is touched
    func applyForceToPod(forceStrength: CGFloat) {
        if let thisPod = pod{
            if(consumedReversal){
                thisPod.physicsBody?.applyImpulse(CGVector(dx: -forceStrength, dy: 0))
            } else {
                thisPod.physicsBody?.applyImpulse(CGVector(dx: forceStrength, dy: 0))
            }
            

        }
    }
    
    // Transition handler for 'moving touches' on the screen
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var diff: CGFloat!
        for touch: UITouch in touches{
            let positionInScene = touch.locationInNode(self);
            let podPosition = pod.position;

            diff = positionInScene.x - podPosition.x;
        }

        applyForceToPod(diff/10)
    }
    
    
    // These SpriteNode boundaries are used primarily to detect
    // collisions with the edges of the screen.
    func addBoundaries(size: CGSize){
        
        // Initialize boundaries with given name, start point, and end point
        
        /*
        About bottom boundary
        - position > y: 0.0
        - This has no purpse. Theoretically, the user should never
        be able to reach the bottom. For now, it will stop the pod
        from exiting the scene.
        */
        let bottomBoundary = Boundary(
            name: "bottom",
            fromPoint: CGPointMake(0, 1),
            toPoint:CGPointMake(size.width, 1))
        
        bottomBoundary.physicsBody?.categoryBitMask = Category.obstacle;
        addChild(bottomBoundary)

        /*
        About top boundary
        - position > y: 1.0
        - This boundary will be the most common cause of death for
        the user. Theoretically, the user cannot keep up with the the
        acceleration and ends up going out of bounds.
        
        */
        let topBoundary = Boundary(
            name: "top",
            fromPoint: CGPointMake(0, size.height-1),
            toPoint:CGPointMake(size.width, size.height-1))

        addChild(topBoundary)
        
        /*
        About left and right boundaries
        - position > x: 0.0, 1.0
        - These boundaries will also be the most common cause of death for
        the user. Theoretically, the user will accidently turn too quickly
        and touch the side edges.
        
        */
        let leftBoundary = Boundary(
            name: "left",
            fromPoint: CGPointMake(1, 0),
            toPoint:CGPointMake(1, size.height))
        addChild(leftBoundary)


        let rightBoundary = Boundary(
            name: "right",
            fromPoint: CGPointMake(size.width-1, 0),
            toPoint:CGPointMake(size.width-1, size.height))

        addChild(rightBoundary)

    }


    override func update(currentTime: CFTimeInterval) {
        self.scroller.update(currentTime);
        processUserMotionForUpdate(currentTime, reversal: consumedReversal)
    }
    
    //pod moving left and right
    func processUserMotionForUpdate(currentTime: CFTimeInterval, reversal:Bool) {
        if let data = motionManager.accelerometerData {
            if(reversal){
                 pod.physicsBody!.applyForce(CGVectorMake(-80.0*CGFloat(data.acceleration.x),0))
            } else {
                pod.physicsBody!.applyForce(CGVectorMake(80.0*CGFloat(data.acceleration.x),0))
            }
        }
    }
    

    func setScoreBoard(value:String){
        scoreLabel.text = value
    }

    func endGame() {
        // temp game ending stuff
        if !self.gameEnding {

            self.gameEnding = true


            self.motionManager.stopAccelerometerUpdates()
            
            
            let gameOverScene: GameOverScene = GameOverScene(size: self.size)
            gameOverScene.game = self
            view!.presentScene(gameOverScene, transition: SKTransition.doorsOpenHorizontalWithDuration(1.0))
        }
    }
}
