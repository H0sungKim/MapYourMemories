//
//  ViewController.swift
//  MapYourMemories
//
//  Created by 김호성 on 2024.10.31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MapView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("Zoom")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroll")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        mapView.contentScaleFactor = scrollView.zoomScale + 5
    }
}
