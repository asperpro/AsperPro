//
//  CredentialsVC+setupViews.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

extension CredentialsVC {
    
    func setupViews(){
        
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.contentSize = CGSize(width: view.frame.width, height: UIScreen.main.bounds.height + 250)
        
        scrollView.addSubview(mainLabel)
        mainLabel.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        scrollView.addSubview(nameLB)
        nameLB.anchor(top: mainLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        scrollView.addSubview(nameTf)
        nameTf.anchor(top: nameLB.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        scrollView.addSubview(addressLb)
        addressLb.anchor(top: nameTf.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        
        scrollView.addSubview(addressTf)
        addressTf.anchor(top: addressLb.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        
        
        scrollView.addSubview(contactsLb)
        contactsLb.anchor(top: addressTf.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        
        scrollView.addSubview(contactsTf)
        contactsTf.anchor(top: contactsLb.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        
        
        
        scrollView.addSubview(descriptionLb)
        descriptionLb.anchor(top: contactsTf.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        
        
        
        scrollView.addSubview(descriptionTF)
        descriptionTF.anchor(top: descriptionLb.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        
        
        scrollView.addSubview(workTimeLb)
        workTimeLb.anchor(top: descriptionTF.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        scrollView.addSubview(workTimeFromTF)
        workTimeFromTF.anchor(top: workTimeLb.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.centerXAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 30, width: 0, height: 37)
        
        
        scrollView.addSubview(workTimeToTf)
        workTimeToTf.anchor(top: workTimeLb.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: view.rightAnchor   , paddingTop: 10, paddingLeft: 30, paddingBottom: 0, paddingRight: 20, width: 0, height: 37)
        
        scrollView.addSubview(addPhotoLb)
        addPhotoLb.anchor(top: workTimeToTf.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 16)
        
        
        scrollView.addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: addPhotoLb.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 78, height: 78)
        plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        scrollView.addSubview(proceedButton)
        proceedButton.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 12, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 50)
    }
    
}
