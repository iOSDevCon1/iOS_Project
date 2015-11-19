//
//  Constants.swift
//  PodDrop
//
//  Created by Pablo Arango on 11/17/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation

struct Category {
    // different categories for items that we need to detect when theres a
    // contact between them
    static let pod:         UInt32 = 1 << 0
    static let obstacle:    UInt32 = 1 << 1
    static let platform:    UInt32 = 1 << 2
    static let boundary:    UInt32 = 1 << 3
}

