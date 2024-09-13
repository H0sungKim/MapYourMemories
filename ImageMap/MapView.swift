//
//  MapView.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import Macaw
import Combine

class MapView: MacawView {
    private var mapNode: Group
    var screenBounds: CGRect?
    let svgBounds: CGRect
    weak var delegate: MapDelegate?
//    @Published var transformMapNode: (origin: CGPoint, size: CGSize)?
    
    required init?(coder aDecoder: NSCoder) {
        let map = try! SVGParser.parse(resource: "korea")
        mapNode = Group(contents: [map], place: .identity)
        print("Hosung.Kim")
        print(mapNode.bounds)
        svgBounds = mapNode.bounds!.toCG()
        super.init(node: mapNode, coder: aDecoder)
        
        for province in ProvinceManager.shared.provinces {
            mapNode.nodeBy(tag: String(province.id))?.onTouchPressed({ [weak self] touch in
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
//                    for province in ProvinceManager.shared.provinces {
//                        print("\(province.name) \(map.nodeBy(tag: String(province.id))?.bounds)")
//                    }
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
        // check node count and set background
        var temp = 0
        for province in ProvinceManager.shared.provinces {
            guard let provinceBounds = mapNode.nodeBy(tag: String(province.id))?.bounds?.toCG(), let screenBounds = screenBounds else {
                continue
            }
//            print(province.name)
//            print(mapBounds)
//            print(provinceBounds)
            if CGRectIntersectsRect(screenBounds, provinceBounds) {
                print("@@@@@@@@\(province.name)")
                temp += 1
            }
        }
        print(temp)
//        guard let provinceBounds = mapNode.nodeBy(tag: "11110")?.bounds?.toCG(), let mapBounds = mapBounds else {
//            return
//        }
//        
//        print(mapBounds)
//        print(provinceBounds)
//        print(CGRectContainsRect(mapBounds, provinceBounds))
        
        mapNode.place = Transform().move(-origin.x, -origin.y).scale(min(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h), min(size.width/mapNode.bounds!.w, size.height/mapNode.bounds!.h))
//        print("Complete Transform")
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm:ss:SSS"
//        print("5 : \(dateFormatter.string(from: Date()))")
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
