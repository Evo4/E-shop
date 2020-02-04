//
//  Extensions.swift
//  E-shop
//
//  Created by Vyacheslav on 04.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import Foundation
import UIKit

var loadingIndicatorView : UIView?

extension UIViewController {
    func showIndicator(onView : UIView) {
        let indicatorView = UIView.init(frame: onView.bounds)
        indicatorView.backgroundColor = #colorLiteral(red: 0.5, green: 0.5019607843, blue: 0.5019607843, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = indicatorView.center
        
        DispatchQueue.main.async {
            indicatorView.addSubview(activityIndicator)
            onView.addSubview(indicatorView)
        }
        
        loadingIndicatorView = indicatorView
    }
    
    func removeIndicator() {
        DispatchQueue.main.async {
            loadingIndicatorView?.removeFromSuperview()
            loadingIndicatorView = nil
        }
    }
}
