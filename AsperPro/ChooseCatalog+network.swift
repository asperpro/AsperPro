//
//  ChooseCatalog+network.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ChooseCatalogVC {
    
    
    func fetchServices(){
        
        let catalog_id = catalog.id
        
        let url = "https://asper.kz/api/catalog/services?catalog_id=\(catalog_id)"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            if let dictionary = response.result.value {
                
                let JSONData = JSON(dictionary)
                
                guard let servicesArray = JSONData["result"].array else {
                    return
                }
                self.servicesArray = servicesArray.map{Service(json: $0)}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        }
    }
    
    func fetchExtras(){
        
        let catalog_id = catalog.id
        
        let url = "https://asper.kz/api/catalog/extra_filters?catalog_id=\(catalog_id)"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            if let dictionary = response.result.value {
                
                let JSONData = JSON(dictionary)
                
                guard let servicesArray = JSONData["result"].array else {
                    return
                }
                self.extrasArray = servicesArray.map{Service(json: $0)}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        }
    }
    
    
}
