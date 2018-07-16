//
//  Service.swift
//  AsperPro
//
//  Created by didarkam on 7/4/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import SwiftyJSON




struct Service {
    
    let id: Int
    let title: String
    
    init(json: JSON) {
        
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        
    }
}


struct ExtraOption {
    
    let id: Int
    let title: String
    
    init(json: JSON) {
        
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        
    }
}


struct CarBrand {
    
    let id: Int
    let name: String
    
    init(json: JSON) {
        
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        
    }
}



