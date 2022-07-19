//
//  UITextField+Extension.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit

extension UITextField {
    func borderColor() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
    }
}
