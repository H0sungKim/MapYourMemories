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
        
//        scrollEventSubject
//            .throttle(for: .milliseconds(100), scheduler: DispatchQueue.main, latest: false)
//            .sink { [weak self] scrollView in
//                print("###########################")
//                self?.mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
//                var dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "HH:mm:ss:SSS"
//                print("1 : \(dateFormatter.string(from: Date()))")
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
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("@@@@@@@@@@@@@@@@@@")
        print("\(scrollView.contentOffset) \(scrollView.contentSize)")
        print("\(scrollView.bounds)")
//        mapView.mapBounds = CGRect(x: scrollView.contentOffset.x*scrollView.bounds.width/scrollView.contentSize.width, y: scrollView.contentOffset.y*scrollView.bounds.height/scrollView.contentSize.height, width: mapView.mapNodeBounds.width*scrollView.bounds.width/scrollView.contentSize.width, height: mapView.mapNodeBounds.height*scrollView.bounds.height/scrollView.contentSize.height)
        mapView.screenBounds = CGRect(x: scrollView.contentOffset.x*mapView.svgBounds.width/scrollView.contentSize.width, y: scrollView.contentOffset.y*mapView.svgBounds.width/scrollView.contentSize.width, width: scrollView.bounds.width*mapView.svgBounds.width/scrollView.contentSize.width, height: scrollView.bounds.height*mapView.svgBounds.width/scrollView.contentSize.width)
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm:ss:SSS"
//        print("0 : \(dateFormatter.string(from: Date()))")
//        DispatchQueue.global().async { [weak self] in
//            self?.scrollEventSubject.send(scrollView)
//            self?.mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
//        }
//        print("4 : \(dateFormatter.string(from: Date()))")
        mapView.transformMapNode(origin: scrollView.contentOffset, size: scrollView.contentSize)
        
//        mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
        return scrollBlankView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("******************")
        print("\(scrollView.contentOffset) \(scrollView.contentSize)")
        print("\(scrollView.bounds)")
//        mapView.mapBounds = CGRect(x: scrollView.contentOffset.x*scrollView.bounds.width/scrollView.contentSize.width, y: scrollView.contentOffset.y*scrollView.bounds.height/scrollView.contentSize.height, width: mapView.mapNodeBounds.width*scrollView.bounds.width/scrollView.contentSize.width, height: mapView.mapNodeBounds.height*scrollView.bounds.height/scrollView.contentSize.height)
        mapView.screenBounds = CGRect(x: scrollView.contentOffset.x*mapView.svgBounds.width/scrollView.contentSize.width, y: scrollView.contentOffset.y*mapView.svgBounds.width/scrollView.contentSize.width, width: scrollView.bounds.width*mapView.svgBounds.width/scrollView.contentSize.width, height: scrollView.bounds.height*mapView.svgBounds.width/scrollView.contentSize.width)
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm:ss:SSS"
//        print("0 : \(dateFormatter.string(from: Date()))")
//        DispatchQueue.global().async { [weak self] in
//            self?.mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
//        }
//        print("4 : \(dateFormatter.string(from: Date()))")
        mapView.transformMapNode(origin: scrollView.contentOffset, size: scrollView.contentSize)
//        mapView.transformMapNode = (scrollView.contentOffset, scrollView.contentSize)
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
