//
//  Catalog.swift
//  AsperPro
//
//  Created by didarkam on 7/4/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import SwiftyJSON


enum CatalogTitle {
    case STO, Autowash, Evacuator, Autoparts, Detailing, Shinomontazh, AZS
}





struct Catalog {
    
    let id: Int
    let title: String
    let with_date: Int
    let order: Int
    let with_service: Int
    let title_acc: String
    let with_car: Int
    let with_request: Int
    let with_payment: Int
    let with_radius: Int
    
    init(json: JSON) {
        
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.order = json["order"].intValue
        self.title_acc = json["title_acc"].stringValue
        self.with_date =  json["with_date"].intValue
        self.with_service =  json["with_service"].intValue
        self.with_car =  json["with_car"].intValue
        self.with_request =  json["with_request"].intValue
        self.with_payment =  json["with_payment"].intValue
        self.with_radius =  json["with_radius"].intValue
        
        
        
        
    }
    
}
