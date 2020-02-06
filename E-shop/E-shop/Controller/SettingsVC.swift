//
//  SettingsVC.swift
//  E-shop
//
//  Created by Vyacheslav on 06.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 50
        imageView.image = #imageLiteral(resourceName: "profile_image.png")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.4431372549, alpha: 1)
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "Raleway-Regular", size: 17)
        textField.bottomLineBorder()
        textField.placeholder = "Name"
        return textField
    }()
    
    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.4431372549, alpha: 1)
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "Raleway-Regular", size: 17)
        textField.bottomLineBorder()
        textField.placeholder = "Surname"
        return textField
    }()
    
    private lazy var cacheLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Regular", size: 17)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Cache"
        return label
    }()
    
    private lazy var cacheSwitch: UISwitch = {
        let s = UISwitch()
        return s
    }()
    
    private lazy var cacheStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.cacheLabel, self.cacheSwitch])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 17)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstaints()
        setupGestures()
    }

    func setupAppearance() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let navTitleLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "Settings", attributes:[
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 17)!])
        navTitleLabel.attributedText = navTitle
        
        self.navigationItem.titleView = navTitleLabel
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let rightBarButton = UIBarButtonItem(customView: saveButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        [nameTextField, surnameTextField].forEach { (textField) in
            setupToolbar(textField: textField)
        }
    }
    
    func setupConstaints() {
        [profileImageView, nameTextField, surnameTextField, cacheStack].forEach { (subview) in
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            surnameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            surnameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cacheStack.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 30),
            cacheStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            cacheStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    func setupToolbar(textField: UITextField) {
        let toolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        toolbar.items = [
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))]
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
    }
    
    func setupGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(setProfilePhotoAction))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(gesture)
    }
    
    @objc func saveAction() {
        
    }
    
    @objc func doneAction() {
        self.view.endEditing(true)
    }
    
    @objc func setProfilePhotoAction() {
        
    }
}
