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
    @IBOutlet weak var scrollBlankView: ScrollBlankView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollBlankView.belowView = mapView
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

class ScrollBlankView: UIView {
    var belowView: UIView?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        belowView?.touchesBegan(touches, with: event)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        belowView?.touchesMoved(touches, with: event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        belowView?.touchesEnded(touches, with: event)
    }
}
