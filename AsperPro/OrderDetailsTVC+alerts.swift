//
//  Evacuator+alerts.swift
//  AsperPro
//
//  Created by didarkam on 6/28/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit




extension OrderDetailsTVC {
    
    
    func handleAlertCall(singlePhoneNumber: String){
        
        let alert = UIAlertController(title: "Позвонить?", message: singlePhoneNumber, preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action: UIAlertAction) in
            
            self.handleCallButton(singlePhoneNumber: singlePhoneNumber)
        }))
        
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    //handle call from app in ios 10 or older
    func handleCallButton(singlePhoneNumber: String) {
        print(singlePhoneNumber)
        if let phoneCallURL = URL(string: "tel://\(singlePhoneNumber)") {
            if #available(iOS 10, *) {
                
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                }
                
            } else {
                UIApplication.shared.openURL(phoneCallURL as URL)
            }
        }
    }
    
    
    
    func handleDeclineAlert(){
        
        let alert = UIAlertController(title: "Удаление заявки", message: "Удалить выбранную завяку?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action: UIAlertAction) in
            self.handleCancelOrder(orderId: self.orderViewModel.order.id)
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    func handleSendAlert(price: String){
        
        let alert = UIAlertController(title: "Отправка отклика Клиенту", message: "Вы указали цену \(price) тенге. Отправить?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action: UIAlertAction) in
            self.handleSendPrice(price: price)
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    func handleAutoPartStateAlert(autoPartsConditions: [String], completion: @escaping (Int) -> ()){
        
        let alert = UIAlertController(title: "Выберите состояние запчасти", message: "", preferredStyle: .actionSheet)
        
        for i in 0...autoPartsConditions.count - 1 {
            
            alert.addAction(UIAlertAction(title: autoPartsConditions[i], style: .default, handler: { (action: UIAlertAction) in
                completion(i)
                
            }))
            
        }
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    func handleDeliveryTypeAlert(completion: @escaping (Bool) -> ()){
        
        let alert = UIAlertController(title: "Наличие доставки", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Есть", style: .default, handler: { (action: UIAlertAction) in
            completion(true)
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .default, handler: { (action: UIAlertAction) in
            completion(false)
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
}
