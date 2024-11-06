//
//  MapView.swift
//  SVGMapSample
//
//  Created by 김호성 on 2024.10.05.
//

import UIKit
import Macaw

class MapView: MacawView {
    
    public var map: Group
    weak var delegate: MapDelegate?
    
    var galleries: [SouthKoreaProvinceEnum: [UIImage]] = [
        .seoul_mapo_gu: [UIImage(named: "hongik.heic")!],
        .gangwon_do_inje_gun: [UIImage(named: "inje.jpeg")!],
        .gyeongsangbuk_do_sangju_si: [UIImage(named: "sangju.png")!],
    ]
    
    required init?(coder aDecoder: NSCoder) {
        map = Group()
        super.init(node: map, coder: aDecoder)
    }
    
    override func layoutSubviews() {
        let svg = try! SVGParser.parse(resource: "korea")
        let rate = min(frame.width/svg.bounds!.w, frame.height/svg.bounds!.h)
        map = Group(contents: [svg], place: .identity)
        map.place = .identity.scale(rate, rate).move(frame.width - (svg.bounds!.w * rate), frame.height - (svg.bounds!.h * rate))
        
        self.node = map
        
        for southKoreaProvince in SouthKoreaProvinceEnum.allCases {
            map.nodeBy(tag: southKoreaProvince.rawValue)?.onTouchPressed({ [weak self] touch in
                self?.delegate?.onClickProvince(province: southKoreaProvince)
                if let shape = touch.node as? Shape {
                    let select: Shape = Shape(
                        form: shape.form,
                        stroke: Stroke(fill: Color.red, width: shape.stroke!.width*5),
                        place: shape.place,
                        clip: shape.clip
                    )
                    self?.map.contents.append(select)
                }
                print(southKoreaProvince.title)
            })
            
            if let mapShape = map.nodeBy(tag: southKoreaProvince.rawValue) as? Shape {
                mapShape.fill = Color.gray
            }
            
        }
        setBackGround()
    }
    
    private func setNodeBackGroundImage(node: Node?, image: UIImage) -> Shape? {
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
    
    func setBackGround() {
        for southKoreaProvince in SouthKoreaProvinceEnum.allCases {
            if let image = galleries[southKoreaProvince]?.first {
                setNodeBackGroundImage(node: map.nodeBy(tag: southKoreaProvince.rawValue), image: image)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<MTouch>, with event: MEvent?) {
        removeSelectShape()
        super.touchesBegan(touches, with: event)
        if map.contents.count == 1 {
            delegate?.onClickProvince(province: nil)
        }
    }
    
    func removeSelectShape() {
        map.contents.removeSubrange(1..<map.contents.count)
    }
}

protocol MapDelegate: AnyObject {
    func onClickProvince(province: ProvinceType?)
}
