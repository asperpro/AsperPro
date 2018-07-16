//
//  AdvancedOrderDetailsTVC.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class AutoPartsOrderDetailsTVC: OrderDetailsTVC {
    
    let advancedOrderDetailsCell = "advancedOrderDetailsCell"
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(AutoPartsOrderDetailsCell.self, forCellReuseIdentifier: advancedOrderDetailsCell)
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 {
            
            return 150
            
        } else if indexPath.row == 3 {
            
            return 400
            
        } else if indexPath.row == 2 {
            
            return 220
            
        }
        
        return 44.0
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: carNameCellId, for: indexPath) as! CarNameCell
            
            return cell
            
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: autoPartsCommentCellId, for: indexPath) as! AutoPartsCommentCell
            
            return cell
            
        }else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: priceCellId, for: indexPath) as! PriceCell
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: advancedOrderDetailsCell, for: indexPath) as! AutoPartsOrderDetailsCell
        
        
        return cell
    }
    
}
