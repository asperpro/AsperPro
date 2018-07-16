//
//  Order.swift
//  AsperPro
//
//  Created by didarkam on 7/9/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Order {
    let comment: String
    let status: Int
    let poi_id: Int
    let service_title: String
    let user_id: String
    let car_brand: String
    let admin_phone: String
    let car_model: String
    let created_at: String
    let extra: Extra
    let admin_id: Int
    let is_read: Bool
    let admin_name: String
    let request_id: Int
    let id: Int
    let car_year: Int
    let catalog_title: String
    let user_name: String
    let user_phone: String
    let poi_title: String
    
//    extra_info: { }
    init(json: JSON) {
        
        self.comment = json["comment"].stringValue
        self.service_title = json["service_title"].stringValue
        self.user_id = json["user_id"].stringValue
        self.car_brand = json["car_brand"].stringValue
        self.admin_phone = json["admin_phone"].stringValue
        self.car_model = json["car_model"].stringValue
        self.created_at = json["created_at"].stringValue
        self.extra = Extra(json: json["extra"])
        self.admin_name = json["admin_name"].stringValue
        self.catalog_title = json["catalog_title"].stringValue
        self.user_name = json["user_name"].stringValue
        self.user_phone = json["user_phone"].stringValue
        self.poi_title = json["poi_title"].stringValue
        self.status = json["status"].intValue
        self.poi_id = json["poi_id"].intValue
        self.is_read = json["is_read"].boolValue
        self.request_id = json["request_id"].intValue
        self.id = json["id"].intValue
        self.car_year = json["car_year"].intValue
        self.admin_id = json["admin_id"].intValue
        
    }
}


struct Extra {
    
    let date: String
    let phone: String
    let city_id: String
    let card_payment: String
    let photosArray: [String]
    let to_location: String
    let from_location: String
    let price: Int
    
    init(json: JSON) {
        self.date = json["date"].stringValue
        self.phone = json["phone"].stringValue
        self.city_id = json["city_id"].stringValue
        self.card_payment = json["card_payment"].stringValue
        self.photosArray = json["photo[]"].arrayObject as? [String] ?? []
        self.from_location = json["from_location"].stringValue
        self.to_location = json["to_location"].stringValue
        self.price = json["price"].intValue
    }
}
