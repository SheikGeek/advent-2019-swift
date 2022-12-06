//
//  DaySix.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/6/22.
//

import Foundation

class DaySix: Day {
    private let fileInputName = "DaySixInput"
    
    var dayTitle = "--- Day 6: Tuning Trouble ---"

    
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
    
    func parseAndSplitData() -> String {
        return parseInputFile(name: fileInputName)
    }
}
