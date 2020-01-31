//
//  MainVC.swift
//  E-shop
//
//  Created by Vyacheslav on 30.01.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "menuButton.png").withRenderingMode(.alwaysTemplate)
        
        button.setImage(imageView.image, for: .normal)
        button.addTarget(self, action: #selector(openMenuAction), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9607843137, blue: 0.9843137255, alpha: 1)
        return collection
    }()
    
    private lazy var sideMenuBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        view.alpha = 0
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstraints()
        addGestureToSideMenu()
        Service.shared.loadProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.layer.zPosition = -1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.layer.zPosition = 0
        self.navigationItem.title = " "
    }
    
    func setupAppearance() {
        let navTitleLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "E-shop", attributes:[
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 18)!])
        navTitleLabel.attributedText = navTitle
        self.navigationItem.titleView = navTitleLabel
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.768627451, blue: 0.2470588235, alpha: 1)
        let left = UIBarButtonItem(customView: menuButton)
        self.navigationItem.leftBarButtonItem = left
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "cell")
    }

    func setupConstraints() {
        [collectionView, sideMenuBackView].forEach { (subview) in
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            sideMenuBackView.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenuBackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            sideMenuBackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            sideMenuBackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    @objc func openMenuAction() {
        
    }
    
    func addGestureToSideMenu() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeSideMenu))
        sideMenuBackView.addGestureRecognizer(gesture)
    }
    
    @objc func closeSideMenu() {
        
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCell {
            cell.callback = { [weak self] in
                
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
}
