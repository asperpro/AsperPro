//
//  NewOrdersTVC+network.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


extension NewOrdersTVC {
    
    func fetchOrders(){
        ApiService.sharedInstance.fetchOrders { (orders) in
            self.ordersArray = orders
            DispatchQueue.main.async {
                self.tabBarController?.tabBar.items![0].badgeValue = "1"
                
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
                
            }
            
        }
        
    }
    
   
    
}
