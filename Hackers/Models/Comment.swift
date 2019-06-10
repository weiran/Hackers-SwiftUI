//
//  Comment.swift
//  Hackers
//
//  Created by Weiran Zhang on 10/06/2019.
//  Copyright © 2019 Weiran Zhang. All rights reserved.
//

import SwiftUI

class Comment: Identifiable {
    var id: Int
    var author: String
    var date: Date
    var contents: String
    var level: Int
    
    init(id: Int, author: String, date: Date, contents: String, level: Int = 0) {
        self.id = id
        self.author = author
        self.date = date
        self.contents = contents
        self.level = level
    }
}
