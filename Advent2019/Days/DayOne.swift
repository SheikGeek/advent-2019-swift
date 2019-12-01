//
//  DayOne.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayOne: Day {
    var dayTitle = "Day One"
    var description = "What is the sum of the fuel requirements for all of the modules on your spacecraft?"
    
    func answer() -> DayAnswer {
        let alert = UIAlertController(title: "Answer for \(dayTitle)", message: "You still need to solve this. GET CODING!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}
