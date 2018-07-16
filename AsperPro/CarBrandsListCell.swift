//
//  CarBrandsListCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class CarBrandsListCell: BaseTVCell {
    
    var delegate: CarBrandsListDelegate?
   
    let carsListLB: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.textColor = .lightGray
        lb.backgroundColor = .mainBackground()
        return lb
    }()
    
    lazy var plusPhotoButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "addDetail"), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        return button
        
    }()
    
    func handlePlusPhoto(){
        
        delegate?.handleCarBrandsListVC()
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .mainBackground()
        addSubview(carsListLB)
        carsListLB.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: carsListLB.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 78, height: 78)
        plusPhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
}

