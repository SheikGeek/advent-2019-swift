//
//  DayFivePartTwo.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/5/22.
//

import Foundation
import UIKit

/*
 --- Part Two ---
 It seems like there is still quite a bit of duplicate work planned. Instead, the Elves would like to know the number of pairs that overlap at all.

 In the above example, the first two pairs (2-4,6-8 and 2-3,4-5) don't overlap, while the remaining four pairs (5-7,7-9, 2-8,3-7, 6-6,4-6, and 2-6,4-8) do overlap:

 5-7,7-9 overlaps in a single section, 7.
 2-8,3-7 overlaps all of the sections 3 through 7.
 6-6,4-6 overlaps in a single section, 6.
 2-6,4-8 overlaps in sections 4, 5, and 6.
 So, in this example, the number of overlapping assignment pairs is 4.

 In how many assignment pairs do the ranges overlap?
*/

class DayFivePartTwo: DayFive {
    override func partTitle() -> String {
        return "Part 2"
    }
    
    override func description() -> String {
        return " In how many assignment pairs do the ranges overlap?"
    }
   
    override func answer() -> DayAnswer {
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "The number of assignment pairs that overlap is \(solution)", preferredStyle: .alert)

        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DayFivePartTwo {
    
    func solveProblem() -> String {
        let lines = parseAndSplitData()
        var total: Int = 0
        lines.forEach {
            let pairs = $0.components(separatedBy: .punctuationCharacters)
            guard
                let first = Int(pairs.first ?? ""),
                let second = Int(pairs[1]),
                let third = Int(pairs[2]),
                let fourth = Int(pairs.last ?? "") else { return }
            
            guard
                (first >= third && first <= fourth) ||
                (second >= third && second <= fourth) ||
                (third >= first && third <= second) ||
                (fourth >= first && fourth <= second)
            else { return }
                
            total += 1
        }
        
        return "\(total)"
    }
}
