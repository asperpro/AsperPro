//
//  DateExtensions.swift
//  AsperPro
//
//  Created by didarkam on 7/16/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation

extension Date {
    
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "год" :
                "\(year)" + " " + "лет"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "месяц" :
                "\(month)" + " " + "месяцев"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "день" :
                "\(day)" + " " + "дней"
        } else if let hour = interval.hour, hour > 0 {
            
            return hour == 1 ? "\(hour)" + " " + "час" :
                "\(hour)" + " " + "часов"
        } else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "минуту" :
                "\(minute)" + " " + "минут"
        } else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "секунду" :
                "\(second)" + " " + "секунд"
        } else {
            return "только что"
        }
        
    }
}
