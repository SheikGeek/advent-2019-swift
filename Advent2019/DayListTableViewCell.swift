//
//  DayListTableViewCell.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayListTableViewCell: UITableViewCell {
    
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

//Cell Helpers
extension DayListTableViewCell {
    
    static var nibName: String {
       return String(describing: DayListTableViewCell.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: .main)
    }
}
