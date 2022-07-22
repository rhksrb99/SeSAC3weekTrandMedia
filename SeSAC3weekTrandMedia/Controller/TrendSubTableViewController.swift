//
//  TrendSubTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/21.
//

import UIKit

class TrendSubTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btn_movieClicked(_ sender: UIButton) {
        // 화면전환의 순서는 3가지가 있다.
        // 1. 스토리보드 파일 2. 스토리보드 내에 뷰컨트롤러 3. 화면전환
        // 영화버튼 클릭 > BucketlistTableViewController present
        // 1번
        let storyB = UIStoryboard(name: "Trend", bundle: nil)
        // 2번
        let viewCon = storyB.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        
        // 값 전달 2번
        viewCon.textfieldPlaceholder = "영화"
        
        // 버튼의 스타일이 plain일 땐 불가능하지만
        // 버튼의 title을 가져와서 사용할 수 있다.
        // viewCon.textfieldPlaceholder = sender.currentTitle
        
        // 3번
        self.present(viewCon, animated: true)
        
    }
    
    @IBAction func btn_dramaClicked(_ sender: UIButton) {
        
        // 화면전환의 순서는 3가지가 있다.
        // 1. 스토리보드 파일 2. 스토리보드 내에 뷰컨트롤러 3. 화면전환
        // 영화버튼 클릭 > BucketlistTableViewController present
        // 1번
        let storyB = UIStoryboard(name: "Trend", bundle: nil)
        // 2번
        let viewCon = storyB.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        // 2.5번 present 시 화면 전환 방식 설정(옵션)
        viewCon.modalPresentationStyle = .fullScreen
        
        // 값 전달 2번
        viewCon.textfieldPlaceholder = "드라마"
        
        // 3번
        self.present(viewCon, animated: true)
        
    }
    
    @IBAction func btn_bookClicked(_ sender: UIButton) {
        
        // 화면전환의 순서는 3가지가 있다.
        // 1. 스토리보드 파일 2. 스토리보드 내에 뷰컨트롤러 3. 화면전환
        // 영화버튼 클릭 > BucketlistTableViewController present
        // 1번
        let storyB = UIStoryboard(name: "Trend", bundle: nil)
        // 2번
        let viewCon = storyB.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        
        // 2.5번 코드로 네비게이션 임베드 하는 방법
        let nav = UINavigationController(rootViewController: viewCon)
        
        // 값 전달 2번
        viewCon.textfieldPlaceholder = "도서"
        
        // 2.5번 present 시 화면 전환 방식 설정(옵션)
        nav.modalPresentationStyle = .fullScreen
        
        // 3번 화면전환 시 네비게이션을 임베드 했다면 네비게이션을 호출해야한다.
        self.present(nav, animated: true)
        
    }
}
