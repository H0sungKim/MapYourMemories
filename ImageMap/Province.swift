//
//  Province.swift
//  ImageMap
//
//  Created by 김호성 on 2024.08.09.
//

import UIKit

struct Province {
    var id : Int
    var name : String
    var image: UIImage?
    var color: UIColor?
    
    init(id: Int, name: String, image: UIImage? = nil) {
        self.id = id
        self.name = name
        self.image = image
    }
    
    mutating func setImage(image: UIImage) {
        self.image = image
        setColor(image: image)
    }
    
    mutating func setColor(color: UIColor) {
        self.color = color
    }
    
    mutating func setColor(image: UIImage) {
        self.color = image.dominantColor
    }
}
