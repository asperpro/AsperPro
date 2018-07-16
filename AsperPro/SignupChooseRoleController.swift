//
//  SignupController.swift
//  AsperPro
//
//  Created by didarkam on 6/26/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

import Alamofire
import SwiftyJSON

class SignupChooseRoleController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    
    let cellId = "cellId"
    let headerCellId = "headerCellId"
    

    var catalogs = [Catalog]()
    
    
    let lb: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        let lb = UILabel()
        lb.text = "    Регистрация"
//        lb.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        lb.backgroundColor = .white
        lb.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(lb)
        lb.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 6, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        return view
    }()
    
    
    
    
    func fetchCatalogs(){
        
        let url = "https://asper.kz/api/catalog/list"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            if let dictionary = response.result.value {
                let JSONData = JSON(dictionary)
                
                
                guard let catalogsArray = JSONData["result"].array else {
                    return
                }
                self.catalogs = catalogsArray.map{Catalog(json: $0)}
                

                print(self.catalogs.count)
                self.collectionView?.reloadData()
            }
            
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(UserDefaults.standard.getAuthToken())
        let v = ChooseCatalogVC()
        v.catalog = catalogs[indexPath.item]
        navigationController?.pushViewController(v, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCatalogs()
        
        view.addSubview(lb)
        lb.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 64, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        view.backgroundColor = .white
        collectionView?.backgroundColor = .darkBackground()
        collectionView?.register(RoleCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView?.contentInset = UIEdgeInsetsMake(42, 15, 60, 15)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.backgroundColor = .darkBackground()
        
        
//        view.addSubview(proceedButton)
//        proceedButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 25
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogs.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 45 ) / 2, height: 165)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RoleCell
//        cell.iv.image = images[indexPath.item]
        cell.lb.text = catalogs[indexPath.item].title
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
////        if kind == UICollectionElementKindSectionHeader {
//
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId, for: indexPath)
//
//            headerView.frame.size.height = 100
//
//            return headerView
////        }
//    }
    
}


class HeaderCell: BaseCVCell {
    override func setupViews() {
        super.setupViews()
//        backgroundColor = .red
        
    }
}


class RoleCell: UICollectionViewCell {
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                backgroundColor = .mainOrange()
                lb.textColor = .white
            }
            else
            {
                backgroundColor = .white
                lb.textColor = .black
            }
        }
    }
    
    
    override var isHighlighted: Bool {
        didSet{
            if self.isHighlighted
            {
                backgroundColor = .mainOrange()
                lb.textColor = .white
            }
            else
            {
                backgroundColor = .white
                lb.textColor = .black
            }
        }
    }
    
    
    func setupViews(){
        
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: -1, height: -1)
        layer.shadowRadius = 10
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = false
        
        backgroundColor = .white
        
        
        addSubview(lb)
        lb.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width - 18, height: 20)
        lb.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lb.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
    
    let lb: UILabel = {
        let lb = UILabel()
        lb.text = "asdasdas asdasd"
        lb.textAlignment = .center
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    


}
