//
// Created by Pablo Arango on 12/3/15.
// Copyright (c) 2015 iOSDevCon1. All rights reserved.
//

import Foundation

class ItemFactory {

    static func getRandom(size: CGSize, position:CGPoint, scrollSpeed:CGFloat, scroller:ScrollHandler) -> Item {

        let randomInt = 8 //arc4random_uniform(8)
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
        case 5:
            return Blurry(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        case 6:
            return SlowDown(size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        case 7:
            return SpeedUp(size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        case 8:
            return BreakThrough(size: size, position: position, scrollSpeed: scrollSpeed, scroller: scroller);
        default:
            return Invincibility(size: size, position:position, scrollSpeed:scrollSpeed, scroller:scroller);
        }

    }
}
