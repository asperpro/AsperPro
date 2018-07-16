//
//  RoleNameCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class RoleNameCell: BaseTVCell {
    
    
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        //        lb.backgroundColor = .tfColor()
        lb.text = "Регистрация СТО"
        lb.font = UIFont.systemFont(ofSize: 26)
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    
    let nameLB: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.text = "Выберите тип услуг, которые вы оказываете"
        lb.textColor = .lightGray
        return lb
    }()
    
    
    
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .mainBackground()
        addSubview(mainLabel)
        mainLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        addSubview(nameLB)
        nameLB.anchor(top: mainLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 33, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
    }
}
