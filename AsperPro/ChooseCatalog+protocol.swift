//
//  ChooseCatalog+protocol.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension ChooseCatalogVC {
    
    
    func handleCarBrandsListVC(){
        
        let v = CarsTVC()
        v.delegate = self
        let navControl = UINavigationController(rootViewController: v)
        present(navControl, animated: true, completion: nil)
        
    }
    
    
    func changeLabelName(selectedCarBrandNamesCount: Int){
        
        tableView.beginUpdates()
        carsLabelText = "Выбрано автомобилей: \(selectedCarBrandNamesCount)"
        tableView.reloadRows(at: [IndexPath(item: 3, section: 0 )], with: .none)
        tableView.endUpdates()

    }
    
    func handleProceedButton(){
        
        let v = CredentialsVC()
        v.catalog = catalog
        navigationController?.pushViewController(v, animated: true)
        
    }
    
}

protocol ProceedButtonDelegate {
    func handleProceedButton()
}

protocol CarBrandsListDelegate {
    
    func handleCarBrandsListVC()
    
}


protocol CarsListLBDelegate {
    
    func changeLabelName(selectedCarBrandNamesCount: Int)
    
}
