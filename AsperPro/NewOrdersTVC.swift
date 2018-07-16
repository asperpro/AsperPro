//
//  NewOrdersTVC.swift
//  AsperPro
//
//  Created by didarkam on 6/20/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class NewOrdersTVC: UITableViewController {
    
    
    let ordersHistoryCellId = "ordersHistoryCellId"
    
    var ordersArray = [Order]()
    
    let noOrdersLabel: UILabel = {
        let lb = UILabel()
        lb.isHidden = true
        lb.textColor = .lightGray
        lb.text = "Новых заявок пока нет =("
        lb.font = UIFont.boldSystemFont(ofSize: 23)
        return lb
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupTV()
        fetchOrders()
    
    }
    
    
    func handleRefresh(){
        
        fetchOrders()
        
    }
    
    func setupTV(){
        
        
        //TV
        navigationItem.title = "Новые заявки"
        tableView.separatorStyle = .none
        tableView.register(OrdersHistoryCell.self, forCellReuseIdentifier: ordersHistoryCellId)
        
        
        //no orders hidden
        view.addSubview(noOrdersLabel)
        noOrdersLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 30)
        noOrdersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noOrdersLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -64).isActive = true
        
        //refresh control
        let refreshControl = UIRefreshControl()
        refreshControl.transform = CGAffineTransform(scaleX: 1, y: 1)
        refreshControl.tintColor = .mainOrange()
        refreshControl.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    
}






