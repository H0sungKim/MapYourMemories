//
//  ProvinceViewController.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.16.
//

import UIKit

class ProvinceViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    
    var provinceName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
    }
    
    func initializeView() {
        if let provinceName = provinceName {
            lbTitle.text = provinceName
        }
    }
}
