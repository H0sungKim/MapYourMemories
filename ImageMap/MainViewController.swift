//
//  MainViewController.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import UIKit
import Macaw

class MainViewController: UIViewController {

    @IBOutlet weak var mapView: MapView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollBlankView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }
}

extension MainViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print(scrollView.contentOffset)
        print(scrollView.contentSize)
        mapView.transformMapNode(origin: scrollView.contentOffset, size: scrollView.contentSize)
        return scrollBlankView
    }
}
