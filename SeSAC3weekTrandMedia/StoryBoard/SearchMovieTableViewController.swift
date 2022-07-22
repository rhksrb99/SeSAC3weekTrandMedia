//
//  SearchMovieTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/20.
//

import UIKit

class SearchMovieTableViewController: UITableViewController {

    var movieList = MovieInfo()
//    ["알라딘", "세얼간이", "짱구는 못말려", "명탐정 코난", "라라랜드", "스파이더맨", "울버린", "아이언맨"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
        
    }
    
    @objc func resetButtonClicked(){
        
        // iOS13 이상 SceneDelegate 쓸 때 동작하는 코드
        // 앱이 처음 시작하는 것 처럼 화면을 되돌리는 것
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let storyBoard = UIStoryboard(name: "Trend", bundle: nil)
        let viewCon = storyBoard.instantiateViewController(withIdentifier: "testViewController") as! testViewController
        
        sceneDelegate?.window?.rootViewController = viewCon
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieTableViewCell", for: indexPath) as! SearchMovieTableViewCell
        
        // Cell 파일에서 생성한 메서드 사용
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //  디바이스의 전체 높이를 비율로 계산하여 높이 지정
        return UIScreen.main.bounds.height / 8
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRowAt")
        
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: RecommandCollectionViewController.identifier) as! RecommandCollectionViewController
        
        // 2. 값 전달(RecommandCollectionViewController) - vc가 가지고있는 프로퍼티에 데이터 추가
        vc.movieData = movieList.movie[indexPath.row]
        
//        let title = movieList.movie[indexPath.row].title
//        let release = movieList.movie[indexPath.row].releaseDate
//        vc.title = "\(title)(\(release))"
        
        self.navigationController?.pushViewController(vc, animated: true)
        print("didSelectRowAt second")
        
        
    }
    
    

}
