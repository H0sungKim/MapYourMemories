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
    private var provinces = ProvincesHelper.provinces()
    
    required init?(coder aDecoder: NSCoder) {
        print("A")
        let map = try! SVGParser.parse(resource: "argentinaLow")
        for province in provinces {
            map.nodeBy(tag: province.id)?.onTouchPressed({ touch in
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
        mapNode = Group(contents: [map], place: .identity)
        
        super.init(node: mapNode, coder: aDecoder)
    }
    func transformMapNode(origin: CGPoint, size: CGSize) {
        mapNode.place = Transform().move(-origin.x, -origin.y).scale(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h)
    }
}
