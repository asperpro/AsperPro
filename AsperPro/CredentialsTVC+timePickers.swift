//
//  CredentialsTVC+timePickers.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension CredentialsVC {
    
    func createToTimePicker(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedToTime))
        toolBar.setItems([doneButton], animated: false)
        workTimeToTf.inputAccessoryView = toolBar
        
        
        
        timePicker1.locale = NSLocale(localeIdentifier: "ru_RU") as Locale
        timePicker1.datePickerMode = .time
        timePicker1.minuteInterval = 30
        workTimeToTf.inputView = timePicker1
        //        workTimeToTf.inputView = timePicker
        
    }
    
    
    func handleFrom24hBtn(){
        workTimeFromTF.text = "Круглосуточно"
        self.view.endEditing(true)
        
    }
    func createFromTimePicker(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedTime))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

        
        let callButton = UIBarButtonItem(title: "Круглосуточно", style: .done, target: self, action: #selector(handleFrom24hBtn))
        
        
        
        toolBar.setItems([doneButton, flexibleSpace, callButton], animated: false)
        workTimeFromTF.inputAccessoryView = toolBar
        
        
        
        timePicker.locale = NSLocale(localeIdentifier: "ru_RU") as Locale
        timePicker.datePickerMode = .time
        timePicker.minuteInterval = 30
        workTimeFromTF.inputView = timePicker
        
    }
    
    func donePressedToTime(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = "HH:mm"
        workTimeToTf.text = dateFormatter.string(from: timePicker1.date)
        self.view.endEditing(true)
        
    }
    func donePressedTime(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = "HH:mm"
        workTimeFromTF.text = dateFormatter.string(from: timePicker.date)
        self.view.endEditing(true)
        
    }
    
}
