//
//  MainViewController.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/22.
//  Copyright © 2022 Chelsea Carr. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.register(DayListTableViewCell.nib, forCellReuseIdentifier: DayListTableViewCell.nibName)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private var dataSource = [[Day]]()
    private var sectionTitles = [String]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        buildView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Advent of Code 2022"
        
        buildDataSource()
    }
    
    private func buildView() {
        view.addSubview(tableView)
    }
    
    private func layout() {
        let constraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func buildDataSource() {
        
        var sectionArray = [Day]()
        for dayPart in 1...50 {
            
            let currentDay: Day
            switch dayPart {
            case 1:
                currentDay = DayOnePartOne()
            case 2:
                currentDay = DayOnePartTwo()
            case 3:
                currentDay = DayTwoPartOne()
            case 4:
                currentDay = DayTwoPartTwo()
            case 5:
                currentDay = DayThreePartOne()
            case 6:
                currentDay = DayThreePartTwo()
            default:
                currentDay = DayUnimplemented()
            }
            
            sectionArray.append(currentDay)
            
            if dayPart%2 == 0 {
                dataSource.append(sectionArray)
                
                //Reset the section Array
                sectionArray = []
                
                //setup the section Titles
                sectionTitles.append(currentDay.dayTitle)
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DayListTableViewCell.nibName, for: indexPath) as? DayListTableViewCell else {
            return UITableViewCell()
        }
        
        let day = dataSource[indexPath.section][indexPath.row]
        cell.setup(with: day.partTitle(), description: day.description())
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = Bundle.main.loadNibNamed(DayListHeaderView.nibName, owner: self, options: nil)?.first as? DayListHeaderView else { return nil }
        
        headerView.setup(with: sectionTitles[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let padding: CGFloat = 20
        
        let constraintRect = CGSize(width: tableView.frame.width - (padding * 2), height: .greatestFiniteMagnitude)
        let boundingBox = sectionTitles[section].boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19.0, weight: .bold)
            ],
            context: nil
        )
        
        return ceil(boundingBox.height) + (padding * 2)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day = dataSource[indexPath.section][indexPath.row]
        let answer = day.answer()
        
        if let alert = answer.alert {
            present(alert, animated: true, completion: nil)
        } else if let vc = answer.vc {
            //Not implemented yet
            print(vc.description)
        }
    }
}

