//
//  BucketListTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit

class BucketListTableViewController: UITableViewController {

    @IBOutlet weak var tf_top: UITextField!
    
    var list = ["탑건:메버릭", "울버린", "짱구는못말려"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        
        list.append("토르")
    }
    
    @IBAction func tf_topClicked(_ sender: UITextField) {
        
        // 입력된 텍스트를 sender를 통해 받아오며 list에 추가
        list.append(sender.text!)
        
        // 중요한 포인트 -> 데이터가 추가가 되면 테이블을 다시 그려주는 코드
        tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketListTableViewCell", for: indexPath) as! BucketListTableViewCell // as? 타입 캐스팅
        
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
