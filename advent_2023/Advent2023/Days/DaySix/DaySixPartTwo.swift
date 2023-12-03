//
//  DaySixPartTwo.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/5/22.
//

import Foundation
import UIKit

/*
 Your device's communication system is correctly detecting packets, but still isn't working. It looks like it also needs to look for messages.

 A start-of-message marker is just like a start-of-packet marker, except it consists of 14 distinct characters rather than 4.

 Here are the first positions of start-of-message markers for all of the above examples:

 mjqjpqmgbljsphdztnvjfqwrcgsmlb: first marker after character 19
 bvwbjplbgvbhsrlpgdmjqwftvncz: first marker after character 23
 nppdvjthqldpwncqszvftbrmjlhg: first marker after character 23
 nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: first marker after character 29
 zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: first marker after character 26
 How many characters need to be processed before the first start-of-message marker is detected?
*/

class DaySixPartTwo: DaySix {
    override func partTitle() -> String {
        return "Part 2"
    }
    
    override func description() -> String {
        return "How many characters need to be processed before the first start-of-message marker is detected?"
    }
    
    override func answer() -> DayAnswer {
        
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "The number of characters processed to find the marker are \(solution)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DaySixPartTwo {
    
    func solveProblem() -> String {
        let file = parseAndSplitData()

        var marker = [String]()
        var finalIndex = 0
        for (index, char) in file.enumerated() {
            let value = String(char)
            guard marker.count == 14 else {
                marker.append(value)
                continue
            }
            
            if Set(marker).count == 14 {
                finalIndex = index
                break
            } else {
                marker.removeFirst()
                marker.append(value)
            }
        }
        
        return "\(finalIndex)"
    }
}
