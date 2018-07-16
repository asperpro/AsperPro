//
//  CarsTVC.swift
//  AsperPro
//
//  Created by didarkam on 7/8/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class CarsTVC: UITableViewController, UIGestureRecognizerDelegate {
    
    let cellId = "cellId"
    let headerCellId = "headerCellId"
    
    
    
    var delegate: CarsListLBDelegate?
    
    var carBrandsArray = [CarBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTV()
        fetchCars()
        setupNavBar()
    }
    
    func setupTV(){
        
        view.backgroundColor = .mainBackground()
        tableView.allowsMultipleSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(CustomHeaderCell.self, forCellReuseIdentifier: headerCellId)
        
    }
    func setupNavBar(){
        
        let callButton = UIButton(type: .system)
        callButton.setTitle("Выбрать все", for: UIControlState())
        callButton.frame = CGRect(x: 0, y: 0, width: 90, height: 38)
        callButton.addTarget(self, action: #selector(handleAllCarBrands), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: callButton)
        
        
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Сохранить", for: UIControlState())
        closeButton.frame = CGRect(x: 0, y: 0, width: 100, height: 38)
        closeButton.addTarget(self, action: #selector(handleProceed), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    }
    
    
    
    
    func handleProceed(){
        
        let selectedRows = tableView.indexPathsForSelectedRows
        
        let selectedCarsIds = selectedRows?.map { carBrandsArray[$0.row].id }
        
        if let selectedCarsIds = selectedCarsIds {
            RegisterSingleton.sharedInstance.selectedCarBrandsIds = selectedCarsIds
            print("Car brands count is \(RegisterSingleton.sharedInstance.selectedCarBrandsIds.count)")
        }
        
        dismiss(animated: true) {
            self.delegate?.changeLabelName(selectedCarBrandNamesCount: RegisterSingleton.sharedInstance.selectedCarBrandsIds.count)
        }
        
    }
    
    func handleAllCarBrands(){
        var selectedCarBrandsArray = [Int]()
        for carBrand in carBrandsArray {
            selectedCarBrandsArray.append(carBrand.id)
            
        }
        
        RegisterSingleton.sharedInstance.selectedCarBrandsIds = selectedCarBrandsArray
        print("Car brands count is \(RegisterSingleton.sharedInstance.selectedCarBrandsIds.count)")
        
        dismiss(animated: true) {
            self.delegate?.changeLabelName(selectedCarBrandNamesCount: RegisterSingleton.sharedInstance.selectedCarBrandsIds.count)
        }
        
    }
    
    func fetchCars(){
        
        let url = "https://asper.kz/api/cars/brands"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            if let dictionary = response.result.value {
                
                let JSONData = JSON(dictionary)
                
                guard let servicesArray = JSONData["result"].array else {
                    return
                }
                self.carBrandsArray = servicesArray.map{CarBrand(json: $0)}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
            
        }
    }
    
    
}

extension CarsTVC {
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = carBrandsArray[indexPath.row].name
        
        let selectedIndexPaths = tableView.indexPathsForSelectedRows
        let rowIsSelected = selectedIndexPaths != nil && selectedIndexPaths!.contains(indexPath)
        cell.accessoryType = rowIsSelected ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carBrandsArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .checkmark
        
        // cell.accessoryView.hidden = false // if using a custom image
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .none
        // cell.accessoryView.hidden = true  // if using a custom image
    }
}


class CustomHeaderCell: BaseTVCell {
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        //        lb.backgroundColor = .tfColor()
        lb.text = "      Выбрать все"
        lb.font = UIFont.systemFont(ofSize: 17)
        lb.adjustsFontSizeToFitWidth = true
        lb.backgroundColor = .mainBackground()
        return lb
    }()
        
    override func setupViews() {
        super.setupViews()
        
        addSubview(mainLabel)
        mainLabel.fillSuperview()
    }
}
