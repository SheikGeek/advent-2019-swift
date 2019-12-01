//
//  Day.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

protocol Day: class {
    var dayTitle: String {set get}
    var description: String {set get}

    func answer() -> DayAnswer
    func parseInputFile(name: String) -> String
}

extension Day {
    func parseInputFile(name: String) -> String {
        guard let path = Bundle.main.path(forResource:name, ofType: "txt") else {
            return ""
        }
        
        do {
            let output = try String(contentsOfFile: path, encoding: .utf8)
            return output
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
