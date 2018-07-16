//
//  SignupController.swift
//  AsperPro
//
//  Created by didarkam on 6/26/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class SignupController: UIViewController, UITextFieldDelegate {
    
    
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .mainWhite()
        return sv
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneTextField.resignFirstResponder()
        return false
    }
    
    
    
    func handleEnter(){
        
        guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainNavigationController else { return }
        
        mainTabBarController.setupViewControllers()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var iv: UIImageView = {
        var iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    
    
    lazy var proceedButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .mainOrange()
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitle("Продолжить", for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleProceedButton), for: .touchUpInside)
        return button
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.font = UIFont.systemFont(ofSize: 16)
//        tf.backgroundColor = .tfColor()
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.returnKeyType = .done
        tf.keyboardType = .numberPad
//        tf.setLeftPaddingPoints(38)
        tf.backgroundColor = .customGrey()
        return tf
    }()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupViews()
        phoneTextField.delegate = self
        setupToolbarButtonOnNumPadTextFields()
        
    }
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    func setupToolbarButtonOnNumPadTextFields(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyboard))
        toolBar.setItems([doneButton], animated: false)
        
        phoneTextField.inputAccessoryView = toolBar
        
    }
    var myPhoneNumber = String()
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if (textField == self.phoneTextField) && textField.text == ""{
//            textField.text = "+7(" //your country code default
//        }
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneTextField {
            let res = phoneMask(phoneTextField: phoneTextField, textField: textField, range, string)
            myPhoneNumber = res.phoneNumber != "" ? "+\(res.phoneNumber)" : ""
            print("Phone - \(myPhoneNumber)  MaskPhone=\(res.maskPhoneNumber)")
            if (res.phoneNumber.count == 11) || (res.phoneNumber.count == 0) {
                //phone number entered or completely cleared
                print("EDIT END: Phone = \(myPhoneNumber)  MaskPhone = \(res.maskPhoneNumber)")
            }
            return res.result
        }
        return true
    }
        
}

