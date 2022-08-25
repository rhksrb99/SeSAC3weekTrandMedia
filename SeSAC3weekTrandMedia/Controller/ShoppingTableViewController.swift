//
//  ShoppingTableViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON

class ShoppingTableViewController: UITableViewController {
    
//    var shoppingList = [String]()
    
    let localRealm = try! Realm()
    
    var itemsImage:[String] = []
    
    
    var tasks: Results<UserShoppingList>!{
        didSet{
            tableView.reloadData()
            print("갱신완료")
        }
    }

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
        
        self.navigationItem.title = "쇼핑"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonClicked))
    }
    
    @objc func sortButtonClicked() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "할 일 기준 정렬", style: .default, handler: { action in
            self.tasks = self.localRealm.objects(UserShoppingList.self).sorted(byKeyPath: "check", ascending: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "즐겨찾기순 정렬", style: .default, handler: { action in
            self.tasks = self.localRealm.objects(UserShoppingList.self).sorted(byKeyPath: "favorite", ascending: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "제목순 정렬", style: .default, handler: { action in
            self.tasks = self.localRealm.objects(UserShoppingList.self).sorted(byKeyPath: "item", ascending: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(actionSheet, animated: true)
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
    
    func loadItemImage() {
        guard let item = tf_search.text else {return}
        
        let url = "\(Endpoint.unsplashURL)\(item)&client_id=\(APIKey.unsplashKey)"
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(item)
//                print("JSON: \(json)")
                let jsonArray = json["results"].arrayValue
                for json in jsonArray {
                    let thumbURL = json["urls"]["thumb"].stringValue
                    self.itemsImage.append(thumbURL)
                }
                print(self.itemsImage)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: - TableViewController Setting
    @IBAction func btn_searchClicked(_ sender: UIButton) {
        
        loadItemImage()
        
        // 버튼을 클릭 시 이미지 불러오는 함수가 실행되고 그 속에서
        // 저장되는 이미지를 넣어주고싶다. 이 부분에서 하는게 맞는건가?
        let task = UserShoppingList(item: tf_search.text!, favorite: false, check: false, itemImage: "")
        
        try! localRealm.write {
            localRealm.add(task) // create
            print("Realm Succeed")
            dismiss(animated: true)
        }
        
        
        tf_search.text = ""
        tableView.reloadData()
    }
    
    @IBAction func btn_favoriteClicked(_ sender: UIButton) {
        
        let taskToUpdate = tasks[sender.tag]
        try! localRealm.write {
            taskToUpdate.favorite = !taskToUpdate.favorite
        }
        tableView.reloadData()
        
    }
    
    @IBAction func btn_checkClicked(_ sender: UIButton) {
        
        let taskToUpdate = tasks[sender.tag]
        try! localRealm.write {
            taskToUpdate.check = !taskToUpdate.check
        }
        tableView.reloadData()
        
    }
    
    
    
    // section의 수 정하기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell // 타입 캐스팅
        
//        let imageURL = URL(string: tasks[indexPath.row].itemImage)
//        let imageData = try? Data(contentsOf: imageURL!)
        
        cell.lb_list.text = tasks[indexPath.row].item
        
        cell.lb_list.font = .boldSystemFont(ofSize: 20)
        cell.backgroundColor = .lightGray
        cell.btn_like.tintColor = .black
        cell.btn_check.tintColor = .black
        cell.layer.cornerRadius = 8
//        cell.itemImage.image = UIImage(data: imageData!)
        
        if self.tasks[indexPath.row].favorite {
            cell.btn_like.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else if !tasks[indexPath.row].favorite {
            cell.btn_like.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        if tasks[indexPath.row].check {
            cell.btn_check.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
         } else if !tasks[indexPath.row].check {
             cell.btn_check.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
         }
        
        cell.btn_like.tag = indexPath.row
        cell.btn_check.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRowAt")
        
        let vc = ShoppingItemDetailViewController()
        
        let sendData = tasks[indexPath.row]
        print(tasks[indexPath.row])
        vc.selectedItem = sendData.item
        vc.selectedCheck = sendData.check
        vc.selectedFavorite = sendData.favorite
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 삭제를 가능하게 하는 메서드
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 애플 제공 디폴트 기능 : commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let taskToDelete = tasks[indexPath.row]
            try! localRealm.write {
             localRealm.delete(taskToDelete)
             print("Delete Success")
            }
            tableView.reloadData()
        }
    }
    
    


}
