//
//  KakaoSettingTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/18.
//

import UIKit

enum settingOptions: Int, CaseIterable{
    case all, personal, others
    
    var sectionTitles: String {
        // 각각의 케이스 마다 다르게 보여줄 떄
        switch self {
        case .all:
            return "전체설정"
        case .personal:
            return "개인설정"
        case .others:
            return "기타"
        }
    }
    
    var rowTitles: [String]{
        switch self {
        case .all:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티 프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


//// 열거형 사용해보기
//enum allSetting:String {
//    case notice = "공지사항"
//    case laboratory = "실험실"
//    case version = "버전"
//}
//
//enum personalSetting:String{
//    case privacy = "개인/보안"
//    case alarm = "알림"
//    case chat = "채팅"
//    case profile = "멀티 프로필"
//}
//
//enum etc:String{
//    case help = "고객센터/도움말"
//}


class KakaoSettingTableViewController: UITableViewController {
   
    
    // 배열 사용해보기
    let settingSection = ["전체 설정", "개인 설정", "기타"]
    let settingCell = [["공지사항", "실험실", "버전"],
                       ["개인/보안", "알림", "채팅", "멀티 프로필"],
                       ["고객센터/도움말"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingOptions.allCases.count
    }
    
    // 셀의 갯수 반환
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // settingOptions.allCases.count // 3
        // settingOptions.allCases[0] // total이 출력된다.
        // settingOptions.allCases[1] // personal이 출력된다.
        // settingOptions.allCases[2] // others가 출력된다.
        
        // settingOptions.allCases[0] // total이 출력된다.
        // settingOptions.allCases[1].sectionTitle // 개인설정 이 출력된다.
        // settingOptions.allCases[2].rowTitle // ["고객센터/도움말"]이 출력된다.
        
        return settingOptions.allCases[section].rowTitles.count
        
    }
    
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = settingOptions.allCases[indexPath.section].rowTitles[indexPath.row]
        
        return cell
        
//        if indexPath.section == 0{
    //        if indexPath.row == 0 {
    //            cell.textLabel?.text = settingOptions.allCases[0].rowTitles[0] // 공지사항
    //        }else if indexPath.row == 1 {
    //            cell.textLabel?.text = settingOptions.allCases[1].rowTitles[1] // 실험실
    //        }else if indexPath.row == 2{
    //            cell.textLabel?.text = settingOptions.allCases[2].rowTitles[2] // 버전
    //        }
//        }
    }
    
    //
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingOptions.allCases[section].sectionTitles
    }
    
    
    
    
    
    
    
    
    // 섹션의 수를 지정하는 함수
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // settingSection.count를 사용하여 섹션의 수 반환
//        return settingSection.count
//    }
//
//    // 섹션에 헤더를 지정하여 각각의 섹션을 나누는 방법
//    // 섹션의 int가 매개변수가 있는 이유 -> 섹션마다 이름을 나누기 위해
//    // 섹션은 인덱스 기반으로 움직인다.
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        // settingSection의 배열을 section을 사용하여 순서대로 출력
//        return settingSection[section]
//    }
//
//    // 필수 1번
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // 셀의 갯수 반환
//        return settingSection[section].count
//    }
//
//    // 필수 2번
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
//
//        cell.textLabel?.text = settingCell[indexPath.section][indexPath.row]
//        cell.textLabel?.font = .systemFont(ofSize: 20)
//
//        return cell
//    }
//
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }

}
