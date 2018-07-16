//
//  MainNavigationController.swift
//  AsperPro
//
//  Created by didarkam on 6/20/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class MainNavigationController: UITabBarController, UITabBarControllerDelegate {
    
    var isUserEnteredForFirstTime = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.delegate = self
        
        view.backgroundColor = .white
        
        //must have most important!
        if !UserDefaults.standard.isLoggedIn() {
        
            
            //show if not logged in
            DispatchQueue.main.async {
//                let asd = SignupChooseRoleController(collectionViewLayout: UICollectionViewFlowLayout())
                let asd = SignupController()
                let navController = UINavigationController(rootViewController: asd)
                self.present(navController, animated: true, completion: nil)
            }
            
            
            
            return
            
        }
        
        
        self.setupViewControllers()
        
    }
    
    
    
    func setupViewControllers(){
        
        
        let newOrdersNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "bell").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "bell"), title: "Новые заявки", rootViewController: NewOrdersTVC())
        
        
        let ordersHistoryNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "my-books"), selectedImage: #imageLiteral(resourceName: "my-books"), title: "История заявок", rootViewController: OrdersHistoryTVC())
        
        let menuNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "list-active"), selectedImage: #imageLiteral(resourceName: "list-active"), title: "Меню", rootViewController: MenuVC())
        

        self.tabBar.tintColor = .mainOrange()
        self.viewControllers = [newOrdersNavController,
                                ordersHistoryNavController,
                                menuNavController]
        
    
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, title: String, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.title = title
        return navController
    }
}

