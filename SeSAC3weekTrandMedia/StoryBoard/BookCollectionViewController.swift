//
//  BookCollectionViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/20.
//

import UIKit
import Kingfisher

class BookCollectionViewController: UICollectionViewController {
    
    let bookList = BookInfo().book

    override func viewDidLoad() {
        super.viewDidLoad()

        designCollectionView()
        
        
    }
    
    // 섹션 수 정하기
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    
    // 셀 데이터 지정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        cell.lb_title.text = bookList[indexPath.item].title
        cell.lb_rate.text = String(bookList[indexPath.item].rate)
        
        let url = URL(string: bookList[indexPath.item].subimage)
        cell.subImageView.kf.setImage(with: url)
        
        cell.lb_title.font = .boldSystemFont(ofSize: 20)
        cell.lb_title.textColor = .white
        
        
        cell.subImageView.layer.cornerRadius = 5
        cell.backGroundView.backgroundColor = bookList[indexPath.item].bgcolor
        cell.backGroundView.layer.cornerRadius = 16
        
        return cell
        
    }
    
    func designCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        
    }
    
}
