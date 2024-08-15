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
//        mapView.transformMapNode(origin: CGPoint(x: 0, y: 0), size: UIScreen.main.bounds.size)
        print(UIScreen.main.bounds.size)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        print("***********")
//        print(scrollView.contentOffset)
//        print(scrollView.contentSize)
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        mapView.transformMapNode(origin: scrollView.contentOffset, size: scrollView.contentSize)
        return scrollBlankView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        print("===============")
//        print(scrollView.contentOffset)
//        print(scrollView.contentSize)
        print("**********************************")
        mapView.transformMapNode(origin: scrollView.contentOffset, size: scrollView.contentSize)
//        return scrollBlankView
    }
}
