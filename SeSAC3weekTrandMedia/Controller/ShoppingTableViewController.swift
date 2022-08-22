//
//  ShoppingTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit
import RealmSwift

class ShoppingTableViewController: UITableViewController {
    
//    var shoppingList = [String]()
    
    let localRealm = try! Realm()
    
    var tasks: Results<UserShoppingList>!

    @IBOutlet weak var tf_search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        createDB()
        tableView.rowHeight = 60
        btnDesign()
        tfDesign()
        
        print("Realm is located at:", localRealm.configuration.fileURL!)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
        tableView.reloadData()
        
    }
    
    
    // MARK: - designFunctions
    func btnDesign() {
        btn_search.setTitle("추가", for: .normal)
        btn_search.setTitleColor(.white, for: .normal)
        btn_search.backgroundColor = .darkGray
    }
    
    func tfDesign() {
        tf_search.placeholder = "무엇을 구매하실 건가요?"
        tf_search.backgroundColor = .lightGray
        tf_search.layer.cornerRadius = 8
    }
    
    // MARK: - Functions
    func createDB() {
        tasks = localRealm.objects(UserShoppingList.self).sorted(byKeyPath: "item", ascending: false)
    }
    
    
    // MARK: - TableViewController Setting
    @IBAction func btn_searchClicked(_ sender: UIButton) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell") as! ShoppingTableViewCell
        
        let task = UserShoppingList(item: tf_search.text!)
        
        try! localRealm.write {
            localRealm.add(task) // create
            print("Realm Succeed")
            dismiss(animated: true)
        }
        tf_search.text = ""
        tableView.reloadData()
//        // 입력받은 값을 배열에 추가
//        shoppingList.append(tf_search.text!)
    }
    
    // section의 수 정하기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell // 타입 캐스팅
        
        cell.lb_list.text = tasks[indexPath.row].item
        
        cell.lb_list.font = .boldSystemFont(ofSize: 20)
        cell.backgroundColor = .lightGray
        cell.btn_like.tintColor = .black
        cell.checkBoxImageView.tintColor = .black
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    // 삭제를 가능하게 하는 메서드
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 애플 제공 디폴트 기능 : commit editingStyle
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            tasks .remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
    
    


}
