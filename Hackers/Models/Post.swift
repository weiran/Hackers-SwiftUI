//
//  Post.swift
//  Hackers
//
//  Created by Weiran Zhang on 09/06/2019.
//  Copyright © 2019 Weiran Zhang. All rights reserved.
//

import SwiftUI

class Post : Identifiable {
    let id: Int
    let title: String
    let points: Int
    let commentsCount: Int
    let date: Date
    let location: URL
    
    init(id: Int, title: String, points: Int, commentsCount: Int, date: Date, location: URL) {
        self.id = id
        self.title = title
        self.points = points
        self.commentsCount = commentsCount
        self.date = date
        self.location = location
    }
}
