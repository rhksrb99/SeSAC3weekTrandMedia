//
//  RecommandCollectionViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView -> CollectionView
 Row -> Item
 heightForRowAt -> ??? FlowLayout (heightForItemAt이 없는 이유)
 */


class RecommandCollectionViewController: UICollectionViewController {
    static let identifier = "RecommandCollectionViewController"

    // 1. 값 전달(SearchMovieTableViewController) - 데이터를 받을 공간(프로퍼티 생성
    var movieData:Movie? // 따로 따로 프로퍼티 생성하지 않고 하나의 구조체 전체를 전달 받는 이유? 1. 귀찮아서 2. 깔끔해서
    
    var image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhnwfa7h49F5970bxJrruhRZeQUePhDqK7aw&usqp=CAU"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. (SearchMovieTableViewController)전달받은 값 사용 - 프로퍼티 값을 뷰에 표현
        title = movieData?.title
        
        // 컬렉션뷰의 셀 크기, 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        // 각 셀마다 좌, 우 의 spacing이 총 4개로 나뉘고 3개의 셀에 같은 너비를 주기위해
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        // 아이템 크기
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        // 스크롤 방향
        layout.scrollDirection = .vertical
        // 여백
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else{
                // 비어있는 인스턴스를 반환
            return UICollectionViewCell()
        }
        
        let url = URL(string: image)
        cell.posterImageView.kf.setImage(with: url)
        
        
        return cell
    }
    
    // 셀 선택 시 이벤트를 주는 함수 : didSelectItemAt
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다.", duration: 3, position: .bottom)
        
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecommandCellInfoViewController") as! RecommandCellInfoViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
//        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func barbtn_search(_ sender: UIBarButtonItem) {
        print("barbtn Clicked")
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecommandSearchViewController") as! RecommandSearchViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
    
}
