//
//  ShoppingItemDetailViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/08/24.
//

import UIKit
import RealmSwift

class ShoppingItemDetailViewController: UIViewController{

    static let identifier = "ShoppingItemDetailViewController"
    
    var selectedItem: String?
    var selectedFavorite: Bool?
    var selectedCheck: Bool?
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemLabel.text = selectedItem
        print(itemLabel)
        
        
    }
    
    
    
}


