//
//  BucketListTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit

class BucketListTableViewController: UITableViewController {

    static let identifier = "BucketListTableViewController"
    
    // 값 전달 1번
    var textfieldPlaceholder = ""
    // 옵셔널 스트링 타이븡로 선언하더라도 오류가 뜨지 않는 이유는?
    // placegolder 자체가 옵셔널이라면? 괜챃다!
    // 하지만 String Interpolation이라면?
    // var textfieldPlaceholder: String?
    
    @IBOutlet weak var tf_top: UITextField!
    
    var list = ["탑건:메버릭", "울버린", "짱구는못말려", "명탐정코난"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // place holder
        tf_top.text = ""
        tf_top.placeholder = "\(textfieldPlaceholder)를 입력해보세요."
        // 만약 textfieldPlaceholder가 없다면? "검색어"를 반환한다.
        //tf_top.placeholder = "\(textfieldPlaceholder ?? "검색어")를 입력해보세요."
        
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(btn_closeClicked))
        
        tableView.rowHeight = 80
        
        list.append("토르")
    }
    
    @objc func btn_closeClicked() {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func tf_topClicked(_ sender: UITextField) {
        
        // case 2. if-let 사용
        
        // sender에 텍스트가 있다면 value에 넣어주고     공백을 지우는 방법                      value가 빈 값이 아닌지     value가 2~6글자에 있는지
        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty ,   (2...6).contains(value.count){
            // 있다면 list에 value를 넣어주고
            list.append(value)
            // tableView에 새로고침!
            tableView.reloadData()
        }else {
            // 토스트 메시지 띄우기
        }
        
        // case 3. guard let 사용
        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
            // Alert 혹은 Toast를 사용하여 사용자에게 알려주는게 좋다. 경고, 안내 등
            return
        }
        // guard let의 조건에 충족하면 아래의 코드 실행
        list.append(value)
        tableView.reloadData()
        
        
        // case 1.
        // 입력된 텍스트를 sender를 통해 받아오며 list에 추가
//        list.append(sender.text!)
        
        // 중요한 포인트 -> 데이터가 추가가 되면 테이블을 다시 그려주는 코드
//        tableView.reloadData()
        // 특정 섹션만 리로드 하고싶을 때
        tableView.reloadSections(IndexSet(), with: .fade)
        // 특정 로우만 리로드 하고싶을 때
        // 2개 이상이 될수도 있으니 배열의 형태로 가져감
//        tableView.reloadRows(at: [IndexPath(row:0, section: 0),IndexPath(row:1, section: 0)], with: .fade)
    }
    

    // section의 수 정하기.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as! BucketListTableViewCell // as? 타입 캐스팅
        
        cell.lb_bucketList.text = list[indexPath.row]
        cell.lb_bucketList.font = .boldSystemFont(ofSize: 20)
        
        return cell
    }
 
    // 삭제를 가능하게 하는 메서드
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // 배열 삭제 후 테이블 뷰 리로드
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // 스와이프에 대한 기능
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
}
