//
//  Item.swift
//  FashionShops
//
//  Created by RTC-HN154 on 10/4/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String?
    var content: String?
    var nameImages = [String]()
    var price: String?
    
    init(name: String, content: String, nameImages: [String], price: String) {
        self.name = name
        self.content = content
        self.nameImages = nameImages
        self.price = price
    }
}
