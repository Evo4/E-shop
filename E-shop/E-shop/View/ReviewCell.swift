//
//  ReviewCell.swift
//  E-shop
//
//  Created by Vyacheslav on 02.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    private lazy var reviewDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Raleway-Regular", size: 15)
        return label
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Raleway-Bold", size: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        label.numberOfLines = 0
        return label
    }()
    
    var review: Review? {
        didSet {
            guard let review = self.review else {return}
            userLabel.text = review.created_by.username
            reviewLabel.text = review.text
            reviewDateLabel.text = self.getReviewDate(stringDate: review.created_at)
            setupRateButtons(rate: review.rate)
//            print(review.created_at)
        }
    }
    
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
    }
    
    func setupConstraints() {
        [reviewDateLabel, userLabel, rateStackView, reviewLabel].forEach { (subview) in
            self.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            reviewDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            reviewDateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            
            userLabel.topAnchor.constraint(equalTo: reviewDateLabel.bottomAnchor, constant: 3),
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
    
    func setupRateButtons(rate: Int) {
        if rate > 0 {
            for i in 0..<rate {
                rateButons[i].setImage(#imageLiteral(resourceName: "filled_star"), for: .normal)
            }
            for i in rate..<rateButons.count {
                rateButons[i].setImage(#imageLiteral(resourceName: "star"), for: .normal)
            }
            rateButons.forEach { (button) in
                NSLayoutConstraint.activate([
                    button.widthAnchor.constraint(equalToConstant: 10),
                ])
            }
        } else {
            rateButons.forEach { (button) in
                button.setImage(#imageLiteral(resourceName: "star"), for: .normal)
                NSLayoutConstraint.activate([
                    button.widthAnchor.constraint(equalToConstant: 10),
                ])
            }
        }
    }
    
    func getReviewDate(stringDate: String)->String{
        let isoDateFormatter = ISO8601DateFormatter()
        guard let date = isoDateFormatter.date(from: stringDate) else {return ""}
//        print("input date: \(stringDate)    iso date: \(date)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let formattedDate = dateFormatter.string(from: date)
//        print("formatted: \(formattedDate)")
        return formattedDate
    }
    
}
