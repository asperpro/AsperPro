//
//  ChooseCatalog.swift
//  AsperPro
//
//  Created by didarkam on 7/4/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class ChooseCatalogVC: UITableViewController, CarBrandsListDelegate, CarsListLBDelegate, ProceedButtonDelegate {
    
    var catalog: Catalog!
    
    var servicesArray = [Service]()
    var extrasArray = [Service]()
    var selectedServicesIds = [Int]()
    var selectedExtraOPtionsIds = [Int]()
    
    var carsLabelText = "Список автомобилей"
    
    
    let roleNameCellId = "roleNameCellId"
    let serviceCellId = "serviceCellId"
    let dopOptionsCellId = "dopOptionsCellId"
    let carBrandsListCellId = "carBrandsListCellId"
    let proceedButtonCellId = "proceedButtonCellId"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTV()
        fetchServices()
        fetchExtras()
        
    }
    
    func setupTV(){
        
        tableView.backgroundColor = .mainBackground()
        tableView.separatorStyle = .none
        tableView.register(RoleNameCell.self, forCellReuseIdentifier: roleNameCellId)
        tableView.register(ServicesCVCell.self, forCellReuseIdentifier: serviceCellId)
        tableView.register(DopOptionsCell.self, forCellReuseIdentifier: dopOptionsCellId)
        tableView.register(CarBrandsListCell.self, forCellReuseIdentifier: carBrandsListCellId)
        tableView.register(ProceedButtonCell.self, forCellReuseIdentifier: proceedButtonCellId)
        tableView.allowsSelection = false
        
        
    }
    
    
}






