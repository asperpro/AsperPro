//
//  OrderViewModel.swift
//  AsperPro
//
//  Created by didarkam on 7/14/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation


struct Constants {
    static let dateFormatterGet = "yyyy-MM-dd HH:mm:ss  +zzzz"
    static let dateFormatterPrint = "dd MMM, yyyy"
    static let createdAtDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    static let catalogsDictionary: [String: CatalogTitle] = [
        
        "Автомойка": CatalogTitle.Autowash,
        "АЗС": CatalogTitle.AZS,
        "Детейлинг": CatalogTitle.Detailing,
        "Эвакуатор": CatalogTitle.Evacuator,
        "Автозапчасти": CatalogTitle.Autoparts,
        "Шиномонтаж": CatalogTitle.Shinomontazh,
        "СТО": CatalogTitle.STO
    ]
}




public final class OrderViewModel {
    
    
    let order: Order
    let catalog_title: String
    let catalogType: CatalogTitle?
    let commentText: String
    let dateString: String
    
    
    let carModelName: String
    let photosText: String
    let service_title: String
    
    let timeAgo: String
    
    
    
    let isRead: Bool
    let phone: String
    let city_id: String
    let card_payment: String?
    let photosArray: [String]
    let to_location: String
    let from_location: String
    let price: Int
    
    init(order: Order) {
        
        self.order = order
        self.commentText = order.comment
        
        self.carModelName = order.car_model + " " + order.car_brand + "   " + String(order.car_year)
        
        self.dateString = OrderViewModel.dateFormatter(getFormate: Constants.dateFormatterGet, printFormat: Constants.dateFormatterPrint, unformattedDateString: order.extra.date)
        
        self.photosText = !order.extra.photosArray.isEmpty ? "Посмотреть фотографии" :"Нет фотографий"
        self.service_title = order.service_title
        self.catalog_title = order.catalog_title
        self.catalogType = Constants.catalogsDictionary[order.catalog_title]
        
        self.from_location = order.extra.from_location
        self.to_location = order.extra.to_location
        self.phone = order.extra.phone
        self.photosArray = order.extra.photosArray
        self.card_payment = order.extra.card_payment
        self.city_id = order.extra.city_id
        self.isRead = order.is_read
        self.price = order.extraInfo.price
        self.timeAgo = OrderViewModel.dateToTimeAgo(createdAtDateString: order.created_at, dateFormate: Constants.createdAtDateFormat)
        
        
    }
    
    private static func dateToTimeAgo(createdAtDateString: String, dateFormate: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormate
        
        guard let date = dateFormatter.date(from: createdAtDateString) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
       
        return  date.getElapsedInterval() + " назад"
    }
    
    private static func dateFormatter(getFormate: String, printFormat: String, unformattedDateString: String) -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = getFormate
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat =  printFormat
        
        var dateString = String()
        
        if let date = dateFormatterGet.date(from: unformattedDateString){
            dateString = dateFormatterPrint.string(from: date)
        }
        else {
            print("There was an error decoding the string")
            dateString = "Время записи не указано"
            
        }
        return dateString
    }
    
    
}


