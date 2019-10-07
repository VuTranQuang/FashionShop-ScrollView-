//
//  ListImages.swift
//  FashionShops
//
//  Created by RTC-HN154 on 10/4/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class ListImages: UIViewController {

    @IBOutlet weak var nameShop: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var contentShop: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameShop.text = item.name
        contentShop.text = item.content
        imgProfile.image = UIImage(named: item.nameImages[0] + ".jpg")
        imgProfile.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImgView))
        imgProfile.addGestureRecognizer(tap)
    }
    
    // MARK: set index và truyền ảnh được trọn sang ScrollView
    func pushView(index: Int) {
        let listView = self.storyboard?.instantiateViewController(withIdentifier: "test") as! CrollView
        listView.currentPage = index
        listView.pageImages = item.nameImages
        self.navigationController?.pushViewController(listView, animated: true)
    }
    
    @objc func tapImgView() {
        pushView(index: 0)
    }
  

}

extension ListImages: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.nameImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellSetupByCode
        cell.kCellWidth = 60
        cell.addSubViews(checkAddAll: false)
        cell.imgView?.contentMode = .scaleAspectFit
        cell.imgView?.image = UIImage(named: item.nameImages[indexPath.item] + ".jpg")


        return cell
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushView(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
}
