//
//  ConsumableItem.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/14/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import SpriteKit

class ConsumableItem: SKSpriteNode {
    
    
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, categories: [UInt32]) {
        super.init(texture: nil, color: UIColor.clearColor(), size: size);
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
