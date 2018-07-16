//
//  OrderDetailsTVC.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class OrderDetailsTVC: UITableViewController {
    
    var didReadOrder: (() -> ())?
    
    let carNameCellId = "carNameCellId"
    
    let serviceTitleCellId = "serviceTitleCellId"
    
    let descriptionCellId = "descriptionCellId"
//    let showPhotosCellId = "showPhotosCellId"
    
    let commentCellId = "commentCellId"
    let autoPartsCommentCellId = "autoPartsCommentCellId"
    
    
    let priceCellId = "priceCellId"
//    let orderDetailsCell = "orderDetailsCell"
    
    var order: Order!
    
    var orderViewModel: OrderViewModel!
    
    var comment = ""
    var autoPartCondition = ""
    var deliveryType = ""
    
    var selectedCountryName = ""
    
    let autoPartsConditions = ["Новый оригинал", "Новый дубликат", "Б/у оригинал", "Б/у дубликат"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTV()
        
        if !order.is_read {
            handleIsRead(orderId: orderViewModel.order.id)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        hidesBottomBarWhenPushed = true
        
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.view.endEditing(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setupTV(){
        
        tableView.register(CarNameCell.self, forCellReuseIdentifier: carNameCellId)
        tableView.register(ServiceTitleCell.self, forCellReuseIdentifier: serviceTitleCellId)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: descriptionCellId)
//        tableView.register(ShowPhotosCell.self, forCellReuseIdentifier: showPhotosCellId)
        
        tableView.register(CommentCell.self, forCellReuseIdentifier: commentCellId)
        tableView.register(AutoPartsCommentCell.self, forCellReuseIdentifier: autoPartsCommentCellId)
        
        tableView.register(PriceCell.self, forCellReuseIdentifier: priceCellId)
        
        //        tableView.register(OrderDetailsCell.self, forCellReuseIdentifier: orderDetailsCell)
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsetsMake(13, 0, 0, 0)
        
    }
    
    
    
    
    func updateTVCellAt(row: Int){
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [IndexPath(item: row, section: 0 )], with: .none)
        tableView.endUpdates()
        
    }
    
    
    func handleKeyboard(){
        self.view.endEditing(true)
        
    }
    
}



