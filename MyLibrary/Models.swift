//
//  Models.swift
//  MyLibrary
//
//  Created by Test2 on 11/06/2022.
//

import Foundation

struct Book {
    let titleName: String
    let authorName: String
    var isRead: Bool
    let frontCoverImage: String
    let backCoverImage: String
//    let rank: Rank
    let rating: Int
    
}

enum Rank: Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}
