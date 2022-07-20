//
//  SearchMovieTableViewCell.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/20.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var lb_title: UILabel!
    
    @IBOutlet weak var lb_release: UILabel!
    
    @IBOutlet weak var lb_overView: UILabel!
    
    // cell에서 미리 메서드 생성
    func configureCell(data: Movie) {
        
        lb_title.font = .boldSystemFont(ofSize: 20)
        lb_title.text = data.title
        lb_release.text = "\(data.releaseDate) | \(data.rate)분 | \(data.runtime)점"
        lb_overView.text = data.overview
        lb_overView.numberOfLines = 0
        
    }
}
