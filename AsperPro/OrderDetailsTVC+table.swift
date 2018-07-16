//
//  OrderDetailsTVC+table.swift
//  AsperPro
//
//  Created by didarkam on 7/12/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension OrderDetailsTVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: carNameCellId, for: indexPath) as! CarNameCell
            cell.configureWith(orderViewModel: orderViewModel)
            return cell
            
        }  else if indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5  {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: serviceTitleCellId, for: indexPath) as! ServiceTitleCell
            
            
            cell.configureWith(viewModel: orderViewModel, atIndexPathRow: indexPath.row)
            return cell
            
        } else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: descriptionCellId, for: indexPath) as! DescriptionCell
            cell.typeLabel.text = orderViewModel.commentText
            return cell
            
        } else if indexPath.row == 6 {
            
            if orderViewModel.catalogType == CatalogTitle.Autoparts {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: autoPartsCommentCellId, for: indexPath) as! AutoPartsCommentCell
                
               
                cell.didChoseDeliveryType = {
                    self.handleKeyboard()
//                    let ip = IndexPath(row: 2, section: 0)
//                    tableView.selectRow(at: ip, animated: false, scrollPosition: UITableViewScrollPosition.none)
                    self.handleDeliveryTypeAlert(completion: { (deliveryBool) in
                        
                        if deliveryBool {
                            self.deliveryType = "Да"
                        } else {
                            self.deliveryType = "Нет"
                        }
                        cell.deliveryTF.text = self.deliveryType

                    })
                }
                
                cell.didChosePartCondition = {
                    let ip = IndexPath(row: 2, section: 0)
                    tableView.scrollToRow(at: ip, at: UITableViewScrollPosition.top, animated: false)
                    self.handleAutoPartStateAlert(autoPartsConditions: self.autoPartsConditions, completion: { (index) in
                        cell.autoPartConditionTF.text = self.autoPartsConditions[index]
                        self.autoPartCondition = self.autoPartsConditions[index]
                    })
                }
                
                cell.didChoseCountries = { [weak self ] in
                    
                    let v = CountriesTVC()
                    v.didChoseCountryName = { [weak self ]  countryName in
                        self?.selectedCountryName = countryName
                        cell.countryTF.text = countryName
                    }
                    
                    let navController = UINavigationController(rootViewController: v)
                    self?.present(navController, animated: true, completion: nil)
                }
                
                return cell
                
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: commentCellId, for: indexPath) as! CommentCell
            
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: priceCellId, for: indexPath) as! PriceCell
        
        cell.configureCellWith(viewModel: orderViewModel)
        
        cell.didSetPrice = { [weak self] price in
            self?.handleSendAlert(price: price)
        }
        cell.didDeclineOrder = {
            self.handleDeclineAlert()
        }
        cell.didCallButton = { [weak self] in
            
            self?.handleAlertCall(singlePhoneNumber: (self?.orderViewModel.phone)!)
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //description 3 lines
        if indexPath.row == 2 {
            
            return 60
            
            //phontos
        } else if indexPath.row == 3 {
            
            if orderViewModel.catalogType == CatalogTitle.Autowash {
                return 0
            }
            
            return 44.0
            
            
            //date cell vremya zapisi
        } else if indexPath.row == 4 {
            
            if orderViewModel.catalogType == CatalogTitle.Autoparts {
                
                return 0
                
            }
            
            return 44.0
            
            //online payment
        } else if indexPath.row == 5 {
            
            guard let  _ = orderViewModel.card_payment else {return 0}
            
            return 44.0
            
            //input fields autoPart comment Cell comment etc.
        } else if indexPath.row == 6 {
            
            if orderViewModel.catalogType == CatalogTitle.Autoparts {
                
                return 44.0 * 4 + 15
                
            }
            
            return 44.0
            
            //price
        }  else if indexPath.row == 7 {
            
            return 190.0 + 60.0
        }
        
        //indexPath = 0-carName, 1-serviceTitle, 3-photos, 4-date
        return 44.0
    }
    
   
    
}
