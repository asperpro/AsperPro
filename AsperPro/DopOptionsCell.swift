//
//  DopOptionsCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class DopOptionsCell: BaseTVCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let itemCellId = "itemCellId"
    
    
    var extrasArray: [Service]!{
        didSet{
            dopOptionsCollectionView.reloadData()
        }
    }
    
    
    
    let optionsLB: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "Дополнительные опции"
        lb.textColor = .lightGray
        lb.backgroundColor = .mainBackground()
        return lb
    }()
    
    
    
    
    lazy var dopOptionsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.backgroundColor = .mainBackground()
        cv.dataSource = self
        cv.delegate = self
        cv.allowsMultipleSelection = true
        cv.isScrollEnabled = false
        return cv
        
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .mainBackground()
        dopOptionsCollectionView.register(ItemCell.self, forCellWithReuseIdentifier: itemCellId)
        dopOptionsCollectionView.contentInset = UIEdgeInsetsMake(15, 16, 15, 16)
        
        addSubview(optionsLB)
        optionsLB.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 16)
        
        
        addSubview(dopOptionsCollectionView)
        dopOptionsCollectionView.anchor(top: optionsLB.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height:0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCellId, for: indexPath) as! ItemCell
        cell.serviceOrExtraOption = extrasArray[indexPath.item]
        
        cell.isExtraOptionMode = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return extrasArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width - 32 - 22 ) / 3, height: 40)
        
    }
    
    
}


