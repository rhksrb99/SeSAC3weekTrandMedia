//
//  UIViewController+Extension.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor(){
        
        view.backgroundColor = .orange
    
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
}
