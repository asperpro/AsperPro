//
//  ServicesCVCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit



class ServicesCVCell: BaseTVCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let itemCellId = "itemCellId"
    
    var servicesArray: [Service]!{
        didSet{
            servicesCollectionView.reloadData()
        }
    }
    
    
    
    lazy var servicesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.backgroundColor = .mainBackground()
        cv.dataSource = self
        cv.delegate = self
        cv.allowsMultipleSelection = true
        return cv
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        servicesCollectionView.register(ItemCell.self, forCellWithReuseIdentifier: itemCellId)
        servicesCollectionView.contentInset = UIEdgeInsetsMake(17, 16, 0, 16)
        servicesCollectionView.scrollIndicatorInsets = UIEdgeInsetsMake(17, 16, 0, 16)
        
        addSubview(servicesCollectionView)
        servicesCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - 32 - 22 ) / 3, height: 38)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCellId, for: indexPath) as! ItemCell
        cell.serviceOrExtraOption = servicesArray[indexPath.item]
        return cell
    }
}
