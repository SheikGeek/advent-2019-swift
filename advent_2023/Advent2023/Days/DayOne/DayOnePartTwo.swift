//
//  DayOnePartOne.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

/*
 --- Day 1: Trebuchet?! ---
 --- Part Two ---
 Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

 Equipped with this new information, you now need to find the real first and last digit on each line. For example:

 two1nine
 eightwothree
 abcone2threexyz
 xtwone3four
 4nineeightseven2
 zoneight234
 7pqrstsixteen
 In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

 What is the sum of all of the calibration values?
 */

class DayOnePartTwo: DayOne {
    
    override func partTitle() -> String {
        return "Part 2"
    }
    
    override func description() -> String {
        return "What is the sum of all of the calibration values?"
    }
    
    override func answer() -> DayAnswer {
        
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "The sum of all the calibration values is \(solution)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DayOnePartTwo {
    func solveProblem() -> String {
        let lines = parseAndSplitData()
        
        let stringifiedNumbers = [
            "one": "1",
            "two": "2",
            "three": "3",
            "four": "4",
            "five": "5",
            "six": "6",
            "seven": "7",
            "eight": "8",
            "nine": "9"
        ]
        
        var total: Int = 0
    
        for line in lines {
            guard line.count > 0 else { break }
                        
            var firstNumber: String?
            var lastNumber: String?
            var currentNumber = ""
            for char in line {
                let stringifiedCharacter = String(char)
                if firstNumber == nil {
                    if Int(stringifiedCharacter) != nil {
                        firstNumber = stringifiedCharacter
                        currentNumber = ""
                        continue
                    } else {
                        currentNumber += stringifiedCharacter
                    }
                    
                    for key in stringifiedNumbers.keys {
                        if currentNumber.contains(key) {
                            currentNumber = key
                            break
                        }
                    }
                    
                    if let num = stringifiedNumbers[currentNumber] {
                        firstNumber = num
                        currentNumber = String(currentNumber.last!)
                    }
                } else {
                    if Int(stringifiedCharacter) != nil {
                        lastNumber = stringifiedCharacter
                        currentNumber = ""
                        continue
                    } else {
                        currentNumber += stringifiedCharacter
                    }
                    
                    for key in stringifiedNumbers.keys {
                        if currentNumber.contains(key) {
                            currentNumber = key
                            break
                        }
                    }
                    
                    if let num = stringifiedNumbers[currentNumber] {
                        lastNumber = num
                        currentNumber = String(currentNumber.last!)
                    }
                }
            }
            
            if lastNumber == nil {
                lastNumber = firstNumber
            }
            
            let number = Int(firstNumber! + lastNumber!)
            print(number)
            total += number ?? 0
        }
        
        return "\(total)"
    }
}
