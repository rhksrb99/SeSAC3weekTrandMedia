//
//  RecommandCellInfoViewController.swift
//  SeSAC3weekTrandMedia
//
//  Created by 박관규 on 2022/07/21.
//

import UIKit

class RecommandCellInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func btn_web(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecommandWebInfoViewController") as! RecommandWebInfoViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
