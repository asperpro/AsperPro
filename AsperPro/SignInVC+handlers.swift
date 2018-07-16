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

extension SignInViewController {
    
    
    func handleWrongCodeAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Неправильный код", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func handleErrorAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Введи номер по формату", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    

    
    func handleResendCodeButton(){
        
        guard var phone = phoneTf.text, phone.count > 3 else {
            
            return
            
        }
        phone = "\(7)\(phone)"
        
        
        let device_id = UserDefaults.standard.getDeviceId()
        let app_id = UserDefaults.standard.getAppId()
        let device_os = UserDefaults.standard.getDeviceOS()
        
        
        let requestString = "https://dev.asper.kz/api/auth/resend"
        
        let parameters: [String: Any] = [
            "device_id": device_id,
            "device_os": device_os,
            "phone": phone,
            "app_id": app_id
        ]
        
        Alamofire.request(requestString,method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON(completionHandler: { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                guard let val = response.result.value as? [String: Any] else {return }
                
                if let action = val["action"] as? String {
                    
                    if action == "verified" {
                        //tutorial
                        self.handleEnter()
                        
                    }
                    
                }
                
                if let err = val["_error"] as? String {
                    if err == "DEVICE_ALREADY_VERIFIED" {
                        //tutorial
                        self.handleEnter()
                    }
                }
                
                
            case .failure(_):
                
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
                
            }
        })
    }
    
    
    func handleVerify(){
        
        guard let code = codeTF.text, code.count > 3 else {return}
        
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        
        let device_os = "ios"
        let app_id = 1
        let codeInt: Int = Int(code)!
        let userId = UserDefaults.standard.getUserId()
        
        let requestString = "https://asper.kz/api/auth/verify"
        
        print(userId)
        let parameters: [String: Any] = [
            "device_os": device_os,
            "app_id": app_id,
            "device_id": deviceId,
            "code": codeInt,
            "user_id": userId
        ]
        
        Alamofire.request(requestString,method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON(completionHandler: { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                //                    print(response.result.value)
                guard let val = response.result.value as? [String: Any] else {return }
                print(val)
                if let action = val["action"] as? String {
                    
                    if action == "verified" {
                        
                        if let auth_token = val["auth_token"] as? String{
                            UserDefaults.standard.set(auth_token, forKey: "auth_token")
                        }
                        //tutorial
                        self.handleEnter()
                    }
                }
                
                
                if let err = val["_error"] as? String {
                    
                    if err == "DEVICE_ALREADY_VERIFIED" {
                        //tutorial
                        self.handleEnter()
                        
                        
                    } else if err == "INVALID_VERIFICATION_CODE" {
                        
                        self.handleWrongCodeAlert()
                    }
                    
                }
                
            case .failure(_):
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
            }
        })
        
        
    }
    
    
    func handleProceedButton(){
        
        if !resendCodeButton.isHidden {
            handleVerify()
            return
        }
        
        let userId = UserDefaults.standard.getUserId()
        print(userId)
        if userId != 0 {
            handleVerify()
        }
        
        guard var phone = phoneTf.text, phone.count == 10 else {return}
        phone = "\(7)\(phone)"
        
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
                
                
                guard let success = val["_success"] as? Bool else {return}
                
                if success {
                    
                    guard let action = val["action"] as? String else {return}
                    
                    if action == "verification" {
                        
                        if let user_id = val["user_id"] as? Int{
                            UserDefaults.standard.saveUserId(value: user_id)
                        }
//                        self.enterVerificationCode()
                        
                    } else if action == "authorized" {
                        
                        if let auth_token = val["auth_token"] as? String{
                            UserDefaults.standard.saveAuthToken(value: auth_token)
                        }
                        //sign in
                        self.handleEnter()
                        
                    }
                    
                } else if success {
                    
//                    self.enterVerificationCode()
                    
                }
                
                print(val)
                
                
                
                if let err = val["_error"] as? String {
                    if err == "DEVICE_AWAITS_VERIFICATION" {
                        
                    }
                }
                
            case .failure(_):
                
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
                
            }
        }
        
        
    }
    
}

