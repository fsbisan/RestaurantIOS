//
//  Product.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import Foundation

struct Product: Identifiable {
    var id: String
    var title: String
    var price: Int
    var description: String
    var imageUrl: String?
}
