//
//  DayListHeaderView.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayListHeaderView: UIView, ReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with title: String) {
        titleLabel.text = title
    }
}
