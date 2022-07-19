//
//  TrendViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/19.
//

import UIKit

class TrendViewController: UIViewController {

    @IBOutlet weak var tf_main: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        tf_main.borderColor()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
