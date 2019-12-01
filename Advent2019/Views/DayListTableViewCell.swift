//
//  DayListTableViewCell.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayListTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setup(with title: String, description: String) {
        dayLabel.text = title
        descriptionLabel.text = description
    }
}
