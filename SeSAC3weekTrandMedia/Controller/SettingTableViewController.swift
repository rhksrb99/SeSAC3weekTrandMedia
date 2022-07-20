//
//  SettingTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {

    var birthdayFriends = ["짱구", "철수", "유리", "맹구", "훈이", "수지", "흰둥이", "이슬이누나", "붉은 장미 삼총사"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
    }
    // 섹션의 갯수(옵션작성)
    // 작성하지않아도 1은 기본값으로 지정되어있다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    // 섹션에 헤더를 지정하여 각각의 섹션을 나누는 방법
    // section의 Int 매개변수가 있는 이유 -> 섹션마다 이름을 나누기 위해
    // 섹션은 인덱스 기반으로 움직인다.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return "1번째 섹션"
        }else if section == 1{
            return "2번째 섹션"
        }else if section == 2{
            return "3번째 섹션"
        }else{
            return "섹션"
        }
        
    // if문을 작성할 때 모든 조건을 만족해야 return오류가 안생긴다.
        
    }
    
    // 섹션에 푸터를 지정하여 각각의 섹션을 나누는 방법
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "섹션푸터"
    }
    
    
    // 1. 셀의 갯수(필수작성) : numberOfRowsInSection
    // ex. 카카오톡 친구가 100명이라면 셀 100개, 4000명이라면 셀 4000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            // 리턴값을 숫자로 따로 지정하지않고 배열의 카운트로 작성한다면
            // 배열에 값이 추가되더라도 따로 수정할 코드가 줄어든다.
            return birthdayFriends.count
        }else if section == 1{
            return 2
        }else if section == 2{
            return 1
        }else{
            return 0
        }
        
    }
    
    
    // 2. 셀의 디자인과 데이터(필수) : cellForRowAt
    // ex. 카톡 친구의 이름, 프로필 사진, 상태 메시지 등 정보를 가져와야한다.
    // 재사용 메커니즘
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt", indexPath)
        
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDeatilCell")!
            cell.textLabel?.text = "2번 인덱스 섹션의 셀 텍스트"
            cell.textLabel?.textColor = .red
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            cell.detailTextLabel?.text = "디테일 레이블"
            
            // indexPath.row % 2 == 0, 1
            
            // 일반적인 조건문
            if indexPath.row % 2 == 0 {
                cell.imageView?.image = UIImage(systemName: "star")
                cell.backgroundColor = .systemMint
            }else{
                cell.imageView?.image = UIImage(systemName: "star.fill")
                cell.backgroundColor = .white
            }
            
            // 삼항연산자 사용
//            cell.imageView?.image = indexPath.row % 2 == 0 ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
//            cell.backgroundColor = indexPath.row % 2 == 0 ? .systemMint : .white
            
            return cell
            
        }else{
            
            // 반복되는 과정을 해주는 함수.
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            
            if indexPath.section == 0{
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .systemMint
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            }else if indexPath.section == 1{
                cell.textLabel?.text = "1번 인덱스 섹션의 셀 텍스트"
                cell.textLabel?.textColor = .black
                cell.textLabel?.font = .italicSystemFont(ofSize: 20)
            }
            
            return cell
            
        }
    }
    
    // 셀의 높이 (옵션, 빈도가 높을 때 ) tableview, heightForRowAt
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // if
        if indexPath.section == 0 && indexPath.row == 0{
            return 300
        }else {
            return 44
        }
    }
    
}
