//
//  MenuVC.swift
//  AsperPro
//
//  Created by didarkam on 7/12/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class MenuVC: UITableViewController {
    
    var titles = ["   Личный кабинет", "   Статистика", "   Отзывы", "   Моя реклама", "   Служба поддержки", "   Выход"]
    
    var cellId = "cellId"
    
    
    func handleLogout(){
        
        UserDefaults.standard.setIsLoggedIn(value: false)
        let asd = SignupController()
        let navController = UINavigationController(rootViewController: asd)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationItem.title = "Меню"
        tableView.contentInset = UIEdgeInsetsMake(28, 0, 0, 0)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 31 + 25
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 26)
        return cell
    }
    
    func handleRegisterPoi(){
        
        let cv = UICollectionViewFlowLayout()
        let v = SignupChooseRoleController(collectionViewLayout: cv)
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == titles.count -  1  {
            tableView.deselectRow(at: indexPath, animated: false)
            handleLogoutAlert()
        } else if indexPath.row == 0 {
            
            let a = CabinetTVC()
            navigationController?.pushViewController(a, animated: true)
            
        } else {
            handleAlarmAlert()
            return
//            handleRegisterPoi()
        }
    }
    
    
    func handleAlarmAlert(){
        
        let alert = UIAlertController(title: "Данный раздел еще не заполнен", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func handleLogoutAlert(){
        
        let alert = UIAlertController(title: "Выйти?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "да", style: .default, handler: { (action: UIAlertAction) in
            
            self.handleLogout()
        }))
        
        alert.addAction(UIAlertAction(title: "нет", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
