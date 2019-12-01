//
//  DayUnimplemented.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayUnimplemented: Day {
    var dayTitle = "Day ???"
    var partTitle = "Part ???"
    var description = "Not Implemented Yet"
    
    func answer() -> DayAnswer {
        let alert = UIAlertController(title: "Answer for \(dayTitle)", message: "Why aren't you writing any code?????", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}
