//
//  PriceCell.swift
//  AsperPro
//
//  Created by didarkam on 6/21/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class PriceCell: BaseTVCell {
    
    
    
    var didSetPrice: ((String) -> Void)?
    
    var didDeclineOrder: (() -> Void)?
    
    var didCallButton: (() -> Void)?
    
    
    
    func configureCellWith(viewModel: OrderViewModel){
        
        if viewModel.phone == "" {
            
            setupWithoutPhone()
            
        } else {
            
            setupPhone()
            
        }
    }
    
    var stackViewBottomAnchor: NSLayoutYAxisAnchor?
    
    let enterPriceLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = "Укажите цену"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.numberOfLines = 3
        return lb
        
    }()
    
    
    
    let priceLabel: UITextField = {
        
        let lb = UITextField()
        lb.adjustsFontSizeToFitWidth = true
        lb.font = UIFont.systemFont(ofSize: 36)
        lb.backgroundColor = .clear
        lb.keyboardType = .numberPad
        lb.placeholder = "0"
        lb.textAlignment = .center
        return lb
        
    }()
    
    let priceImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "Tenge_sign")
        return iv
        
    }()
    
    
    
    let infoImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "Tooltip - Dark")
        return iv
        
    }()
    
    let phoneLabel: UILabel = {
        
        let lb = UILabel()
        lb.text = "Клиент решил скрыть свой номер"
        lb.adjustsFontSizeToFitWidth = true
        lb.font = UIFont.systemFont(ofSize: 14)
        return lb
        
    }()
    
    
    lazy var reserveButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.setTitle("Отправить", for: UIControlState())
        button.addTarget(self, action: #selector(handleReserveButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 2
        button.layer.masksToBounds = false
        return button
        
    }()
    
    
    lazy var callButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.setTitle("Позвонить", for: UIControlState())
        button.addTarget(self, action: #selector(handleCallButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 2
        button.layer.masksToBounds = false
        return button
        
    }()
    
    func handleCallButton(){
        
        didCallButton?()
    }
    
    
    lazy var cancelButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitle("Отменить", for: UIControlState())
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 2
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
        
    }()
    
    
    func handleCancelButton(){
        didDeclineOrder?()
    }
    
    func handleReserveButton(){
        guard let price = priceLabel.text, price.count > 1, price != "" else {return}
        didSetPrice?(price)
    }
    
    
    
    override func setupViews() {
        
        super.setupViews()
        
        contentView.addSubview(enterPriceLabel)
        enterPriceLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 13, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 120, height: 16)
        
        let myView = UIView()
        myView.backgroundColor = .gray
        contentView.addSubview(myView)
        
        contentView.addSubview(priceLabel)
        priceLabel.anchor(top: enterPriceLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 43)
        priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        priceLabel.addSubview(myView)
        myView.anchor(top: nil, left: priceLabel.leftAnchor, bottom: priceLabel.bottomAnchor, right: priceLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -25, width: 0, height: 0.4)
        
        contentView.addSubview(priceImageView)
        priceImageView.anchor(top: nil, left: priceLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 16, height: 16)
        priceImageView.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [cancelButton, reserveButton])
        
        stackView.axis = .horizontal
        stackView.spacing = 21
        stackView.distribution = .fillEqually
        
        
        contentView.addSubview(stackView)
        stackView.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 51, paddingBottom: 0, paddingRight: 51, width: 0, height: 30)
        stackViewBottomAnchor = stackView.bottomAnchor
        
        
    }
    
    func setupPhone(){
        
        contentView.addSubview(callButton)
        callButton.anchor(top: stackViewBottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 51, paddingBottom: 0, paddingRight: 51, width: 0, height: 30)
        
    }
    
    func setupWithoutPhone(){
        
        contentView.addSubview(infoImageView)
        infoImageView.anchor(top: stackViewBottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 70, paddingBottom: 0, paddingRight: 0, width: 16, height: 16)
        
        contentView.addSubview(phoneLabel)
        phoneLabel.anchor(top: stackViewBottomAnchor, left: infoImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 70, width: 0, height: 16)
        
    }
}
