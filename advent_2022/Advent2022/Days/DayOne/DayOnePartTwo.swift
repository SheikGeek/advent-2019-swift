//
//  DayOnePartTwo.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

/*
 By the time you calculate the answer to the Elves' question, they've already realized that the Elf carrying the most Calories of food might eventually run out of snacks.

 To avoid this unacceptable situation, the Elves would instead like to know the total Calories carried by the top three Elves carrying the most Calories. That way, even if one of those Elves runs out of snacks, they still have two backups.

 In the example above, the top three Elves are the fourth Elf (with 24000 Calories), then the third Elf (with 11000 Calories), then the fifth Elf (with 10000 Calories). The sum of the Calories carried by these three elves is 45000.

 Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?
*/

class DayOnePartTwo: DayOne {
    
    override func partTitle() -> String {
        return "Part 2"
    }
    
    override func description() -> String {
        return "Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?"
    }
   
    override func answer() -> DayAnswer {
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "The total number of calories carried by the top 3 elves is \(solution) Calories", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DayOnePartTwo {
    
    func solveProblem() -> String {
        let lines = parseAndSplitData()
        
        var total: Int = 0
        var calories = [Int]()

        lines.forEach {
            guard !$0.isEmpty else {
                if let index = calories.firstIndex(where: { $0 < total }) {
                    calories.insert(total, at: index)
                    calories.removeLast()
                } else {
                    calories.append(total)
                }
                
                total = 0
                
                return
            }
            
            total += Int($0) ?? 0
        }
    
        var finalTotal: Int = 0
        var totalAdded = false
        var numOfCaloriesAdded = 0
        for calorie in calories {
            guard numOfCaloriesAdded < 3 else { break }
            if total > calorie && !totalAdded {
                totalAdded = true
                finalTotal += total
                numOfCaloriesAdded += 1
            }
            
            guard numOfCaloriesAdded < 3 else { break }
            
            finalTotal += calorie
            numOfCaloriesAdded += 1
        }
               
        return ("\(finalTotal)")
    }
}
