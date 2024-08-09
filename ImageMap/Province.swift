//
//  Province.swift
//  GMapsTest
//
//  Created by Federico Nieto on 1/15/18.
//  Copyright © 2018 fede. All rights reserved.
//

import UIKit

class Province: NSObject {
    
    var name : String
    var id : String
    var cities : [String]
    
    init(name : String, id : String, cities : [String]) {
        self.name = name
        self.id = id
        self.cities = cities
    }

}
