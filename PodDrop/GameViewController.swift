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
            
            // Create and configure the scene.
            NSLog("width %f", skView.bounds.size.width)
            NSLog("height %f", skView.bounds.size.height)
            scene = GameScene(size: skView.bounds.size)
            scene.scaleMode = .AspectFit
            // Present the scene.
            skView.presentScene(scene)
        }
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
