//
//  MyView.swift
//  GettingStarted
//
//  Created by Yuri Strot on 11/9/16.
//  Copyright © 2016 Exyte. All rights reserved.
//

import Macaw

class MapView: MacawView {
    private var mapNode: Group
    weak var delegate: MapDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        let map = try! SVGParser.parse(resource: "korea")
        mapNode = Group(contents: [map], place: .identity)
        super.init(node: mapNode, coder: aDecoder)
        
        for province in ProvinceManager.shared.provinces {
            map.nodeBy(tag: String(province.id))?.onTouchPressed({ [weak self] touch in
                
                print(province.name)
                self?.delegate?.presentProvinceSheet(provinceName: province.name)
                
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
    func transformMapNode(origin: CGPoint, size: CGSize) {
//        print("size : \(size), bounds : \(mapNode.bounds)")
        mapNode.place = Transform().move(-origin.x, -origin.y).scale(min(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h), min(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h))
//        print(mapNode.place.m11)
//        print(mapNode.place.m22)
    }
}

protocol MapDelegate: AnyObject {
    func presentProvinceSheet(provinceName: String)
}
