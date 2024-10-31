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
    
    required init?(coder aDecoder: NSCoder) {
        map = Group()
        super.init(node: map, coder: aDecoder)
    }
    
    override func layoutSubviews() {
        let svg = try! SVGParser.parse(resource: "korea")
        let rate = min(frame.width/svg.bounds!.w, frame.height/svg.bounds!.h)
        svg.place = .identity.scale(rate, rate).move(frame.width - (svg.bounds!.w * rate), frame.height - (svg.bounds!.h * rate))
        map = Group(contents: [svg], place: .identity)
        self.node = map
        
        for southKoreaProvince in SouthKoreaProvinceEnum.allCases {
            map.nodeBy(tag: String(southKoreaProvince.id))?.onTouchPressed({ touch in
                print(southKoreaProvince.title)
            })
            
            if let mapShape = map.nodeBy(tag: String(southKoreaProvince.id)) as? Shape {
                mapShape.fill = Color.gray
            }
        }
    }
    
    func transformMap(origin: CGPoint, scale: CGFloat) {
        map.place = Transform().move(-origin.x, -origin.y).scale(scale, scale)
    }
}
