//
//  ChooseCatalog+TV.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


extension ChooseCatalogVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: roleNameCellId, for: indexPath) as! RoleNameCell
            cell.mainLabel.text = "Регистрация \(catalog.title)"
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: serviceCellId, for: indexPath) as! ServicesCVCell
            cell.servicesArray = servicesArray
            
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: dopOptionsCellId, for: indexPath) as! DopOptionsCell
            cell.extrasArray = extrasArray
            return cell
        } else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: carBrandsListCellId, for: indexPath) as! CarBrandsListCell
            cell.delegate = self
            cell.carsListLB.text = carsLabelText
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: proceedButtonCellId, for: indexPath) as! ProceedButtonCell
        cell.delegate = self
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 103
            
        } else if indexPath.row == 1 {
            
            let addHeight = servicesArray.count % 3 != 0 ? 50 : 0
            return CGFloat( (servicesArray.count / 3) * 45  + 30 + addHeight + 15)
            
        } else if indexPath.row == 2 {
            
            let addHeight = extrasArray.count % 3 != 0 ? 50 : 0
            
            return CGFloat( (extrasArray.count / 3) * 45  + 30 + addHeight + 42 )
            
            
        } else if indexPath.row == 3 {
            return 140
        }
        
        
        return 70
    }
}
