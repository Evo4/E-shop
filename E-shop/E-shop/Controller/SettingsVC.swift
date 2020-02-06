//
//  SettingsVC.swift
//  E-shop
//
//  Created by Vyacheslav on 06.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstaints()
    }

    func setupAppearance() {
        self.tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let navTitleLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "Settings", attributes:[
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 17)!])
        navTitleLabel.attributedText = navTitle
        
        self.navigationItem.titleView = navTitleLabel
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func setupConstaints() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
