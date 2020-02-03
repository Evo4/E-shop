//
//  Review.swift
//  E-shop
//
//  Created by Vyacheslav on 03.02.2020.
//  Copyright © 2020 Vyacheslav. All rights reserved.
//

import Foundation

struct Review {
    let id: Int
    let product: Int
    let text: String
    let created_by: User
    let created_at: Date
}
