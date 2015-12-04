//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation

class ItemFactory {

    static func getRandom(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) -> Item {

        let randomInt = arc4random_uniform(5)
        //print(randomInt);

        switch randomInt{
        case 1:
            return XYReversal(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        case 2:
            return NoOutOfBounds(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        case 3:
            return MovingPlatforms(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        case 4:
            return Invincibility(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        default:
            return Invincibility(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        }

    }
}