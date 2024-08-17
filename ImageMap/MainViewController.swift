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
        
        mapView.delegate = self
        
        scrollView.delegate = self
        scrollBlankView.belowView = mapView
    }
}

extension MainViewController: MapDelegate {
    func dismissProvinceSheet() {
        if let presentedViewController = self.presentedViewController as? ProvinceViewController {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    func presentProvinceSheet(provinceName: String) {
//        guard let presentedViewController = self.presentedViewController as? ProvinceViewController else {
//            let provinceViewController = UIViewController.getViewController(viewControllerEnum: .province)
//            if let provinceViewController = provinceViewController as? ProvinceViewController {
//                provinceViewController.provinceName = provinceName
//            }
//            if let sheet = provinceViewController.sheetPresentationController {
//                sheet.largestUndimmedDetentIdentifier = .medium
//                sheet.detents = [.medium(), .custom { context in return UIScreen.main.bounds.height/4 }]
//                sheet.prefersGrabberVisible = true
//            }
//            present(provinceViewController, animated: true)
//            return
//        }
//        presentedViewController.provinceName = provinceName
//        presentedViewController.initializeView()
        
        let provinceViewController = UIViewController.getViewController(viewControllerEnum: .province)
        if let provinceViewController = provinceViewController as? ProvinceViewController {
            provinceViewController.provinceName = provinceName
        }
        if let sheet = provinceViewController.sheetPresentationController {
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.detents = [.medium(), .custom { context in return UIScreen.main.bounds.height/4 }]
            sheet.prefersGrabberVisible = true
        }
        present(provinceViewController, animated: true)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        mapView.transformMapNode(origin: scrollView.contentOffset, size: scrollView.contentSize)
        return scrollBlankView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        print("**********************************")
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
