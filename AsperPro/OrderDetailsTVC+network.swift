//
//  OrderDetailsTVC+network.swift
//  AsperPro
//
//  Created by didarkam on 7/12/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


extension OrderDetailsTVC {
    
    
    func handleIsRead(orderId: Int){
        
        ApiService.sharedInstance.handleIsRead(orderId: orderId) { (success) in
            if success {
                self.didReadOrder?()
            } else {
                print("error occured")
            }
        }
        
    }
    
    func handleSendPrice(price: String){
        
        let token = UserDefaults.standard.getAuthToken()
        
        let parameters: [String: Any] = [
            "auth_token": token,
            "poi_request_id": order.id,
            "price": price
//            "xyz": "xyzasd"
        ]
        
        let requestString = "https://asper.kz/api/requests/admin/accept"
        
        Alamofire.request(requestString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON(completionHandler: { (response: DataResponse<Any>) in
            print(response.result.value)
            switch(response.result) {
                
            case .success(_):
                guard let val = response.result.value as? [String: Any] else {return }
                print(val)
                
                guard let success = val["_success"] as? Bool else {return}
                
                if success {
                    self.didReadOrder?()
                    _ = self.navigationController?.popViewController(animated: true)
                    print("x")
                    
//                    NotificationCenter.default.post(name: EvacuatorOrderDeetailsTVC.fetchCompletedOrdersNotification, object: nil)
                    
                } else if !success {
                    
                    print("y")
                    
                }
                
                
                
            case .failure(_):
                
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
                
            }
        }
        )
        
        
        
    }
    
    func handleCancelOrder(orderId: Int){
        
        
        let token = UserDefaults.standard.getAuthToken()
        
        
        let parameters: [String: Any] = [
            "auth_token": token,
            "poi_request_id": order.id
        ]
        
        let requestString = "https://asper.kz/api/requests/admin/cancel"
        
        Alamofire.request(requestString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON(completionHandler: { (response: DataResponse<Any>) in
            print(response.result.value)
            switch(response.result) {
                
            case .success(_):
                guard let val = response.result.value as? [String: Any] else {return }
                print(val)
                
                guard let success = val["_success"] as? Bool else {return}
                
                if success {
                    self.didReadOrder?()
                    print("x")
                    
                } else if !success {
                    
                    print("y")
                    
                }
                
                
            case .failure(_):
                
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
                
            }
        }
        )
        
        
        
    }
}
