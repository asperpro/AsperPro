//
//  UserDefaults.swift
//  AsperPro
//
//  Created by didarkam on 7/5/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    
    
    enum UserDefaultsKey: String {
        case isLoggedIn, auth_token, phone, user_id
    }
    
    
    func getPhone() -> String {
        return string(forKey: UserDefaultsKey.phone.rawValue) ?? ""
    }
    
    
    func savePhone(value: String){
        set(value, forKey: UserDefaultsKey.phone.rawValue)
        synchronize()
    }
    
    
    func getUserId() -> Int {
        return integer(forKey: UserDefaultsKey.user_id.rawValue)
    }
    
    
    func saveUserId(value: Int){
        set(value, forKey: UserDefaultsKey.user_id.rawValue)
        synchronize()
    }
    
    
    
    func getDeviceId() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    func getAppId() -> Int {
        return 1
    }
    
    func getDeviceOS() -> String {
        return "ios"
        
    }
    
    func getAuthToken() -> String {
        return string(forKey: UserDefaultsKey.auth_token.rawValue) ?? ""
        
    }
    
    
    func saveAuthToken(value: String){
        set(value, forKey: UserDefaultsKey.auth_token.rawValue)
        synchronize()
    }
    
    
    func setIsLoggedIn(value: Bool){
        set(value, forKey: UserDefaultsKey.isLoggedIn.rawValue)
        synchronize()
    }
    
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKey.isLoggedIn.rawValue)
    }
    
}
