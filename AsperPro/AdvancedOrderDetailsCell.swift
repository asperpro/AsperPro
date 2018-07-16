//
//  AdvancedOrderDetailsCell.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class AutoPartsOrderDetailsCell: BaseTVCell {
    
    
    
    let typeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "8H")
        return iv
    }()
    
    
    let typeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Двигатель"
        lb.font = UIFont.systemFont(ofSize: 14)
        return lb
    }()
    
    
    
    let descriptionImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "2H")
        
        return iv
    }()
    
    
    
    
    let fromImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "2G")
        return iv
    }()
    
    
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Описание проблемы. Или описание автозапчасти, которую ищет пользователь. Необходимо, чтобы описание занимало 3 строки максимум."
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.numberOfLines = 3
        
        return lb
    }()
    
    
    
    let fromLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Посмотреть фотографии"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.numberOfLines = 3
        
        return lb
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        
        
        contentView.addSubview(typeImageView)
        typeImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 13, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 21, height: 21)
        
        contentView.addSubview(typeLabel)
        typeLabel.anchor(top: nil, left: typeImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 11.5, paddingBottom: 0, paddingRight: 40, width: 0, height: 14)
        typeLabel.centerYAnchor.constraint(equalTo: typeImageView.centerYAnchor).isActive = true
        
        
        
        
        contentView.addSubview(descriptionImageView)
        descriptionImageView.anchor(top: typeImageView.bottomAnchor, left: typeImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 13, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 21, height: 21)
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: descriptionImageView.topAnchor, left: typeLabel.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: -8, paddingLeft: 0, paddingBottom: 0, paddingRight: 15, width: 0, height: 60)
        
        
        
        contentView.addSubview(fromImageView)
        fromImageView.anchor(top: descriptionLabel.bottomAnchor, left: descriptionImageView.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 21, height: 21)
        
        
        contentView.addSubview(fromLabel)
        fromLabel.anchor(top: nil, left: fromImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 11, paddingBottom: 0, paddingRight: 40, width: 0, height: 14)
        
        fromLabel.centerYAnchor.constraint(equalTo: fromImageView.centerYAnchor).isActive = true
        
        

    }
}
