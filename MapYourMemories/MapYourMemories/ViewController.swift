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
    
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivThumbnail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        mapView.delegate = self
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
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                self?.mapView.contentScaleFactor = scrollView.zoomScale + 5
            }
        }
    }
}


extension ViewController: MapDelegate {
    
    func onClickProvince(province: ProvinceType?) {
        if let province = province {
            lbTitle.text = province.title
            ivThumbnail.image = mapView.galleries[province as! SouthKoreaProvinceEnum]?.first
        } else {
            lbTitle.text = "대한민국"
            ivThumbnail.image = nil
        }
    }
}


extension ViewController: UISheetPresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        mapView.removeSelectShape()
    }
}
