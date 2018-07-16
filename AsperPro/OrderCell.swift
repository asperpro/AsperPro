//
//  CustomCell.swift
//  AsperPro
//
//  Created by didarkam on 6/20/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class OrdersHistoryCell: UITableViewCell {
    
    
    var isNew = true
    
    func configureWith(orderViewModel: OrderViewModel){
        mainLabel.text = orderViewModel.carModelName
        timeLabel.text = orderViewModel.timeAgo
        
        if !orderViewModel.isRead {
            
            timeLabel.textColor = .mainBlue()
            blueCircle.isHidden = false
            
        } else {
            
            timeLabel.textColor = .black
            blueCircle.isHidden = true
        }
        
        if !isNew {
            print(orderViewModel.price)
            priceLabel.text = "Вы указали цену: \(orderViewModel.price) тг"
        } else {
            priceLabel.text = orderViewModel.commentText
        }
    }
    
    
    let blueCircle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.isHidden = false
        return view
    }()
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "BMW X6     2006"
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    let priceLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.text = "Вы указали цену: 20 000 тг"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.numberOfLines = 2
        return lb
    }()
    
    let timeLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightThin)
        lb.text = "1 мин назад"
        lb.textAlignment = .right
        return lb
    }()
    
    let arrowIV: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "02-path"))
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .black
        return iv
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        separatorInset = UIEdgeInsetsMake(0, 30, 0, 0)
        contentView.addSubview(blueCircle)
        blueCircle.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 10, height: 10)
        blueCircle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        contentView.addSubview(mainLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(arrowIV)
        
        
        mainLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: (frame.width / 2) + 15 , heightConstant: 18)
        
        timeLabel.anchor(top: mainLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 43, width: (frame.width - 100 ) / 2, height: 17)
        
        arrowIV.anchor(top: nil, left: timeLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 6, paddingBottom: 0, paddingRight: 0, width: 12, height: 12)
        arrowIV.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2).isActive = true
        
        priceLabel.anchor(nil, left: mainLabel.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 253, heightConstant: 32)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
