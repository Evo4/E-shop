//
//  ProductVC.swift
//  E-shop
//
//  Created by Vyacheslav on 31.01.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstraints()
    }
    
    func setupAppearance() {
        view.backgroundColor = #colorLiteral(red: 0.949000001, green: 0.9610000253, blue: 0.9840000272, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.768627451, blue: 0.2470588235, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    func setupConstraints() {
        
    }
}
