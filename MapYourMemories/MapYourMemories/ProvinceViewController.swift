//
//  ProvinceViewController.swift
//  MapYourMemories
//
//  Created by 김호성 on 2024.11.06.
//

import UIKit

class ProvinceViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivThumbnail: UIImageView!
    
    var province: ProvinceType?
    var galleries: [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTitle.text = province?.title
        ivThumbnail.image = galleries?.first
        
    }
}
