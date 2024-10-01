//
//  MapView.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import Macaw
import Combine

class MapView: MacawView {
    var scrollViewBounds: CGRect?
    
    private var imageMap: Group
    private var colorMap: Group
    private var screenBounds: CGRect?
    private let svgBounds: CGRect
    
    private var commonTransform: Transform = Transform()
    
    weak var delegate: MapDelegate?
//    @Published var transformMapNode: (origin: CGPoint, size: CGSize)?
    
    required init?(coder aDecoder: NSCoder) {
        let svg1 = try! SVGParser.parse(resource: "korea")
        let svg2 = try! SVGParser.parse(resource: "korea")
        imageMap = Group(contents: [svg1], place: .identity)
        colorMap = Group(contents: [svg2], place: .identity)
        svgBounds = colorMap.bounds!.toCG()
        
        super.init(node: imageMap, coder: aDecoder)
        
        for province in ProvinceManager.shared.provinces {
            imageMap.nodeBy(tag: String(province.id))?.onTouchPressed({ [weak self] touch in
                self?.delegate?.presentProvinceSheet(provinceName: province.name)
                if let shape = touch.node as? Shape {
                    let select: Shape = Shape(
                        form: shape.form,
//                        fill: Color.rgba(r: 255, g: 255, b: 255, a: 64),
                        stroke: Stroke(fill: Color.red, width: shape.stroke!.width*3),
                        place: shape.place,
                        clip: shape.clip
                    )
                    self?.imageMap.contents.append(select)
//                    for province in ProvinceManager.shared.provinces {
//                        print("\(province.name) \(map.nodeBy(tag: String(province.id))?.bounds)")
//                    }
                }
                print(self?.imageMap.contents.count)
            })
        }
    }
    
    private func setBackGroundImage(node: Node, image: UIImage) -> Shape? {
        guard let shape = node as? Shape else {
            return nil
        }
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
    
    private func setBackGroundColor(node: Node, image: UIImage) -> Shape? {
        guard let shape = node as? Shape else {
            return nil
        }
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
           
        image.dominantColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        shape.fill = Color.rgba(r: Int(red), g: Int(green), b: Int(blue), a: alpha)
    
        return shape
    }
    
    private func setBackGroundColor(node: Node, color: UIColor) -> Shape? {
        guard let shape = node as? Shape else {
            return nil
        }
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
           
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        shape.fill = Color.rgba(r: Int(red*255), g: Int(green*255), b: Int(blue*255), a: alpha)
    
        return shape
    }
    
    func setMapBackGrounds() {
        for province in ProvinceManager.shared.provinces {
            if let image = province.image {
                setBackGroundImage(node: imageMap.nodeBy(tag: String(province.id))!, image: image)
            }
            if let color = province.color {
                setBackGroundColor(node: colorMap.nodeBy(tag: String(province.id))!, color: color)
            }
        }
    }
    
//    private func transformImageMap(origin: CGPoint, size: CGSize) {
//        imageMap.place = Transform().move(-origin.x, -origin.y).scale(min(size.width/imageMap.bounds!.w, size.height/imageMap.bounds!.h), min(size.width/imageMap.bounds!.w, size.height/imageMap.bounds!.h))
//        self.node = imageMap
//        if let scrollViewBounds = scrollViewBounds {
//            screenBounds = CGRect(x: origin.x*svgBounds.width/size.width, y: origin.y*svgBounds.width/size.width, width: scrollViewBounds.width*svgBounds.width/size.width, height: scrollViewBounds.height*svgBounds.width/size.width)
//        }
//        // check node count and set background
//        var temp = 0
//        for province in ProvinceManager.shared.provinces {
//            guard let provinceBounds = colorMap.nodeBy(tag: String(province.id))?.bounds?.toCG(), let screenBounds = screenBounds else {
//                continue
//            }
////            print(province.name)
////            print(mapBounds)
////            print(provinceBounds)
//            if CGRectIntersectsRect(screenBounds, provinceBounds) {
////                print("@@@@@@@@\(province.name)")
//                temp += 1
//            }
//        }
//        print(temp)
//    }
//    private func transformColorMap(origin: CGPoint, size: CGSize) {
//        colorMap.place = Transform().move(-origin.x, -origin.y).scale(min(size.width/colorMap.bounds!.w, size.height/colorMap.bounds!.h), min(size.width/colorMap.bounds!.w, size.height/colorMap.bounds!.h))
//        self.node = colorMap
//        if let scrollViewBounds = scrollViewBounds {
//            screenBounds = CGRect(x: origin.x*svgBounds.width/size.width, y: origin.y*svgBounds.width/size.width, width: scrollViewBounds.width*svgBounds.width/size.width, height: scrollViewBounds.height*svgBounds.width/size.width)
//        }
//        // check node count and set background
//        var temp = 0
//        for province in ProvinceManager.shared.provinces {
//            guard let provinceBounds = colorMap.nodeBy(tag: String(province.id))?.bounds?.toCG(), let screenBounds = screenBounds else {
//                continue
//            }
////            print(province.name)
////            print(mapBounds)
////            print(provinceBounds)
//            if CGRectIntersectsRect(screenBounds, provinceBounds) && province.image != nil {
////                print("@@@@@@@@\(province.name)")
//                temp += 1
//            }
//        }
//        print(temp)
//    }
    
    func setImageMap() {
        self.node = imageMap
        imageMap.place = commonTransform
    }
    
    func transformMap(origin: CGPoint, size: CGSize) {
        if let scrollViewBounds = scrollViewBounds {
            screenBounds = CGRect(x: origin.x*svgBounds.width/size.width, y: origin.y*svgBounds.width/size.width, width: scrollViewBounds.width*svgBounds.width/size.width, height: scrollViewBounds.height*svgBounds.width/size.width)
        }
        var temp = 0
        for province in ProvinceManager.shared.provinces {
            guard let provinceBounds = imageMap.nodeBy(tag: String(province.id))?.bounds?.toCG(), let screenBounds = screenBounds else {
                continue
            }
            
//            print(province.name)
//            print(mapBounds)
//            print(provinceBounds)
//            if CGRectIntersectsRect(screenBounds, provinceBounds) && province.image != nil {
            if CGRectIntersectsRect(screenBounds, provinceBounds) && province.image != nil {
//                print("@@@@@@@@\(province.name)")
                
                temp += 1
            }
        }
        print(temp)
        var map = temp > 5 ? colorMap : imageMap
        commonTransform = Transform().move(-origin.x, -origin.y).scale(min(size.width/colorMap.bounds!.w, size.height/colorMap.bounds!.h), min(size.width/colorMap.bounds!.w, size.height/colorMap.bounds!.h))
        map.place = commonTransform
        self.node = map
        
    }
    
    override func touchesBegan(_ touches: Set<MTouch>, with event: MEvent?) {
        delegate?.dismissProvinceSheet()
        removeSelectShape()
        super.touchesBegan(touches, with: event)
    }
    
    func removeSelectShape() {
        imageMap.contents.removeSubrange(1..<imageMap.contents.count)
    }
}

protocol MapDelegate: AnyObject {
    func dismissProvinceSheet()
    func presentProvinceSheet(provinceName: String)
}
//
