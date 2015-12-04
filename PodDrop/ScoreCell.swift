//
//  ScoreCell.swift
//  PodDrop
//
//  Created by Ari on 12/3/15.
//  Copyright © 2015 iOSDevCon1. All rights reserved.
//

import Foundation
import UIKit

class ScoreCell: UITableViewCell {
    @IBOutlet weak var username_label: UILabel!
    @IBOutlet weak var score_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
