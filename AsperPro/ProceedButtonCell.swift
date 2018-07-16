//
//  ProceedButtonCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class ProceedButtonCell: BaseTVCell {
    
    var delegate: ProceedButtonDelegate?
    
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
    
    func handleProceedButton(){
        delegate?.handleProceedButton()
        
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .mainBackground()
        addSubview(proceedButton)
        proceedButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, paddingRight: 15, width: 0, height: 50)
        
        
    }
}
