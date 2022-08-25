//
//  ShoppingItemDetailViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/08/24.
//

import UIKit
import RealmSwift
import SnapKit

class ShoppingItemDetailViewController: UIViewController{

    static let identifier = "ShoppingItemDetailViewController"
    
    var selectedItem: String?
    var selectedFavorite: Bool?
    var selectedCheck: Bool?
    var selectedImage: UIImage?
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.backgroundColor = .lightGray
        return label
    }()
    
    let itemImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "heart.fill")
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        itemLabel.text = selectedItem
        configureUI()
    }
    
    func configureUI() {
        [itemImage, itemLabel].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        itemImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.height.width.equalTo(40)
        }
        
        itemLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(itemImage.snp_trailingMargin).offset(20)
            make.trailingMargin.equalTo(20)
            make.height.equalTo(40)
        }
        
    }
    
    
}


