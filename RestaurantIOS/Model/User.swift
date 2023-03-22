//
//  User.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 21.03.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let login: String
    let role: String
}
