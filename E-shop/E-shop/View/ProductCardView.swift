//
//  ProductCardView.swift
//  E-shop
//
//  Created by Vyacheslav on 02.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class ProductCardView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway-Regular", size: 27)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway-Regular", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.numberOfLines = 0
        return label
    }()
    
    let rateButons:[UIButton] = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupAppearance() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.cornerRadius = 15
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.25
        setupRateButtons()
    }
    
    func setupConstraints() {
        [titleLabel, descriptionLabel, rateStackView, reviewLabel, reviewTextView].forEach { (subview) in
            self.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            rateStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            rateStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            rateStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            rateStackView.heightAnchor.constraint(equalToConstant: 40),
            
            reviewLabel.topAnchor.constraint(equalTo: rateStackView.bottomAnchor, constant: 10),
            reviewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            reviewTextView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 4),
            reviewTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            reviewTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            reviewTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
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
}
