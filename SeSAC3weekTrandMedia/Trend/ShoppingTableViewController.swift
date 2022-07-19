//
//  ShoppingTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var tf_search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60

    }
    
    @IBAction func btn_searchClicked(_ sender: UIButton) {
        // 입력받은 값을 배열에 추가
        shoppingList.append(tf_search.text!)
        tf_search.text = ""
        
        // 값을 넣어주고 새로고침(?) 같은 기능
        tableView.reloadData()
        
    }
    
    // section의 수 정하기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell // 타입 캐스팅
        cell.lb_list.text = shoppingList[indexPath.row]
        cell.lb_list.font = .boldSystemFont(ofSize: 20)
        
        return cell
    }
    
    // 삭제를 가능하게 하는 메서드
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 애플 제공 디폴트 기능 : commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    


}
