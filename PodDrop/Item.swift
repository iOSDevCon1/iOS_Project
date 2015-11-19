//
//  ConsumableItem.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/14/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class Item:SKSpriteNode{

    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func use(pod:Pod){
        
    
    }

}
