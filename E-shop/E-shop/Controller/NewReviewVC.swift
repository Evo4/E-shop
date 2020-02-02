//
//  NewReviewVC.swift
//  E-shop
//
//  Created by Vyacheslav on 02.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class NewReviewVC: UIViewController {

    let rateButons:[UIButton] = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont(name: "Raleway-Regular", size: 17)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var sendReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 17)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(sendReviewAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var rateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: self.rateButons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway-Bold", size: 17)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Review:"
        return label
    }()
    
    private lazy var reviewTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.font = UIFont(name: "Raleway-Regular", size: 17)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstraints()
    }
    
    func setupAppearance() {
        view.backgroundColor = #colorLiteral(red: 0.949000001, green: 0.9610000253, blue: 0.9840000272, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.768627451, blue: 0.2470588235, alpha: 1)
        
        let navTitleLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "Review", attributes:[
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 17)!])
        navTitleLabel.attributedText = navTitle
        
        self.navigationItem.titleView = navTitleLabel
        
        let leftBarButton = UIBarButtonItem(customView: closeButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(customView: sendReviewButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        setupRateButtons()
    }
    
    func setupConstraints() {
        [rateStackView, reviewLabel, reviewTextView].forEach { (subview) in
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            rateStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            rateStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            rateStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            rateStackView.heightAnchor.constraint(equalToConstant: 40),
            
            reviewLabel.topAnchor.constraint(equalTo: rateStackView.bottomAnchor, constant: 10),
            reviewLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 4),
            reviewTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            reviewTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            reviewTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ])
    }
    
    func setupRateButtons() {
        rateButons.forEach { (button) in
            button.setImage(#imageLiteral(resourceName: "star"), for: .normal)
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 40),
            ])
        }
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func sendReviewAction() {
        
    }
}
