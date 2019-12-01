//
//  MainViewController.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [Day]()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Advent of Code 2019"
        
        tableView.register(DayListTableViewCell.nib, forCellReuseIdentifier: DayListTableViewCell.nibName)
        buildDataSource()
    }
    
    private func buildDataSource() {
        
        for day in 1...49 {
            switch day {
            case 1:
                dataSource.append(DayOnePartOne())
            default:
                dataSource.append(DayUnimplemented(dayTitle: "Day \(day)"))
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DayListTableViewCell.nibName, for: indexPath) as? DayListTableViewCell else {
            return UITableViewCell()
        }
        
        let day = dataSource[indexPath.row]
        cell.setup(with: day.dayTitle, description: day.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day = dataSource[indexPath.row]
        let answer = day.answer()
        
        if let alert = answer.alert {
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        } else if let vc = answer.vc {
            //Not implemented yet
        }
    }
}

