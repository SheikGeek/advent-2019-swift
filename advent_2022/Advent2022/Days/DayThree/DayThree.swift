//
//  DayThree.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/3/22.
//

import Foundation

class DayThree: Day {
    private let fileInputName = "DayThreeInput"
    
    var dayTitle = " --- Day 3: Rucksack Reorganization ---"

    
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
