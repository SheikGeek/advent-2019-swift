//
//  ReusableView.swift
//  Advent2019
//
//  Created by Chelsea Carr on 12/1/19.
//  Copyright © 2019 Chelsea Carr. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView {
    static var nibName: String {get}
    static var nib: UINib {get}
}

extension ReusableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: .main)
    }
}
