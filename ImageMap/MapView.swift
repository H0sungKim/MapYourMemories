//
//  MyView.swift
//  GettingStarted
//
//  Created by Yuri Strot on 11/9/16.
//  Copyright © 2016 Exyte. All rights reserved.
//

import Macaw
import Combine

class MapView: MacawView {
    private var mapNode: Group
    weak var delegate: MapDelegate?
    @Published var transformMapNode: (origin: CGPoint, size: CGSize)?
    
    required init?(coder aDecoder: NSCoder) {
        let map = try! SVGParser.parse(resource: "korea")
        mapNode = Group(contents: [map], place: .identity)
        super.init(node: mapNode, coder: aDecoder)
        
        for province in ProvinceManager.shared.provinces {
            map.nodeBy(tag: String(province.id))?.onTouchPressed({ [weak self] touch in
                self?.setBackGroundImage(node: touch.node!, image: UIImage(named: "rocket.jpeg")!)
                self?.delegate?.presentProvinceSheet(provinceName: province.name)
                if let shape = touch.node as? Shape {
                    let select: Shape = Shape(
                        form: shape.form,
//                        fill: Color.rgba(r: 255, g: 255, b: 255, a: 64),
                        stroke: Stroke(fill: Color.red, width: shape.stroke!.width*3),
                        place: shape.place,
                        clip: shape.clip
                    )
                    self?.mapNode.contents.append(select)
                }
                print(self?.mapNode.contents.count)
            })
        }
    }
    
    func setBackGroundImage(node: Node, image: UIImage) -> Shape? {
        if let shape = node as? Shape {
            let backgroundShape = Shape(form: Rect(0, 0, shape.bounds!.x+shape.bounds!.w, shape.bounds!.y+shape.bounds!.h))
            let image = Image(
                image: image,
                aspectRatio: .slice,
                w: Int(shape.bounds!.w),
                h: Int(shape.bounds!.h)
            )
            image.place = .move(shape.bounds!.x+(shape.bounds!.w-image.bounds!.w)/2, shape.bounds!.y+(shape.bounds!.h-image.bounds!.h)/2)
            let resizedImage = Group(contents: [backgroundShape, image])
            shape.fill = Pattern(content: resizedImage, bounds: resizedImage.bounds!, userSpace: true)
            return shape
        }
        return nil
    }
    
    func transformMapNode(origin: CGPoint, size: CGSize) {
        mapNode.place = Transform().move(-origin.x, -origin.y).scale(min(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h), min(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h))
        print("Complete Transform")
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm:ss:SSS"
//        print("Hosung.Kim : \(dateFormatter.string(from: Date()))")
    }
    override func touchesBegan(_ touches: Set<MTouch>, with event: MEvent?) {
        delegate?.dismissProvinceSheet()
        removeSelectShape()
        super.touchesBegan(touches, with: event)
        print(mapNode.contents.count)
    }
    
    func removeSelectShape() {
        mapNode.contents.removeSubrange(1..<mapNode.contents.count)
    }
}

protocol MapDelegate: AnyObject {
    func dismissProvinceSheet()
    func presentProvinceSheet(provinceName: String)
}
