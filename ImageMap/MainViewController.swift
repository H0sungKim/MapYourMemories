//
//  MainViewController.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import UIKit
import Macaw

class MainViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapView: MapView!
    private var provinces = ProvincesHelper.provinces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        
        
        for province in provinces {
            mapView.node.nodeBy(tag: province.id)?.onTouchPressed({ touch in
                if let shape = touch.node as? Shape {
                    
                    let backgroundShape = Shape(form: Rect(0, 0, shape.bounds!.x+shape.bounds!.w, shape.bounds!.y+shape.bounds!.h))
                    let image = Image(
                        image: UIImage(named: "seoul.jpg")!,
                        aspectRatio: .slice,
                        w: Int(shape.bounds!.w),
                        h: Int(shape.bounds!.h)
                    )
                    image.place = .move(shape.bounds!.x+(shape.bounds!.w-image.bounds!.w)/2, shape.bounds!.y+(shape.bounds!.h-image.bounds!.h)/2)
                    let resizedImage = Group(contents: [backgroundShape, image])
                    shape.fill = Pattern(content: resizedImage, bounds: resizedImage.bounds!, userSpace: true)
                }
            })
        }
        
    }
}

extension MainViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print(scrollView.contentOffset)
        print(scrollView.contentSize)
        return mapView
    }
}
