//
//  MainViewController.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import UIKit
import Macaw

class MainViewController: UIViewController {

    @IBOutlet weak var mapView: SVGView!
    private var provinces = ProvincesHelper.provinces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        for province in provinces {
            mapView.node.nodeBy(tag: province.id)?.onTouchPressed({ touch in
                if let shape = touch.node as? Shape {
                    let image = UIImage(named: "seoul.jpg")!
                    
                    
                    
                    let croppedImage = resizeImage(image: image, x: shape.bounds!.x, y: shape.bounds!.y, width: shape.bounds!.w, height: shape.bounds!.h)
//                    image?.width = shape.bounds.w
//                    image?.height = shape.bounds.h
//                    let macawImage = Image(image: croppedImage, w: image.size.width, h: image.size.height)
                    
//                    Image(image: <#T##MImage#>, xAlign: <#T##Align#>, yAlign: <#T##Align#>, w: <#T##Int#>, h: <#T##Int#>, place: <#T##Transform#>)
//                    macawImage.xAlign = shape.bounds?.x
//                    macawImage.w = Int(shape.bounds!.w)
//                    macawImage.h = Int(shape.bounds!.h)
                    
                    
//                    macawImage.bounds = shape.bounds
//                    Image(image: UIImage(named: "universe.jpg")!
//                    print(croppedImage.size)
                    print(croppedImage?.size)
                    print(shape.bounds)
//                    print(macawImage.bounds)
                    shape.fill = Pattern(content: Image(image: croppedImage!), bounds: shape.bounds!, userSpace: true)
                    
                    print("HA")
                }
            })
        }
        
    }
}

func resizeImage(image: UIImage, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIImage? {
    let ratio = min(image.size.width / width, image.size.height / height)
    let newSize = CGSize(width: width+x, height: height+y)
    
    let renderer = UIGraphicsImageRenderer(size: newSize)
    
    let resizedImage = renderer.image { context in
        image.draw(in: CGRect(x: x, y: y, width: image.size.width/ratio, height: image.size.height/ratio))
    }
    return resizedImage
}
