//
//  DayTwoPartTwo.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/2/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayTwoPartTwo: DayTwo {
    
    override func partTitle() -> String {
        return "Part 2"
    }
    
    override func description() -> String {
        return "???"
    }
    
    override func answer() -> DayAnswer {
        
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "value in position 0 is \(solution)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DayTwoPartTwo {
    
    func solveProblem() -> String {
        return ""
        //        let modules = parseAndSplitData()
        //        var total: Double = 0
        //
        //        modules.forEach { total += calculateFuelFromString(for: $0) }
        //
        //        return "\(Int(total))"
    }
}
