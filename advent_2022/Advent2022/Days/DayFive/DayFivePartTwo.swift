//
//  DayFivePartTwo.swift
//  Advent2022
//
//  Created by Chelsea Carr on 12/5/22.
//

import Foundation
import UIKit

/*
 As you watch the crane operator expertly rearrange the crates, you notice the process isn't following your prediction.

 Some mud was covering the writing on the side of the crane, and you quickly wipe it away. The crane isn't a CrateMover 9000 - it's a CrateMover 9001.

 The CrateMover 9001 is notable for many new and exciting features: air conditioning, leather seats, an extra cup holder, and the ability to pick up and move multiple crates at once.

 Again considering the example above, the crates begin in the same configuration:

     [D]
 [N] [C]
 [Z] [M] [P]
  1   2   3
 Moving a single crate from stack 2 to stack 1 behaves the same as before:

 [D]
 [N] [C]
 [Z] [M] [P]
  1   2   3
 However, the action of moving three crates from stack 1 to stack 3 means that those three moved crates stay in the same order, resulting in this new configuration:

         [D]
         [N]
     [C] [Z]
     [M] [P]
  1   2   3
 Next, as both crates are moved from stack 2 to stack 1, they retain their order as well:

         [D]
         [N]
 [C]     [Z]
 [M]     [P]
  1   2   3
 Finally, a single crate is still moved from stack 1 to stack 2, but now it's crate C that gets moved:

         [D]
         [N]
         [Z]
 [M] [C] [P]
  1   2   3
 In this example, the CrateMover 9001 has put the crates in a totally different order: MCD.

 Before the rearrangement process finishes, update your simulation so that the Elves know where they should stand to be ready to unload the final supplies. After the rearrangement procedure completes, what crate ends up on top of each stack?
*/

class DayFivePartTwo: DayFive {
    override func partTitle() -> String {
        return "Part 2"
    }
    
    override func description() -> String {
        return "After the rearrangement procedure completes, what crate ends up on top of each stack?"
    }
   
    override func answer() -> DayAnswer {
        let solution = solveProblem()
        let alert = UIAlertController(title: "Answer for \(partTitle())", message: "The crate on top of each stack is \(solution)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return DayAnswer(alert: alert)
    }
}

private extension DayFivePartTwo {
    
    func solveProblem() -> String {
        let (lines, stacks) = parseAndSplitData()
        var mutableStacks = stacks

        for line in lines {
            guard line != "" else { break }
            let sanitizedArray = line.components(separatedBy: .whitespaces)
            var moves = [Int]()
            for element in sanitizedArray {
                guard let num = Int(element) else { continue }
                moves.append(num)
            }
            
            var numToRemove = moves.first ?? 0
            var itemsToMove = [String]()
            let from = moves[1] - 1
            let to = (moves.last ?? 0) - 1
            
            while numToRemove > 0 {
                let item = mutableStacks[from].popLast() ?? ""
                itemsToMove.insert(item, at: 0)
                numToRemove -= 1
            }
            mutableStacks[to].append(contentsOf: itemsToMove)
        }
        
        var finalString = "\n"
        for stack in mutableStacks {
            finalString += (stack.last ?? "")
        }
        
        return finalString
    }
}
