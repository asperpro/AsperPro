//
//  ServiceTitleCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class ServiceTitleCell: BaseTVCell {
    
    func configureWith(viewModel: OrderViewModel, atIndexPathRow: Int){
        
        switch atIndexPathRow {
        case 1:
            
            typeImageView.image = #imageLiteral(resourceName: "8H")
            typeLabel.text = viewModel.service_title
            
        case 3:
            
            //evacuator
            if viewModel.catalogType == CatalogTitle.Evacuator {
                
                typeLabel.text = viewModel.from_location
                typeImageView.image = #imageLiteral(resourceName: "from")
                
                //not evacuator
            } else {
                
                if viewModel.photosArray.isEmpty {
                    typeLabel.textColor = .black
                } else {
                    //add gesture recognzier
                    typeLabel.textColor = .mainBlue()
                }
                
                typeImageView.image = #imageLiteral(resourceName: "2G")
                typeLabel.text = viewModel.photosText
                
            }
            
        case 4:
            
            //evacuator
            if viewModel.catalogType == CatalogTitle.Evacuator {
                
                //evacuator
                typeLabel.text = viewModel.to_location
                typeImageView.image = #imageLiteral(resourceName: "to")
                
            } else {
                print(999)
                //not evacuator
                typeImageView.image = nil
                typeImageView.image = #imageLiteral(resourceName: "9E")
//                typeImageView.backgroundColor = .red
                typeLabel.text = viewModel.dateString
                
                
            }
            
        case 5:
            
            typeImageView.image = #imageLiteral(resourceName: "8B")
            typeLabel.text = "Оплата картой"
            
        default:
            
            print(123)
            
        }
            
    }
    
    let typeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .black
        iv.backgroundColor = .white
        return iv
    }()
    
    let typeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Манипулятор"
        lb.font = UIFont.systemFont(ofSize: 14)
        
        lb.textAlignment = .justified
        return lb
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        
        contentView.addSubview(typeImageView)
        typeImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 21, height: 21)
        
        contentView.addSubview(typeLabel)
        typeLabel.anchor(top: topAnchor, left: typeImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 11.5, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
    }
}
