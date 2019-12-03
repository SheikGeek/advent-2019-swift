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
}
