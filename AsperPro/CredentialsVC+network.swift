//
//  CredentialsVC+network.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension CredentialsVC {
    
    
    func uploadImage(image: UIImage){
        
        let image = image
        let imgData = UIImageJPEGRepresentation(image, 0.8)!
        
//        let parameters = ["name": rname] //Optional for extra parameter
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "file",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            } //Optional for extra parameters
        },
                         to:"https://asper.kz/images/upload")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    print(response.result.value)
                    guard let res = response.result.value as? [String: Any] else {return}
                    guard let hash = res["hash"] as? String else {return}
                    self.photoHash = hash
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    
    func handleProceedButton(){
        
        guard let title = nameTf.text, title.count > 3 , let address = addressTf.text, address.count > 3,
            let contacts = contactsTf.text, contacts.count > 3,
            let info = descriptionTF.text, info.count > 3,
            let hash = photoHash else {
                handleErrorAlert()
                return
                
        }
        
        let token = UserDefaults.standard.getAuthToken()
        
        
        let parameters: [String: Any] = [
                                        "auth_token": token,
                                         "title": title,
                                         "catalog_id": catalog.id,
                                         "address": address,
                                         "city_id": 1,
                                         "contacts": contacts,
                                         "info": info,
                                         "lat": 51.1801,
                                         "lon": 71.44598,
                                         "photo": hash
        ]
        
        let requestString = "https://asper.kz/api/poi/admin/add"
        
        Alamofire.request(requestString,method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                print(response.result.value)
                //response.result.value = poi_id and success
                guard let value = response.result.value as? [String: Any] else {return}
                guard let success = value["_success"] as? Bool else {return}
                if success {
                    
                    if let poi_id = value["poi_id"] as? Int {
                        
                        self.updateServices(poi_id: poi_id)
                        
                    }
                }
                
                
                
                break
                
            case .failure(_):
                print("Failure : \(response.result.error)")
                break
                
            }
        }
        
        
    }
    
    func updateServices(poi_id: Int){
        
        let token = UserDefaults.standard.getAuthToken()
        
        var requestString = "https://asper.kz/api/poi/admin/edit?auth_token=\(token)&poi_id=\(poi_id)&update=services"
        
        let serviceIds = RegisterSingleton.sharedInstance.selectedServicesIds
        for id in serviceIds {
            let temp = "&service[]=\(id)"
            requestString = requestString + temp
        }
        
        Alamofire.request(requestString,method: .post, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                print(response.result.value)
                //response.result.value = poi_id and success
                guard let value = response.result.value as? [String: Any] else {return}
                guard let success = value["_success"] as? Bool else {return}
                if success {
                    self.updateCars(poi_id: poi_id)
                    
                }
                
                break
                
            case .failure(_):
                print("Failure : \(response.result.error)")
                break
                
            }
        }
        
    }
    
    func updateCars(poi_id: Int){
        
        let token = UserDefaults.standard.getAuthToken()
        
        var requestString = "https://asper.kz/api/poi/admin/edit?auth_token=\(token)&poi_id=\(poi_id)&update=cars"
        
        let serviceIds = RegisterSingleton.sharedInstance.selectedCarBrandsIds
        for id in serviceIds {
            
            let temp = "&car_brand[]=\(id)"
            requestString = requestString + temp
        }
        
        Alamofire.request(requestString,method: .post, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                print(response.result.value)
                //response.result.value = poi_id and success
                
                guard let value = response.result.value as? [String: Any] else {return}
                guard let success = value["_success"] as? Bool else {return}
                if success {
                    self.updateExtraFilters(poi_id: poi_id)
                }
                
                
                break
                
            case .failure(_):
                print("Failure : \(response.result.error)")
                break
                
            }
        }
        
    }
    
    
    func updateExtraFilters(poi_id: Int){
        
        let token = UserDefaults.standard.getAuthToken()
        
        
        
        var requestString = "https://asper.kz/api/poi/admin/edit?auth_token=\(token)&poi_id=\(poi_id)&update=extra_filters"
        
        let extraFilters = RegisterSingleton.sharedInstance.selectedExtraOptionsIds
        for extraId in extraFilters {
            
            let temp = "&extra_filter[]=\(extraId)"
            requestString = requestString + temp
        }
        
        Alamofire.request(requestString,method: .post, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                print(response.result.value)
                //response.result.value = poi_id and success
                guard let value = response.result.value as? [String: Any] else {return}
                guard let success = value["_success"] as? Bool else {return}
                if success {
                    
                    
                    guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainNavigationController else { return }
                    
                    mainTabBarController.setupViewControllers()
                    
                    self.dismiss(animated: true, completion: nil)
                }
                
                
                break
                
            case .failure(_):
                print("Failure : \(response.result.error)")
                break
                
            }
        }
        
    }
    
}
