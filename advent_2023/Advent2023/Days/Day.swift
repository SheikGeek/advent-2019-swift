//
//  Day.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/22.
//  Copyright © 202 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

protocol Day {
    var dayTitle: String {set get}
    
    func partTitle() -> String
    func description() -> String
    func answer() -> DayAnswer
    
    func parseInputFile(name: String) -> String
}

extension Day {
    func parseInputFile(name: String) -> String {
        guard let path = Bundle.main.path(forResource:name, ofType: "txt") else { return "" }
        
        do {
            return try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            return ""
        }
    }
}

struct DayAnswer {
    let vc: UIViewController?
    let alert: UIAlertController?
    
    init(vc: UIViewController? = nil, alert: UIAlertController? = nil) {
        self.vc = vc
        self.alert = alert
    }
}
