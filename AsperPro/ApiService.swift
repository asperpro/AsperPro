//
//  ApiService.swift
//  AsperPro
//
//  Created by didarkam on 7/14/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let token = UserDefaults.standard.getAuthToken()
    
    func fetchOrders(completion: @escaping (([Order]) -> ())) {
        
        let url = "https://asper.kz/api/requests/admin/list?auth_token=\(token)"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            if let dictionary = response.result.value {
                let JSONData = JSON(dictionary)
                guard let ordersArray = JSONData["result"].array else {
                    return
                }
                let orders = ordersArray.map{Order(json: $0)}
                completion(orders)
                
            }
            
        }
        
    }
    
    func handleIsRead(orderId: Int, completion: @escaping ((Bool) -> ())){
        
        let parameters: [String: Any] = [
            "auth_token": token,
            "poi_request_id": orderId
        ]
        
        let requestString = "https://asper.kz/api/requests/admin/read?auth_token=\(token)&poi_request_id=\(orderId)"
        
        
        Alamofire.request(requestString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON(completionHandler: { (response: DataResponse<Any>) in
            print(response.result.value ?? "")
            switch(response.result) {
                
            case .success(_):
                guard let val = response.result.value as? [String: Any] else {return }
                print(val)
                
                guard let success = val["_success"] as? Bool else {return}
                
                if success {
                    completion(true)
                    
                } else if !success {
                    completion(false)
                    print("y")
                    
                }
                
                
            case .failure(_):
                
                print("Failure : \(response.result.error ?? "" as! Error)")
                break
                
            }
        })
        
    }
    
    
    //THIS FUNCTION WORKS EITHER WITH SEARCH PARAMETER AND RESTS ARE NIL, OR WITH FILTERS AND SEARCH IS NIL
//    func fetchClubs(page: Int?, special: String?, price: Int?, cuisine: Int?, category: Int?, searchText: String?, city_id: Int?, completion: @escaping ([Club]?, String?, Error?) -> ()) {
//
//        let request: APIRequest<Home, JSONError> = tron1.request("/api/get-ar-object/")
//
//        var parameters: [String: Any] = [:]
//
//        request.parameters = parameters
//
//
//        request.headers = ["Accept": "text/html" ]
//
//        request.perform(withSuccess: { (homeDatasource) in
//            print("Succesfully fetched json")
//            print("zzz\(homeDatasource.clubs.count)")
//
//            //            self.clubs = homeDatasource.clubs
//            //            self.collectionView.reloadData()
//
//            if homeDatasource.nextPage == nil {
//                completion(homeDatasource.clubs, nil, nil) //arguments: clubs, page, error
//            } else {
//                completion(homeDatasource.clubs, homeDatasource.nextPage, nil)
//            }
//
//        }) { (JSONError) in
//            print("Failed to fetch json")
//            print(JSONError)
//            completion(nil, nil, JSONError)
//        }
//
//        //request.method = .post
//    }
    
    
    
}
