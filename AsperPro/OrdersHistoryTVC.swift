//
//  OrdersHistoryTVC.swift
//  AsperPro
//
//  Created by didarkam on 6/20/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class OrdersHistoryTVC: NewOrdersTVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchOrders()
        
        navigationItem.title = "История заявок"
    }
    
   
    
    override func fetchOrders() {
        
        let auth_token = UserDefaults.standard.getAuthToken()
        
        let url = "https://asper.kz/api/requests/admin/responses/list?auth_token=\(auth_token)"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            if let dictionary = response.result.value {
                
                let JSONData = JSON(dictionary)
                
                guard let ordersArray = JSONData["result"].array else {
                    return
                }
                self.ordersArray = ordersArray.map{Order(json: $0)}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.refreshControl?.endRefreshing()
                }
                
                
            }
        }
    }
    
    
    func handleAlarmAlert(){
        
        let alert = UIAlertController(title: "Данный раздел еще не заполнен", message: "", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleAlarmAlert()
        
        return
        
        let v = OrderDetailsTVC()
        v.order = ordersArray[indexPath.row]
        v.orderViewModel = OrderViewModel(order: ordersArray[indexPath.row])
        
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ordersHistoryCellId, for: indexPath) as! OrdersHistoryCell
        cell.configureWith(orderViewModel: OrderViewModel(order: ordersArray[indexPath.row]))
        cell.isNew = false
        return cell
    }
    
    
}



