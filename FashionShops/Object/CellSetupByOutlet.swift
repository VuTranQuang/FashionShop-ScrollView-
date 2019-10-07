//
//  CellTest.swift
//  FashionShops
//
//  Created by RTC-HN154 on 10/4/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class CellSetupByOutlet: UICollectionViewCell {

    @IBOutlet weak var imageTest: UIImageView!
    @IBOutlet weak var contentTest: UILabel!
    @IBOutlet weak var priceTest: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindingData(item: Item) {
        self.imageTest.image = UIImage(named: item.nameImages[0] + ".jpg")
        self.contentTest.text = item.name
        self.priceTest.text = item.price
    }
    
    override var isSelected: Bool {
        didSet {
            imageTest.layer.borderWidth = isSelected ? 2 : 0
            contentTest.textColor = isSelected ? UIColor.init(red: 0, green: 100/225, blue: 255/255, alpha: 1) : UIColor.white
            imageTest.layer.borderColor = UIColor.blue.cgColor
        }
    }

}
