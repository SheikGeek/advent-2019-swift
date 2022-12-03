//
//  DayTwo.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/2/22.
//

import Foundation

class DayTwo: Day {
    
    private let fileInputName = "DayTwoInput"
    
    var dayTitle = "--- Day 2: Rock Paper Scissors ---"

    
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

extension DayTwo {
    func total(from combos: [String]) -> String {
        let lines = parseAndSplitData()
        
        var total: Int = 0
        lines.forEach {
            guard let index = combos.firstIndex(of: $0) else { return }
            total += index
        }
       
        return "\(total)"
    }
}
