//
//  MainViewController.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import UIKit
import Macaw
import Combine

class MainViewController: UIViewController {
    
    private var scrollViewOnMoving: Bool = false

    @IBOutlet weak var mapView: MapView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollBlankView: ScrollBlankView!
    
    private var scrollEventSubject = PassthroughSubject<UIScrollView, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        scrollView.delegate = self
        scrollBlankView.belowView = mapView
        
        mapView.scrollViewBounds = scrollView.bounds
        
        ProvinceManager.shared.provinces[0].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[1].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[2].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[3].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[4].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[5].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[6].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[7].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[8].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[9].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[10].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[11].setImage(image: UIImage(named: "rocket.jpeg")!)
        ProvinceManager.shared.provinces[12].setImage(image: UIImage(named: "rocket.jpeg")!)
        
        mapView.setMapBackGrounds()
        
        mapView.transformMap(origin: scrollView.contentOffset, size: scrollView.contentSize)
//        scrollEventSubject
//            .throttle(for: .milliseconds(100), scheduler: DispatchQueue.main, latest: false)
//            .sink { [weak self] scrollView in
//                self?.mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
//            }
//            .store(in: &cancellables)
//        
//        mapView.$transformMapNode.sink(receiveCompletion: { completion in
//            print("complete \(completion)")
//        }, receiveValue: { [weak self] value in
//            print("value \(value)")
//            guard let value = value else {
//                return
//            }
//            DispatchQueue.main.async {
//                self?.mapView.transformMapNode(origin: value.origin, size: value.size)
//            }
//        })
//        .store(in: &cancellables)
    }
}

extension MainViewController: MapDelegate {
    func dismissProvinceSheet() {
        if let presentedViewController = self.presentedViewController as? ProvinceViewController {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    func presentProvinceSheet(provinceName: String) {
        let provinceViewController = UIViewController.getViewController(viewControllerEnum: .province)
        if let provinceViewController = provinceViewController as? ProvinceViewController {
            provinceViewController.provinceName = provinceName
        }
        if let sheet = provinceViewController.sheetPresentationController {
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.detents = [.medium(), .custom { context in return UIScreen.main.bounds.height/4 }]
            sheet.prefersGrabberVisible = true
            sheet.delegate = self
        }
        present(provinceViewController, animated: true)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("begindragging")
        scrollViewOnMoving = true
    }
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("beginzooming")
        scrollViewOnMoving = true
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("@@@@@@@@@@@@@@@@@@")
        print(scrollViewOnMoving)
//        print(scrollView.isZooming)
//        print(scrollView.isDragging)
//        print(scrollView.isTracking)
//        print(scrollView.isDecelerating)
//        print(scrollView.isZoomBouncing)
//        print(scrollView.is
//        print("\(scrollView.contentOffset) \(scrollView.contentSize)")
//        print("\(scrollView.bounds)")
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm:ss:SSS"
//        print("0 : \(dateFormatter.string(from: Date()))")
//        DispatchQueue.global().async { [weak self] in
//            self?.scrollEventSubject.send(scrollView)
//            self?.mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
//        }
//        print("4 : \(dateFormatter.string(from: Date()))")
        if scrollViewOnMoving {
            mapView.transformMap(origin: scrollView.contentOffset, size: scrollView.contentSize)
        }
//        mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
        return scrollBlankView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("******************")
        print(scrollViewOnMoving)
//        print("\(scrollView.contentOffset) \(scrollView.contentSize)")
//        print("\(scrollView.bounds)")
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm:ss:SSS"
//        print("0 : \(dateFormatter.string(from: Date()))")
//        DispatchQueue.global().async { [weak self] in
//            self?.mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
//        }
//        print("4 : \(dateFormatter.string(from: Date()))")
        if scrollViewOnMoving {
            mapView.transformMap(origin: scrollView.contentOffset, size: scrollView.contentSize)
        }
//        mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            print("end dragging")
            mapView.setImageMap()
            scrollViewOnMoving = false
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("end decelerating")
        mapView.setImageMap()
        scrollViewOnMoving = false
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("end zooming")
        mapView.setImageMap()
        scrollViewOnMoving = false
    }
}

extension MainViewController: UISheetPresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        mapView.removeSelectShape()
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
