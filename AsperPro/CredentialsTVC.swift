//
//  CredentialsTVC.swift
//  AsperPro
//
//  Created by didarkam on 7/3/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit

class CredentialsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let timePicker = UIDatePicker()
    
    let timePicker1 = UIDatePicker()
    
    var selectedCarBrandIds = [Int]()
    
    var selectedServicesIds = [Int]()
    
    var selectedImageFromPicker: UIImage?
    
    var photoHash: String?
    
    var catalog: Catalog!{
        didSet{
            mainLabel.text = "Регистрация \(catalog.title)"
        }
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .mainWhite()
        return sv
    }()
    
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Регистрация СТО"
        lb.font = UIFont.systemFont(ofSize: 26)
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    let nameLB: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "Введите название Вашего сервиса"
        lb.textColor = .lightGray
        return lb
    }()
    
    let nameTf: UITextField = {
        let lb = UITextField()
        lb.backgroundColor = .tfColor()
        lb.text = ""
        return lb
    }()
    
    
    
    let addressLb: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "Введите адрес"
        lb.textColor = .lightGray
        return lb
    }()
    
    
    let addressTf: UITextField = {
        let lb = UITextField()
        lb.backgroundColor = .tfColor()
        lb.text = ""
        return lb
    }()
    
    
    
    let contactsLb: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "Контакты"
        lb.textColor = .lightGray
        return lb
    }()
    
    let contactsTf: UITextField = {
        let lb = UITextField()
        lb.backgroundColor = .tfColor()
        lb.text = ""
        lb.keyboardType = .numberPad
        return lb
    }()
    
    
    
    let descriptionLb: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "Описание"
        lb.textColor = .lightGray
        return lb
    }()
    
    
    let descriptionTF: UITextField = {
        let lb = UITextField()
        lb.backgroundColor = .tfColor()
        lb.text = ""
        return lb
    }()
    
    
    
    let workTimeLb: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "График работы"
        lb.textColor = .lightGray
        return lb
    }()
    
    
    
    let workTimeFromTF: UITextField = {
        let lb = UITextField()
        lb.backgroundColor = .tfColor()
        lb.text = ""
        return lb
    }()
    
    
    let workTimeToTf: UITextField = {
        let lb = UITextField()
        lb.backgroundColor = .tfColor()
        lb.text = ""
        return lb
    }()
    
    
    
    let addPhotoLb: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.text = "Добавить фото"
        lb.textColor = .lightGray
        return lb
    }()
    
    
    func handlePlusPhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "addDetail"), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
//        button.tintColor = .mainGreen()
        return button
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        createFromTimePicker()
        createToTimePicker()
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            uploadImage(image: selectedImage)
            plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func handleErrorAlert(){
        
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}






