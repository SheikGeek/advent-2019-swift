//
//  DayOne.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/23.
//  Copyright © 2023 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

class DayOne: Day {
    
    private let fileInputName = "DayOneInput"
    
    var dayTitle = "--- Day 1: Trebuchet?! ---"

    
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
