//
//  SignController+setupViews.swift
//  AsperPro
//
//  Created by didarkam on 7/5/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension SignInViewController {
    
    
    func setupViews(){
//        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        let lb = UILabel()
        lb.text = "Введите номер"
        lb.textColor = .darkGray
        lb.font = UIFont.systemFont(ofSize: 14)
        
        let lb2 = UILabel()
        lb2.text = "Введите код"
        lb2.textColor = .darkGray
        lb2.font = UIFont.systemFont(ofSize: 14)
        
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.contentSize = CGSize(width: view.frame.width, height: UIScreen.main.bounds.height + 100)
        
        scrollView.addSubview(iv)
        iv.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 117 - 64, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        iv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        scrollView.addSubview(lb)
        lb.anchor(top: iv.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 73, paddingBottom: 0, paddingRight: 0, width: 140, height: 14)
        
        scrollView.addSubview(phoneTf)
        phoneTf.anchor(top: lb.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 37)
        phoneTf.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        let seveniv = UIImageView()
        seveniv.image = #imageLiteral(resourceName: "seven")
        seveniv.contentMode = .scaleAspectFit
        
        phoneTf.addSubview(seveniv)
        seveniv.anchor(top: nil, left: phoneTf.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 35, height: 17)
        seveniv.centerYAnchor.constraint(equalTo: phoneTf.centerYAnchor).isActive = true
        
        scrollView.addSubview(lb1)
        lb1.anchor(top: phoneTf.bottomAnchor, left: lb.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 130, height: 14)
        
        
        scrollView.addSubview(codeTF)
        codeTF.anchor(top: lb1.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 230, height: 37)
        codeTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        scrollView.addSubview(resendCodeButton)
        resendCodeButton.anchor(top: codeTF.bottomAnchor, left: nil, bottom: nil, right: codeTF.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 160, height: 14)
        
        scrollView.addSubview(proceedButton)
        proceedButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor,     right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 20, paddingRight: 15, width: 0, height: 50)
        
        
    }
    
    
}

