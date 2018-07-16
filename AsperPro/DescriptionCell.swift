//
//  DescriptionCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit



class DescriptionCell: ServiceTitleCell {
    
    
    override func setupViews() {
        
        super.setupViews()
        typeImageView.image = #imageLiteral(resourceName: "2H")
        typeLabel.numberOfLines = 3
//        typeLabel.text = "Описание проблемы. Или описание автозапчасти, которую ищет пользователь. Необходимо, чтобы описание занимало 3 строки максимум."
        
    }
}
