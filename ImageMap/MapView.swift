//
//  MyView.swift
//  GettingStarted
//
//  Created by Yuri Strot on 11/9/16.
//  Copyright © 2016 Exyte. All rights reserved.
//

import Macaw

class MapView: MacawView {
    
    
    required init?(coder aDecoder: NSCoder) {
        print("HI")
        
        let s = Shape(form: Rect(0, 0, 60, 60))
        let image = UIImage(named: "seoul.jpg")!
        let a = Image(
            image: image,
            aspectRatio: .slice,
            w: 50,
            h: 50,
//            place: .move(100, 100)
            place: .move(10, 10)
        )
        print(a.bounds)
        let g = Group(contents: [a, s])
        let shape = Shape(
            form: Rect(x: 0, y: 0, w: 200, h: 500),
            fill: Pattern(content: g, bounds: g.bounds!, userSpace: true),
            stroke: Stroke(fill: Color(val: 0xff9e4f), width: 1))
        
//        print(a.bounds)
        super.init(node: Group(contents: [shape]), coder: aDecoder)
    }
    
}
