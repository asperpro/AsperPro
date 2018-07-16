//
//  CarNameCell.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class CarNameCell: BaseTVCell {
    
    func configureWith(orderViewModel: OrderViewModel){
        mainLabel.text = orderViewModel.carModelName
        if !orderViewModel.isRead {
            timeLabel.textColor = .mainBlue()
        } else {
            timeLabel.textColor = .black
        }
    }
        
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "BMW X6     2006"
        lb.adjustsFontSizeToFitWidth = true
        lb.font = UIFont.boldSystemFont(ofSize: 17)
        return lb
    }()
    
    
    let timeLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.text = "1 мин назад"
        lb.textAlignment = .right
        lb.font = UIFont.systemFont(ofSize: 12)
        return lb
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        contentView.backgroundColor = .white
        contentView.addSubview(mainLabel)
        contentView.addSubview(timeLabel)
        
        mainLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: centerXAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: -25, widthConstant: 0, heightConstant: 20)
        
        timeLabel.anchor(top: mainLabel.topAnchor, left: mainLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 20)
        
    }
}
