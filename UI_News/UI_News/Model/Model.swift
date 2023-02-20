//
//  Model.swift
//  UI_News
//
//  Created by Демьян Горчаков on 18.02.2023.
//

import Foundation

struct People: Codable {
    let users: [User]
}

struct User: Codable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String?
    let age: Int
    let image: String?
}
