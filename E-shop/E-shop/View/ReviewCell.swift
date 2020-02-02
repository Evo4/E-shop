//
//  ReviewCell.swift
//  E-shop
//
//  Created by Vyacheslav on 02.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway-Bold", size: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "User"
//        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    let rateButons:[UIButton] = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
    
    private lazy var rateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: self.rateButons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway-Regular", size: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Review sample text"
        return label
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
        self.backgroundColor = #colorLiteral(red: 0, green: 0.7689999938, blue: 0.2469999939, alpha: 0.25)
        self.layer.cornerRadius = 10
        setupRateButtons()
    }
    
    func setupConstraints() {
        [userLabel, rateStackView, reviewLabel].forEach { (subview) in
            self.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            userLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            
            rateStackView.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 3),
            rateStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            rateStackView.heightAnchor.constraint(equalToConstant: 10),

            reviewLabel.topAnchor.constraint(equalTo: rateStackView.bottomAnchor, constant: 8),
            reviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -5),
            reviewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            reviewLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
        ])
    }
    
    func setupRateButtons() {
        rateButons.forEach { (button) in
            button.setImage(#imageLiteral(resourceName: "filled_star"), for: .normal)
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 10),
            ])
        }
    }
}
