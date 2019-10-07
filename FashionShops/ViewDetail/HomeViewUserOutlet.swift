//
//  TestView.swift
//  FashionShops
//
//  Created by RTC-HN154 on 10/4/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class HomeViewUserOutlet: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "items", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        for dic in myDict!.allValues as! [NSDictionary] {
            items.append(Item(name: dic["name"] as! String, content: dic["content"] as! String, nameImages: (dic["images"] as! NSArray) as! [String], price: dic["price"] as! String))
        }
        
        self.collectionView.register(UINib(nibName: "CellSetupByOutlet", bundle: nil), forCellWithReuseIdentifier: "CellSetupByOutlet")
        // Do any additional setup after loading the view.
    }
    

   

}

extension HomeViewUserOutlet: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellSetupByOutlet", for: indexPath) as! CellSetupByOutlet
        cell.bindingData(item: items[indexPath.item])
        
        return cell
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.bounds.width / 2.5) - 5, height: self.view.bounds.height / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listView = self.storyboard?.instantiateViewController(withIdentifier: "ListImages") as! ListImages
        listView.item = items[indexPath.item]
        self.navigationController?.pushViewController(listView, animated: true)
    }
    
}
