//
//  CommentCell.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class CommentCell: BaseTVCell {
    
    
    let commentTF: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.italicSystemFont(ofSize: 16)
        tf.backgroundColor = .customGrey()
        let attributedText = NSAttributedString(string: "   Напишите комментарий", attributes: [NSForegroundColorAttributeName: UIColor(red:0.56, green:0.56, blue:0.58, alpha:1.0)])
        tf.attributedPlaceholder = attributedText
        tf.layer.cornerRadius = 9.5
        tf.layer.masksToBounds = true
        return tf
    }()
    
    
    func setupToolBarKeyboard(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItemStyle.done, target: self, action: #selector(handleKeyboard))
        toolBar.setItems([doneButton], animated: false)
        commentTF.inputAccessoryView = toolBar
    }
    
    
    override func setupViews() {
        super.setupViews()
        setupToolBarKeyboard()
        contentView.addSubview(commentTF)
        commentTF.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 3, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 38)
    }
    
    func handleKeyboard(){
        endEditing(true)
    }
    
    
}
