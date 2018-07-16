//
//  CabinetTVC.swift
//  AsperPro
//
//  Created by didarkam on 7/13/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class CabinetTVC: UITableViewController {
    
    let cellId = "cabinetCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CabinetPOICell.self, forCellReuseIdentifier: cellId)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CabinetPOICell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270 + 17 + 20
    }
}



