//
//  DayTwo.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/2/22.
//

import Foundation

class DayFour: Day {
    private let fileInputName = "DayFourInput"
    
    var dayTitle = "--- Day 4: Camp Cleanup ---"

    
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
    
    func parseAndSplitData() -> [String] {
        let fileOutput = parseInputFile(name: fileInputName)
        guard !fileOutput.isEmpty else { return [] }
        
        return fileOutput.components(separatedBy: .newlines)
    }
}
