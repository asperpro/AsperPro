//
//  ItemCell.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class ItemCell: BaseCVCell {
    
    var isExtraOptionMode = false
    
    override var isSelected: Bool{
        
        didSet{
            
            if self.isSelected {
                
                backgroundColor = .mainOrange()
                titleLB.textColor = .white
                
                if isExtraOptionMode {
                    RegisterSingleton.sharedInstance.addSelectedExtraOptionWithId(id: serviceOrExtraOption.id)
                } else {
                    RegisterSingleton.sharedInstance.addSelectedServiceWithId(id: serviceOrExtraOption.id)
                }
                
                
            } else {
                
                backgroundColor = .white
                titleLB.textColor = .black
                
                
                if isExtraOptionMode {
                    RegisterSingleton.sharedInstance.removeDeselectedExtraOptionWithId(id: serviceOrExtraOption.id)
                } else {
                    RegisterSingleton.sharedInstance.removeDeselectedServiceWithId(id: serviceOrExtraOption.id)
                }
                
            }
            
            
            
        }
    }
    
    var serviceOrExtraOption: Service! {
        didSet{
            titleLB.text = serviceOrExtraOption.title
        }
    }
    
    
    let titleLB: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.adjustsFontSizeToFitWidth = true
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textAlignment = .center
        return lb
    }()
    
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        setupShadowAndCornerRadius()
        
        addSubview(titleLB)
        
        titleLB.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 9, paddingBottom: 00, paddingRight: 9, width: 0, height: 28)
        titleLB.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLB.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    func setupShadowAndCornerRadius(){
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowRadius = 5/2
        layer.shadowPath = nil
        layer.shouldRasterize = false
        layer.cornerRadius = 18.0
        
        
        
    }
}


extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

