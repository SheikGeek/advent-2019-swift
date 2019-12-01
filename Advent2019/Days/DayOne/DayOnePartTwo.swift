//
//  DayOnePartTwo.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit


class DayOnePartTwo: Day {
    
    private let fileInputName = "DayOneInput"
    
    var dayTitle = "Day 1: The Tyranny of the Rocket Equation"
    var partTitle = "Part 2"
    var description = "What is the sum of the fuel requirements for all of the modules on your spacecraft when also taking into account the mass of the added fuel?"
    
    func answer() -> DayAnswer {
        //let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle)", message: "The total fuel needed is unknown", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
    
    
}
