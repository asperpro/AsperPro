//
//  AdvancedCommentCell.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class AutoPartsCommentCell: BaseTVCell, UITextFieldDelegate {
    
    var didChosePartCondition: (() -> Void)?
    
    var didChoseDeliveryType: (() -> Void)?
    
    var didChoseCountries: (() -> Void)?
    
    var didWriteComment: ((String) -> Void)?
    
    func configureCellWith(viewModel: OrderViewModel){
    
    }
    
    let commentTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.italicSystemFont(ofSize: 16)
        tf.backgroundColor = .customGrey()
        let attributedText = NSAttributedString(string: "Напишите комментарий", attributes: [NSForegroundColorAttributeName: UIColor(red:0.56, green:0.56, blue:0.58, alpha:1.0)])
        tf.attributedPlaceholder = attributedText
        tf.layer.cornerRadius = 9.5
        tf.layer.masksToBounds = true
        
        return tf
    }()
    
    
    let countryTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 16)
        let attributedText = NSAttributedString(string: "Страна производитель", attributes: [NSForegroundColorAttributeName: UIColor(red:0.56, green:0.56, blue:0.58, alpha:1.0)])
        tf.attributedPlaceholder = attributedText
        tf.backgroundColor = .customGrey()
        tf.layer.cornerRadius = 9.5
        tf.layer.masksToBounds = true
        return tf
    }()
    
    
    let autoPartConditionTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 16)
        let attributedText = NSAttributedString(string: "Выберите состояние запчасти", attributes: [NSForegroundColorAttributeName: UIColor(red:0.56, green:0.56, blue:0.58, alpha:1.0)])
        tf.attributedPlaceholder = attributedText
        tf.backgroundColor = .customGrey()
        tf.layer.cornerRadius = 9.5
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let deliveryTF: UITextField = {
        let tf = UITextField()
        let attributedText = NSAttributedString(string: "Наличие доставки", attributes: [NSForegroundColorAttributeName: UIColor(red:0.56, green:0.56, blue:0.58, alpha:1.0)])
        tf.attributedPlaceholder = attributedText
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.backgroundColor = .customGrey()
        tf.layer.cornerRadius = 9.5
        tf.layer.masksToBounds = true
        return tf
    }()
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == commentTF {
            if let comment = commentTF.text {
                didWriteComment?(comment)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == autoPartConditionTF {
            
            deliveryTF.resignFirstResponder()
            countryTF.resignFirstResponder()
            commentTF.resignFirstResponder()
            autoPartConditionTF.resignFirstResponder()
            
            didChosePartCondition?()
            
        } else if textField == deliveryTF {
            
            deliveryTF.resignFirstResponder()
            countryTF.resignFirstResponder()
            commentTF.resignFirstResponder()
            autoPartConditionTF.resignFirstResponder()
            
            didChoseDeliveryType?()
        }  else if textField == countryTF {
            
            deliveryTF.resignFirstResponder()
            countryTF.resignFirstResponder()
            commentTF.resignFirstResponder()
            autoPartConditionTF.resignFirstResponder()
            
            didChoseCountries?()
        }
        
    }
    
    
    func handleKeyboard(){
        endEditing(true)
    }
    
    
    override func setupViews() {
        super.setupViews()
        setupToolBarKeyboard()
        
        
        commentTF.delegate = self
        countryTF.delegate = self
        autoPartConditionTF.delegate = self
        deliveryTF.delegate = self
        
        var customTopAnchor = topAnchor
        
        for count in 0...3 {
            
            let view = UIView()
            view.backgroundColor = .customGrey()
            view.layer.cornerRadius = 9.5
            view.layer.masksToBounds = true
            
            var top: CGFloat = 3
            if count != 0 {
                top = 10
            }
            contentView.addSubview(view)
            view.anchor(top: customTopAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: top, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 38)
            
            customTopAnchor = view.bottomAnchor
            
            if count == 0 {
                top = 3
                view.addSubview(commentTF)
                commentTF.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            } else if count == 1 {
                view.addSubview(countryTF)
                countryTF.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            } else if count == 2 {
                view.addSubview(autoPartConditionTF)
                autoPartConditionTF.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            } else if count == 3 {
                view.addSubview(deliveryTF)
                deliveryTF.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            }
        }
        
    }
    
    
    
    
    func setupToolBarKeyboard(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItemStyle.done, target: self, action: #selector(handleKeyboard))
        toolBar.setItems([doneButton], animated: false)
        commentTF.inputAccessoryView = toolBar
        
    }
    
}
