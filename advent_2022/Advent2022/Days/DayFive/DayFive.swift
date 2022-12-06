//
//  DayFive.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/5/22.
//

import Foundation

class DayFive: Day {
    private let fileInputName = "DayFiveInput"
    
    var dayTitle = "--- Day 5: Supply Stacks ---"

    
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
    
    func parseAndSplitData() -> (lines: [String], stacks: [[String]]) {       
        let fileOutput = parseInputFile(name: fileInputName)
        guard !fileOutput.isEmpty else { return ([], []) }
        
        let lines = fileOutput.components(separatedBy: .newlines)
        
        return parseOutStacks(from: lines)
    }
    
    private func parseOutStacks(from lines: [String]) -> (lines: [String], stacks: [[String]]) {        
        var remainingLines = lines
        var stacks = [[String]]()
        var firstPass = true
        for line in lines {
            remainingLines.removeFirst()
            guard line != "" else { break }
            
            var stacksIndex = 0
            for (index, char) in line.enumerated() {
                let value = String(char)

                guard index % 4 == 1 && Int(value) == nil else { continue }
                
                if firstPass {
                    if value == " " {
                        stacks.append([])
                    } else {
                        stacks.append([value])
                    }
                } else if stacksIndex >= stacks.count {
                    if value == " " {
                        stacks.append([])
                    } else {
                        stacks.append([value])
                    }
                    stacksIndex += 1
                } else {
                    if value != " " {
                        stacks[stacksIndex].insert(value, at: 0)
                    }
                    stacksIndex += 1
                }
            }
            
            firstPass = false
        }
        
        return (remainingLines, stacks)
    }
}
