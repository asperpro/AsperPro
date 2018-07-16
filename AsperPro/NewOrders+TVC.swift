//
//  NewOrders+TVC.swift
//  AsperPro
//
//  Created by didarkam on 7/15/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension NewOrdersTVC {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetailsTVC = OrderDetailsTVC()
        orderDetailsTVC.order = ordersArray[indexPath.row]
        orderDetailsTVC.orderViewModel = OrderViewModel(order: ordersArray[indexPath.row])
        orderDetailsTVC.didReadOrder = { [weak self] in
            self?.handleRefresh()
        }
        navigationController?.pushViewController(orderDetailsTVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ordersArray.count == 0 {
            tableView.separatorStyle = .none
            noOrdersLabel.isHidden = false
        } else {
            noOrdersLabel.isHidden = true
            tableView.separatorStyle = .singleLine
        }
        return ordersArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ordersHistoryCellId, for: indexPath) as! OrdersHistoryCell
        cell.configureWith(orderViewModel: OrderViewModel(order: ordersArray[indexPath.row]))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
