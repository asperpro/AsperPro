//
//  SignupController.swift
//  AsperPro
//
//  Created by didarkam on 6/26/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneTf.resignFirstResponder()
        codeTF.resignFirstResponder()
        return false
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .mainWhite()
        return sv
    }()
    
    
    func handleEnter(){
        
//        if UserDefaults.standard.string(forKey: "userId") == nil {
        
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            let cv = SignupChooseRoleController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(cv, animated: true)
            
//            return
//        }
        
//        UserDefaults.standard.setIsLoggedIn(value: true)
//
//        guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainNavigationController else { return }
//
//        mainTabBarController.setupViewControllers()
//
//        self.dismiss(animated: true, completion: nil)
    }
    
    
    var iv: UIImageView = {
        var iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    
    
    let lb1 : UILabel = {
        
        let lb1 = UILabel()
        lb1.text = "Введите код"
        lb1.textColor = .darkGray
        lb1.font = UIFont.systemFont(ofSize: 14)
        return lb1
    }()
    
    let codeTF: UITextField = {
        let civ = UITextField()
        civ.placeholder = ""
        civ.font = UIFont.systemFont(ofSize: 16)
//        civ.backgroundColor = .tfColor()
        civ.layer.cornerRadius = 5
        civ.layer.masksToBounds = true
        civ.returnKeyType = .done
        civ.backgroundColor = .customGrey()
        civ.keyboardType = .numberPad
        return civ
    }()
    
    
    lazy var proceedButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = .mainOrange()
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitle("Продолжить", for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleVerify), for: .touchUpInside)
        return button
    }()
    
    let phoneTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.font = UIFont.systemFont(ofSize: 16)
//        tf.backgroundColor = .tfColor()
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.returnKeyType = .done
        tf.setLeftPaddingPoints(38)
        tf.backgroundColor = .customGrey()
        tf.isEnabled = false
        return tf
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var phoneToDisplay = UserDefaults.standard.getPhone()
        phoneToDisplay.remove(at: phoneToDisplay.startIndex)
        phoneTf.text = phoneToDisplay
    }
    
    
    lazy var resendCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .none
        button.tintColor = .darkGray
        button.setTitleColor(.darkGray, for: UIControlState())
        button.setTitle("Повторить отправку", for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleResendCodeButton), for: .touchUpInside)
        return button
    }()
    
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
    func setupToolbarButtonOnNumPadTextFields(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        
        codeTF.inputAccessoryView = toolBar
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        phoneTf.delegate = self
        codeTF.delegate = self
        setupViews()
        setupToolbarButtonOnNumPadTextFields()
        
    }
    
}

