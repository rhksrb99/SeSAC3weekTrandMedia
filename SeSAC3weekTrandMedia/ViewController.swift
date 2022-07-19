//
//  ViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var dateLabel2: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    @IBOutlet weak var SecondViewLeadingConstraint: NSLayoutConstraint!
    
    // 자주 사용하는 건 전역변수로 사용하면 메모리에 더 좋다.
    // DateFormatter라는 클래스를 초기화
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewDidLoad에 선언한다면 화면이 켜질 때 기본적으로 실행이 되기 때문에
        // 액션에 넣는 것 보다는 효율적이라고 생각할 수 있다.
        format.dateFormat = "yyyy년 MM월 dd일"
        // 포멧 코드를 전역변수로 선언할 수 없는 이유
        // 1. 클래스와 구조체가 가질 수 있는 건 변수와 함수이다.
        //    -> 멤버만을 = 프로퍼티와 메서드) 가질 수 있다.
        
        // UIAlertController.init 이 원래의 형태
//        UIAlertController.init(title: <#T##String?#>, message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
        // 아래의 코드는 생략된 코드이다.
//        UIAlertController(title: <#T##String?#>, message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
        
        SecondViewLeadingConstraint.constant = 120
        
    }


    func configureLabelDesign() {
        // 1. OutletCollection
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .systemMint
        }
        
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번째 텍스트"
        
        // 2. UILabel
        
        let labelArray = [dateLabel, dateLabel2]
        for i in labelArray{
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .systemMint
        }
        
        dateLabel.text = "첫번째 텍스트"
        dateLabel2.text = "두번째 텍스트"
        
    }
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        
        
        
        // datepicker에서 선택된 값을 받아와서 위와같은 형태로 스트링 값으로 포멧
        dateLabel.text = format.string(from: sender.date)
        
    }
}

