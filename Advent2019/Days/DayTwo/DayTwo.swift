//
//  DayTwo.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/2/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation

class DayTwo: Day {
    private let fileInputName = "DayTwoInput"
    
    var dayTitle = "Day 2: 1202 Program Alarm"
    
    func partTitle() -> String {
        //override in child class
        fatalError("This should be overriden")
    }
    
    func description() -> String {
        //override in child class
        fatalError("This should be overriden")
    }
    
    func answer() -> DayAnswer {
        //override in child class
        fatalError("This should be overriden")
    }
    
    func parseAndSplitData() -> [Int] {
        let fileOutput = parseInputFile(name: fileInputName)
        guard !fileOutput.isEmpty else { return [] }
        
        return fileOutput.components(separatedBy:",").compactMap { Int($0) }
    }
    
    func determinePositionZero(from originalAnswerCode: [Int], noun: Int, verb: Int) -> Int {
        
        var answerCode = originalAnswerCode
        answerCode[1] = noun
        answerCode[2] = verb
        
        let indexIncrement = 4
        var nextIndex = 0
        var noNinetyNine = true
        
        while noNinetyNine {
            let currentIndex = nextIndex
            nextIndex += indexIncrement
            
            guard answerCode.count > currentIndex + 3 else {
                noNinetyNine = false
                continue
            }
            
            let opcode = answerCode[currentIndex]
            let position1 = answerCode[answerCode[currentIndex + 1]]
            let position2 = answerCode[answerCode[currentIndex + 2]]
            let positionToFill = answerCode[currentIndex + 3]
            
            guard opcode != 99 else {
                noNinetyNine = false
                continue
            }
            
            if opcode == 1 {
                //Add the positions
                answerCode[positionToFill] = position1 + position2
            } else if opcode == 2 {
                //multiply the positions
                answerCode[positionToFill] = position1 * position2
            }
        }
        
        return answerCode[0]
    }
}
