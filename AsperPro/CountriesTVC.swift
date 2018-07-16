//
//  CountriesTVC.swift
//  AsperPro
//
//  Created by didarkam on 7/16/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class CountriesTVC: UITableViewController {
    
    let countries = ["Австрия", "Армения", "Алмания"]
    
    let cellId = "cellId"
    
    var didChoseCountryName: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) //as! UITableViewCell
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didChoseCountryName?(countries[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
