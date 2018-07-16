//
//  CabinetPOICell.swift
//  AsperPro
//
//  Created by didarkam on 7/15/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class CabinetPOICell: BaseTVCell {
    
    let poiRoleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Автомойка"
        lb.font = UIFont.systemFont(ofSize: 13)
        
        lb.textColor = .white
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    lazy var viewDetailsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Посмотреть", for: UIControlState())
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        //        btn.layer.contentsScale = UIScreen.main.scale
        btn.layer.masksToBounds = true
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(handleViewBtn), for: .touchUpInside)
        return btn
    }()
    
    let poiTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Astana Car service"
        lb.textAlignment = .right
        lb.font = UIFont.systemFont(ofSize: 13)
        //        lb.layer.contentsScale = UIScreen.main.scale
        lb.adjustsFontSizeToFitWidth = true
        lb.textColor = .white
        return lb
    }()
    
    let poiImageView: CachedImageView = {
        
        let iv = CachedImageView()
        iv.image = #imageLiteral(resourceName: "skoda")
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 8
        
        iv.contentMode = .scaleToFill
        return iv
        
    }()
    
    func handleViewBtn(){
        print(123)
        
        
    }
    
    override func setupViews() {
        super.setupViews()
        
        let outerView = UIView()
        outerView.backgroundColor = .red
        contentView.addSubview(outerView)
        outerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 0)
        
        outerView.layer.masksToBounds = false
        outerView.layer.shadowColor = UIColor(red:0.28, green:0.53, blue:0.87, alpha:1.0).cgColor
        outerView.layer.shadowOpacity = 0.7
        outerView.layer.shadowOffset = CGSize(width: 0, height: 5)
        outerView.layer.shadowRadius = 5
        outerView.layer.shadowPath = nil
        
        outerView.layer.shouldRasterize = false
        outerView.layer.cornerRadius = 8.0
        
        
        
        outerView.addSubview(poiImageView)
        poiImageView.fillSuperview()
        
        
        poiImageView.addSubview(poiRoleLabel)
        poiRoleLabel.anchor(top: poiImageView.topAnchor, left: poiImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 11, paddingBottom: 0, paddingRight: 0, width: 120, height: 15)
        
        poiImageView.addSubview(poiTitleLabel)
        poiTitleLabel.anchor(top: nil, left: nil, bottom: poiImageView.bottomAnchor, right: poiImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 26, paddingRight: 38, width: 130, height: 16)
        
        contentView.addSubview(viewDetailsButton)
        viewDetailsButton.anchor(top: nil, left: poiImageView.leftAnchor, bottom: poiImageView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 11, paddingBottom: 12, paddingRight: 0, width: 120, height: 42)
        
        
        
        
    }
}
