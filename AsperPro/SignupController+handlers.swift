//
//  SignupController+handlers.swift
//  AsperPro
//
//  Created by didarkam on 7/5/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON


extension SignupController {
    
    func enterVerificationCode(){
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func handleErrorAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Введи номер по формату", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    

    
    func handleProceedButton(){
        
        
       
        
        let phone =  myPhoneNumber.chopPrefix(1)
        
        
        if phone.count != 11  {
            handleErrorAlert()
            return
        }
        print(phone)
        
        
        //save phone
        UserDefaults.standard.savePhone(value: phone)
        
        let requestString = "https://asper.kz/api/auth/login"
        
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        
        //        let phone = "77015351488"
        
        let device_os = "ios"
        
        let parameters: [String: Any] = [
            "phone": phone,
            "device_os": device_os,
            "app_id": 1,
            "device_id": deviceId
        ]
        
        Alamofire.request(requestString,method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                guard let val = response.result.value as? [String: Any] else {return }
                print(val)
                
                guard let success = val["_success"] as? Bool else {return}
                
                //save userId
                if let user_id = val["user_id"] as? Int{
                    UserDefaults.standard.saveUserId(value: user_id)
                }
                
                if success {
                    
                    guard let action = val["action"] as? String else {return}
                    
                    //юзер зарегистрировался, теперь нужно его верифицировать
                    if action == "verification" {
                        
                        self.enterVerificationCode()
                        
                        //все нормально, юзер зашел
                    } else if action == "authorized" {
                        
                        guard let user_status = val["user_status"] as? Bool else {return}
                        if let auth_token = val["auth_token"] as? String{
                            UserDefaults.standard.saveAuthToken(value: auth_token)
                        }
                        UserDefaults.standard.setIsLoggedIn(value: true)
                        self.handleEnter()
                        
                        
                    }
                    
                } else if !success {
                    
                    //юзер зарегистрировался, и уже ждет верификацию
                    self.enterVerificationCode()
                    
                }
                
                
                
                
                
                
            case .failure(_):
                
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
                
            }
        }
        
        
    }
    
}
