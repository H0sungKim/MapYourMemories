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
        
        if let provinceName = provinceName {
            lbTitle.text = provinceName
        }
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
